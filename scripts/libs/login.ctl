#uses "CtrlPv2Admin"
#uses "asModifyDisplay"

/**
 * @author jhercher
 * function handles what panel is opened after the login process
 * there are three posibilities:
 *   - a panel of choice / default panel
 *   - the old panel topology
 *   - the new panel topology
 * which of these possibilities are chosen depends on the following factors:
 *   - if a panel of choice is passed via the panel parameter the panel of choice will be opened
 *   - if no panel of choice is passed but also no panel topology is defined the default panel will be opened
 *   - if a new panel topology is available and correctly configured the new panel topology will be opened
 *   - if no new panel topology is available but the old PT is availabe the old PT will be opened
 *   - if old and new PT is defined, the new PT is opened, except for when openeing the new PT fails, then the old PT is opened
 *   - if none of the above cases happen nothing will be opened
 * all this only holds true if one is not using the demo application which is an extra use case on it's own
 * this is mainly due to be compatible with older versions of WinCC OA and not wanting to break any compatibility with the old afterlogin function
 *
 * @param user name of the user beeing logged in, is used to determine and load the users ui settings
 * @param password this parameter is deprecated and no longer used in the function
 * @param newLocale the language with which the module should be opened if different from current language switchLang() is called in a seperate control thread
 * @param closeModules (default value 1) determines if the module should be closed during the login process:
      - <0: Panel calling the function is closed
      - 0: Opens a new Module
      - 1: calling module is closed
      - 3: calling module is closed
 * @param iConfNum (default value 1) id of the userdefined screen configuration
 * @param panel (default emptystring) panel which should be opened
 * @param module (default WinCC_OA) name of the module to be opened
 */
void afterLogin(string user, string password, string newLocale, int closeModules = 1, int iConfNum = 1, string panel = "", string module = "WinCC_OA", dyn_string dollar = makeDynString())
{
  string myModule = closeModules > 0 ? myModuleName() : "";
  string locale = getLocale(getActiveLang());
  module = module == "" ? "WinCC_OA" : module;

  if(closeModules >= 0)
  {
    myModule = myModuleName();
  }
  else
  {
    if ( newLocale != locale && newLocale != "")
    {
      startThread("changeLang", newLocale);
    }
    else
    {
      PanelOff();
    }
  }

  unsigned x = 1000, y = 600;
  int panelNumber, templateNumber;

  switchToSplitWithActiveDrivers();

  bool useNewPT = dpExists("_" + getUserId(user) + "_UiConfiguration") || dpExists("_" + user + "_UiConfiguration");
  bool usePT = !(!dpExists("_PanelTopology") || !useNewPT && dpExists("_Default_UiConfiguration"));
  bool ownPanel = panel != "";
  bool newPtFailed = FALSE;

  if(usePT && !ownPanel)
  {
    usePT = getPtSize(panel, x, y, panelNumber, templateNumber);
  }

  if(!usePT && !useNewPT && panel == "")
  {
    panel = "vision/pvss";
  }

  if(isFunctionDefined("aes_setActiveColorScheme"))
  {
    aes_setActiveColorScheme();
  }

  if ( newLocale != locale && newLocale != "")
  {
    startThread("changeLang", newLocale);
  }

  if (checkModule(myModule, module, closeModules, FALSE))
  {
    waitForModule(module, FALSE);
  }

  playDemoStartUpSound();

  if(ownPanel || panel == "vision/pvss")
  {
    openAfterLoginModule(closeModules, module, x, y);

    ModuleOnWithPanel(module, 0, 0, 1920, 1080, 1, 1, "",
                      panel,
                      "",
                      dollar);

    //RootPanelOnModule(panel, "", module, dollar);

    if ( module != myModule && closeModules != 0)
    {
      ModuleOff(myModule);
    }
  }
  else if(useNewPT)
  {
    newPtFailed = !handleUseNewPt(iConfNum);
  }

  if(usePT && newPtFailed)
  {
    openAfterLoginModule(closeModules, module, x, y);

    handleUsePt(panel, module, myModule, closeModules, panelNumber, templateNumber);
  }

  msc_deleteFav(user, "lastScreenView");

  delay(0,50);

  if(globalExists("g_iNumberOfScreens"))
  {
    removeGlobalsPT();
  }

  PanelOff();
}

/**
 * @author jhercher
 * this function opens the module used after the login process if closeModules is set to 0
 * and module is not allready open
 * it is called by the afterlogin function
 *
 * @param closeModules passed by afterlogin function, only if 0 function opens module
 * @param module name of the module to be opened
 * @param x width of the module
 * @param y height of the module
 */
void openAfterLoginModule(int closeModules, string module, int x, int y)
{
  if (closeModules == 0 || !isModuleOpen(module))
  {
    ModuleOn(module, 0, 0, x, y, -1, -1, "Scale");

    waitForModule(module, TRUE);
  }
}

/**
 * @author jhercher
 * this function determines if a module must be closed or not depending on the closeModules parameter
 * it is called by the afterlogin function
 *
 * @param myModule name of the module that is currently used
 * @param module name of the module to be closed
 * @param closeModules passed by afterlogin function, if 1 or 3 module is considered for closing
 * @param noModuleOpenCheck if false isModuleOpen(myModule) is considered, if TRUE module doesn't need to be open
 *
 * @return TRUE if module shall be closed otherwise FALSE
 */
bool checkModule(string myModule, string module, int closeModules, bool noModuleOpenCheck)
{
  return (closeModules == 1 || closeModules == 3) &&
         myModule != "mainModule" &&
         myModule != "naviModule" &&
         myModule != "infoModule" &&
         myModule != module &&
         (isModuleOpen(myModule) || noModuleOpenCheck);
}

/**
 * @author jhercher
 * this function determines the size of the paneltopology after the login process
 * as well as getting the most fitting panel for that size
 *
 * @param panel returns the panel to be used for the paneltopology
 * @param x returns the width of the module
 * @param y returns the height of the module
 * @param panelNumber returns the panel Id to be used by the old panel topology
 * @param templateNumber return the template Id to be used by the old panel topology
 */
bool getPtSize(string &panel, unsigned &x, unsigned &y, int &panelNumber, int &templateNumber)
{
  dyn_string panels;
  unsigned xResolution, yResolution;
  string f;
  dyn_uint xs = makeDynInt(1600, 1280, 1024);
  dyn_uint ys = makeDynInt(1200, 1024, 768);

  dpGet("_PanelTopology.fileName:_online.._value", panels,
          "_PanelTopology.template.xResolution:_online.._value", xResolution,
          "_PanelTopology.template.yResolution:_online.._value", yResolution,
          "_PanelTopology.template.templateNumber:_online.._value", templateNumber);

  if (dynlen(panels) < 1 || panels[1] == "") //no panels available
  {
    return FALSE;
  }

  if (templateNumber == 4 )
  {
    f = getPath(PANELS_REL_PATH, "basePanel_user.pnl");
    panel = access(f, F_OK) == 0 ? "basePanel_user.pnl" : panel;
  }
  else
  {
    f = "";

    for (int i = 1; i <= dynlen(xs) ; i++)
    {
      if (xResolution == xs[i] && yResolution == ys[i])
      {
        f = getPath(PANELS_REL_PATH, "para/PanelTopology/templates/basePanel_" + i + "_" + templateNumber + ".pnl");
        panel = access(f, F_OK) == 0 ? "para/PanelTopology/templates/basePanel_" + i + "_" + templateNumber + ".pnl" : panel;
        panelNumber = i;
        break;
      }
    }
  }

  x = xResolution - 10;
  y = yResolution - 50;

  return TRUE;
}

/**
 * @author jhercher
 * this function handles opening the old paneltopology
 *
 * @parameter panel base panel to be opened
 * @parameter module name of the module to be used
 * @parameter myModule name of the module which is used right now
 * @parameter closeModules determines how to handle module opening or closing
 * @parameter panelNumber panel Id to be opened
 * @parameter templateNumber template Id to be opened
 */
void handleUsePt(string panel, string module, string myModule, int closeModules, int panelNumber, int templateNumber)
{
  if (isModuleOpen("naviModule"))
  {
    string navi = "para/PanelTopology/templates/naviPanel_";
    navi += dpExists("ApplicationProperties") && panel == "basePanel_user.pnl" ? "user.pnl" : panelNumber + "_" + templateNumber + ".pnl";

    RootPanelOnModule(navi, "Navi", "naviModule", makeDynString());
  }
  else
  {
    RootPanelOnModule(panel, "", module, "");
  }

  if (checkModule(myModule, module, closeModules, TRUE))
  {
    ModuleOff(myModule);
  }
  else if (myModule != module && closeModules != 0 )
  {
    PanelOff();
  }
}

/**
 * @author jhercher
 * this function handles the openeing of the new panel topology
 * if the new panel topology is configured in a way that it cannot be used (settings not loaded)
 * the function returns FALSE and the calling function (afterlogin) tries starting the old panel topology
 *
 * @param iConfNum configuration id of the screen configuration used by the logged in user
 *
 * @return FALSE if the new panel topology is configured in an incorrect way if successfully started TRUE
 */
bool handleUseNewPt(int iConfNum)
{
  if(!g_iNumberOfScreens || dynlen(g_diXRes)<=0 || dynlen(g_dsTemplates)<=0 )
  {
    return FALSE;
  }

  ptms_InitializeScreens(iConfNum);
  ptms_InitializeSystems();

  // HOOK >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HOOK
  // When a function 'HOOK_ScreenConfiguration()' is defined
  // then call this one to modify Screen Configuration.
  // The Configration can be modified by changing the values of the global Variables:
  // g_dbUsedScreens = dyn String of Used Screens
  // g_dsTemplates = dyn String of loaded templates
  // g_dsPanels = dyn String of loaded panels
  // g_dsCharacters = dyn String of Screen Characters

  if( isFunctionDefined( "HOOK_ScreenConfiguration" ) )
  {
    string strEval = "bool main(){ return HOOK_ScreenConfiguration(); }";
    bool bResult; //Result of the function

    evalScript( bResult, strEval, makeDynString() );
  }
  // HOOK <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< HOOK

  ptnavi_InitializeAfterLogin();
  ptms_LoadBasePanels();

  return TRUE;
}

/**
 * @author jhercher
 * this function opens or closes a module and waits until module is actually opened/closed
 *
 * @param module name of the module to be opened
 * @param open if TRUE module is opened if FALSE module is closed
 */
void waitForModule(string module, bool open)
{
  if(open)
  {
    ModuleOn(module);
  }
  else
  {
    ModuleOff(module);
  }

  while(isModuleOpen(module) != open)
  {
    delay(0, 100);
  }
}

/**
 * @author jhercher
 * helper function for after login function which removes all the global variables used for the
 * new panel topology
 */
void removeGlobalsPT()
{
  removeGlobal("g_iNumberOfScreens");
  removeGlobal("g_sConfigName");
  removeGlobal("g_dbUsedScreens"); // Used Screens
  removeGlobal("g_diXRes"); // Resolution of Screen
  removeGlobal("g_diYRes");
  removeGlobal("g_dsTemplates");  // Templates of the specific Screens
  removeGlobal("g_dsPanels");     // Panels to Load
  removeGlobal("g_dsCharacters"); // Characters of Screen
  removeGlobal("g_dsLCharacters");
  removeGlobal("g_dsRCharacters");
  removeGlobal("g_iActNumberOfScreens");
  removeGlobal("g_iDefaultResX");
  removeGlobal("g_iDefaultResY");
  removeGlobal("g_sDefaultTemplate");
}

//**************************
changeLang(string newLocale)
{
  int err = switchLang(getLangIdx(newLocale));
}

//**************************
playDemoStartUpSound()
{
  bool           onStartEnabled;
  string         soundfile;

  //**** mhalper: only if demo application*****************************
  if (dpExists("ApplicationProperties"))
  {
    dpGet("ApplicationProperties.sound.onStart:_online.._value",        soundfile,
          "ApplicationProperties.sound.onStartEnabled:_online.._value", onStartEnabled);

    //On every new login play the startup-sound
    if (onStartEnabled == 1) da_startSound(soundfile,FALSE);
  }
  //*******************************************************************
}

/**
  @author jhercher
  @brief returns the panel used for login as defined in config file
  @return relative panel path
*/
string getLoginPanel()
{
  string defaultLoginPanel, key;

  if (isLocalUi())
  {
    defaultLoginPanel = "login_base.pnl";
    key = "loginPanelLocal";
  }
  else
  {
    defaultLoginPanel = "vision/loginFramework/login_Server.pnl";
    key = "loginPanelServer";
  }

  string loginPanel = paCfgReadValueDflt(getPath(CONFIG_REL_PATH, "config"), "ui", key, defaultLoginPanel);
  string path = getPath(PANELS_REL_PATH, loginPanel);

  if (isfile(path))
    return loginPanel;

  return defaultLoginPanel;
}

/**
 * @author jhercher
 * function checks if a UI authenticates on the Server or Local
 * @return bool ... true if UI uses client side authentication (local) else false (serverside authentication)
 */
bool isLocalUi()
{
  string serverUrl = getActiveHttpServerUrl();
  string accessControlPlugin;
  int clientSideAuth = paCfgReadValueDflt(getPath(CONFIG_REL_PATH, "config"), "webClient", "clientSideAuth", 1);

  if(isSSASession() ||(serverUrl != "" && clientSideAuth == 0))
  {
    return FALSE;
  }
  return TRUE;
}

/**
 * @author jhercher
 * function checks if the AccessControlPlugin SessionToken mechanism was used to authenticate the UI's user
 * @return bool ... true if UI was authenticated via SessionToken else false
 */
bool isSSASession()
{
  if(myManType() == UI_MAN)
  {
    int manNum = myManNum();
    string sessionToken;
    string dp = "_Ui_" + manNum + ".SessionToken";

    dpGet(dp, sessionToken);

    if (sessionToken == ":-1: ")
    {
      return true;
    }

    dyn_string sessionTokens;
    dpGet("_System.Auth.SessionToken", sessionTokens);

    for(int i = 1; i <= dynlen(sessionTokens); i++)
    {
      mapping sessionTokenJson = jsonDecode(sessionTokens[i]);

      if(mappingHasKey(sessionTokenJson, "SessionToken") &&
         mappingHasKey(sessionTokenJson, "SessionTimeout") &&
         sessionTokenJson["SessionToken"] == sessionToken &&
         sessionTokenJson["SessionTimeout"] == "-1")
      {
        return TRUE;
      }
    }
  }

  return FALSE;
}
