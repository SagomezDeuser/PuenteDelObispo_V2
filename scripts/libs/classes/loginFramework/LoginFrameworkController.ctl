/**
  @file $relPath
  @brief LoginFrameworkController
*/

/**
  @brief LoginFrameworkController class.
*/

#uses "std"
#uses "login"
#uses "classes/auth/OaAuthUI"
#uses "classes/CommandInterface"
#uses "msc_multiScreening"        // Used by afterLogin for 'msc_deleteFav'
#uses "classes/loginFramework/LoginFrameworkChildView"
#uses "classes/loginFramework/LoginFrameworkView"

/**
  @brief Const variables to access corresponding properties of UI elements.
*/
const string TEXT = "text";
const string ENABLED = "enabled";
const string TOOLTIP = "toolTipText";
const string VISIBLE = "visible";

/**
  @brief Enum containing the states the LoginFramework can be in.
  The enum is sorted by order of appearance, meaning SYSTEMUSENOTIFICATION follows LOGIN
  and CLOSE follows SYSTEMUSENOTIFICATION.
  The enum is used to load the correct panel when moving forward or back in the Framework.
*/
enum LoginFrameworkState
{
  LOGIN,
  SYSTEMUSENOTIFICATION,
  CLOSE
};
/**
  @brief LoginFrameworkController class.
  @details The login framework consists of views. A view represents a panel. Each panel that is loaded in
  the login framework must possess a controller and create a view. The view is assigned to the controller.
  See also chapter Login framework, basics.

  The LoginFrameworkController class implements the controller logic to control the panels.
  The LoginFrameworkController class is a mediator between the different panels (parent and child) of the login framework.
  The LoginFrameworkController class is also a singleton meaning that only one instance of the class exists at any time.
  This class is part of a simplified MVC (Model View Controller) pattern.

  Each panel in the login framework receives the instance of the LoginFrameworkController class.
  A panel again must pass an instance to the LoginFrameworkController class by using the setLoginFrameworkChildView() method.
  Via the function setLoginFrameworkChildView() a panel view is assigned to a controller.

  @note
  Note that you do not have to change the LoginFrameworkController class.
  Implement the necessary methods and call the necessary
  methods of the LoginFrameworkController class in the LoginFrameworkChildView class.
*/

class LoginFrameworkController
{
  //singleton instance
  static private shared_ptr<LoginFrameworkController> instance;
  private LoginFrameworkView m_loginFrameworkView;
  private shared_ptr<LoginFrameworkChildView> m_loginFrameworkChildView; //shared_ptr because each child implements its own subclass
  private shared_ptr<OaAuthUI> m_ui;
  private bool m_useUserLanguage = TRUE;
  private bool m_openMonitorConfiguration = FALSE;
  private LoginFrameworkState m_state = LoginFrameworkState::LOGIN; //framework always starts with Login
  private string m_panel;
  private string m_module;
  private dyn_string m_dollar;
  private int m_closeModules = 0; //default value is 0
  private string m_loginPanel;
  private const string DEFAULT_LOGIN_PANEL = "vision/login.pnl";

  /**
   * Constructor of this class
   * must be private to accomodate Singleton pattern
  */
  private LoginFrameworkController(){}

  //--------------------------------------------------------------------------------
  //@public members
  //--------------------------------------------------------------------------------

  /**
    @brief This function returns the instance of this class. If an instance has not been created yet
    , a new instance is created. Otherwise the already created instance is returned.
    @return shared_ptr<LoginFrameworkController> instance of class LoginFrameworkController.
  */
  static public shared_ptr<LoginFrameworkController> getInstance()
  {
    if(instance == nullptr)
    {
      instance = new LoginFrameworkController();
    }

    return instance;
  }

  /**
    @brief The function passes the view of the base panel to the controller.
    @param loginFrameworkView View representation of the base panel.
  */
  public void setLoginFrameworkView(LoginFrameworkView loginFrameworkView)
  {
    m_loginFrameworkView = loginFrameworkView;
  }

  /**
    @brief The function passes the View of the child panel to the controller and deletes the previous child view
    from the member variable. This is done because at any time only one childview must be present and
    it must be the corresponding child view of the child panel
    Call the method in the LoginFrameworkChildView class and pass the child panel view by using
    the parameter "loginFrameworkChildView".

    At the end of the method the language is set so that the child panel is loaded by using the active language.
    @param loginFrameworkChildView The parameter loginFrameworkChildView is a
    view object representing the current child panel.
  */
  public void setLoginFrameworkChildView(shared_ptr<LoginFrameworkChildView> loginFrameworkChildView)
  {
    m_loginFrameworkChildView = nullptr; //object expects an object of the previously saved subtype here so we need to remove it
    m_loginFrameworkChildView = loginFrameworkChildView;

    if(!m_loginFrameworkView.isInitialized())
    {
      this.initializeLanguage();
      m_loginFrameworkView.setInitialized(TRUE);
    }

    this.setLanguage();
  }

  /**
    @brief The method saves an OaAuthUI object in the controller instance.
    This must be the same instance that is used by the initialize event of the login panel wincc_oa_path/panels/vision/login.pnl.
    This provides full functionality of the class based authentication process
    @param ui An object of the OaAuthUI class.
    The parameter shared_ptr is used to guarantee that the same instance
    as in the login panel is used.
  */
  public void setOaAuthUI(shared_ptr<OaAuthUI> ui)
  {
    m_ui = nullptr;
    m_ui = ui;
  }

  /**
    @brief The function returns the member variable m_ui.
    @return shared_ptr<OaAuthUI> An object of type OaAuthUI.
  */
  public shared_ptr<OaAuthUI> getUI()
  {
    return m_ui;
  }

  /**
    @brief The function transitions the internal state to the next state.
    @details If the state was LOGIN, the next state depends on whether the sysusenotifications
    are activated or not. The state after SYSTEMUSENOTIFICATION must be CLOSE.
    CLOSE is the last state. No further states exist.
  */

  //--------------------------------------------------------------------------------
  //@private members
  //--------------------------------------------------------------------------------

  private void nextState()
  {
    switch(m_state)
    {
      case LoginFrameworkState::LOGIN:
        if(this.useSystemNotification())
        {
          m_state = LoginFrameworkState::SYSTEMUSENOTIFICATION;
        }
        else
        {
          m_state = LoginFrameworkState::CLOSE;
        }
        break;
      case LoginFrameworkState::SYSTEMUSENOTIFICATION:
        m_state = LoginFrameworkState::CLOSE;
        break;
      default:
        break;
    }
  }

  /**
   *
   * function transitions internal state to the previous state
   * if the state was SYSTEMUSENOTIFICATION the previous state could be CLOSE or LOGIN depending if the
   * UI runs locally or is connected via serversideauthentication
   * the previous state of LOGIN is CLOSE
   * CLOSE has no previous state.
   */
  private void previousState()
  {
    switch(m_state)
    {
      case LoginFrameworkState::SYSTEMUSENOTIFICATION:
        m_state = LoginFrameworkState::LOGIN;
        break;
      case LoginFrameworkState::LOGIN:
        m_state = LoginFrameworkState::CLOSE;
        break;
      default:
        break;
    }
  }

  //--------------------------------------------------------------------------------
  //@public members
  //--------------------------------------------------------------------------------

  /**
    brief The method allows setting the current state of the login process manually.
    There are three different states in the login framework: "Login", "Systemusenotification" and "Close".
    @param state The parameter "state" can be one of the three states:
    "Login", "Systemusenotification" and "Close".
  */
  public void setState(LoginFrameworkState state)
  {
    m_state = state;
  }

  /**
    @brief The method returns the current state of the login process saved in the member variable m_state.
    There are three different states in the login framework: "Login", "Systemusenotification" and "Close".
    @return LoginFrameworkState m_state State of the login process saved in the member variable m_state.
  */
  public LoginFrameworkState getState()
  {
    return m_state;
  }

  /**
    @brief The method sets the panel that should be opened after the login process.
    @param panel Relative path to the panel that should be opened.
  */
  public void setPanel(string panel)
  {
    m_panel = panel;
  }

  /**
    @brief The method sets the module that should be opened after the login process.
    @param module Name of the module that should be opened.
  */
  public void setModule(string module)
  {
    m_module = module;
  }

  /**
    @brief The method sets the dollar parameters for the panel that is opened after the login process.
    @param dollar Dollar parameters as string
    @param delimiter Optional parameter to change the delimiter when coverting from string to dyn_string.
  */
  public void setDollar(string dollar, string delimiter = "|")
  {
    m_dollar = stringToDynString(dollar, delimiter);

    for(int i = 1; i <= dynlen(m_dollar); i++)
    {
      dyn_string tempDollar = stringToDynString(m_dollar[i], ":");
      if(dynlen(tempDollar) == 2)
      {
        m_dollar[i] = "$" + m_dollar[i];
      }
    }
  }

  /**
    @brief The method sets the closeModules parameter that will be used in the afterlogin call.
    @param closeModules Value to be assigned to the member variable m_closeModules.
  */
  public void setCloseModules(int closeModules)
  {
    m_closeModules = closeModules;
  }

  /**
    @brief The method sets the m_loginPanel member variable. If this variable is set, the panel defined by this string
    will be loaded if the loginFramework is in the state LOGIN. See also the getNextPanel() method.
    @param loginPanel A panel that is loaded and is assigned to the member variable m_loginPanel.
  */
  public void setLoginPanel(string loginPanel)
  {
    m_loginPanel = loginPanel;
  }

  /**
    @brief The method sets the member variable m_useUserLanguage, which determines if the UI should be started with the
    language selected via the check box "Load user-specific project language" or the language saved in the users
    data point _Users.Language. The language that was selected e.g. via the User administration panel is saved in the
    _Users.Language DP. If the _Users.Language does not contain a language, the language of the "Load user-specific
    project language" check box is used.

    @details If you want to open the user interface via a user-specific panel by using a specific language, implement the check box.
    @param useUserLanguage TRUE if saved language should be used and FALSE if selected language should be used.
    Set the parameter useUserLanguage to TRUE if the language saved in the users data point _Users.Language should be used
    and to FALSE if the language selected via the check box "Load user-specific project language" should be used.
  */
  public void setUseUserLanguage(bool useUserLanguage)
  {
    m_useUserLanguage = useUserLanguage;
  }

  /**
    @brief The method sets the member variable m_openMonitorConfiguration, which determines if the monitor settings dialog
    is opened before starting the UI.
    @param openMonitorConfiguration The parameter openMonitorConfiguration specifies whether the monitor
    settings dialog is opened (TRUE) or not (FALSE).
  */
  public void setOpenMonitorConfiguration(bool openMonitorConfiguration)
  {
    m_openMonitorConfiguration = openMonitorConfiguration;
  }

  /**
    @brief The method calls the loginFrameworkView class to set the enabled state of the "Accept" button btn_accept of
    the wincc_oa_path/panels/vision/login.pnl.
    @param enabled The parameter "enabled" enables (TRUE) or disables (FALSE) the Accept
    button of wincc_oa_path/panels/vision/login.pnl.
  */
  public void setBtnAcceptEnabled(bool enabled)
  {
    m_loginFrameworkView.setObjectEnabled(m_loginFrameworkView.getBtnAccept(), enabled);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the text of the button
    "Accept" btn_accept of the wincc_oa_path/panels/vision/login.pnl.
    @param text The parameter text specifies the text for the button "Accept" of the
    wincc_oa_path/panels/vision/login.pnl.
  */
  public void setBtnAcceptText(string text)
  {
    m_loginFrameworkView.setObjectText(m_loginFrameworkView.getBtnAccept(), text);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the tooltip of the button
    btn_accept of the wincc_oa_path/panels/vision/login.pnl.
    @param toolTip The parameter tooltip specifies the tooltip for the button
    "Accept" of the wincc_oa_path/panels/vision/login.pnl.
  */
  public void setBtnAcceptToolTip(string toolTip)
  {
    m_loginFrameworkView.setObjectToolTip(m_loginFrameworkView.getBtnAccept(), toolTip);
  }

  /**
    @brief The function calls the loginFrameworkView class to set the visible state of the button Accept
    (btn_accept) of the wincc_oa_path/panels/vision/login.pnl.
    @param visible The parameter visible sets the visible state of the  button "Accept" of the wincc_oa_path/panels/vision/login.pnl.
    - TRUE = visible
    - FALSE = invisible
  */
  public void setBtnAcceptVisible(bool visible)
  {
    m_loginFrameworkView.setObjectVisible(m_loginFrameworkView.getBtnAccept(), visible);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the enabled state of the button Cancel (btn_cancel) of
    the wincc_oa_path/panels/vision/login.pnl.
    @param enabled The parameter enabled sets the enabled state of the  button "Cancel" of the
    wincc_oa_path/panels/vision/login.pnl.
    - TRUE = enabled
    - FALSE = disabled
  */
  public void setBtnCancelEnabled(bool enabled)
  {
    m_loginFrameworkView.setObjectEnabled(m_loginFrameworkView.getBtnCancel(), enabled);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the text of the button Cancel (btn_cancle)
    of the wincc_oa_path/panels/vision/login.pnl.
    @param text The parameter text sets the text of the button "Cancel" of the
    wincc_oa_path/panels/vision/login.pnl.
  */
  public void setBtnCancelText(string text)
  {
    m_loginFrameworkView.setObjectText(m_loginFrameworkView.getBtnCancel(), text);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the tooltip of the button Cancel (btn_cancel)
    of the wincc_oa_path/panels/vision/login.pnl.
    @param toolTip The parameter tooltip sets the tooltip of the button "Cancel" of the
    wincc_oa_path/panels/vision/login.pnl.
  */
  public void setBtnCancelToolTip(string toolTip)
  {
    m_loginFrameworkView.setObjectToolTip(m_loginFrameworkView.getBtnCancel(), toolTip);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the visible state of the button Cancel (btn_cancle)
    of the wincc_oa_path/panels/vision/login.pnl.
    @param visible The parameter visible sets the visible state of the button "Cancel" of the
    wincc_oa_path/panels/vision/login.pnl.

    - TRUE = visible
    - FALSE = invisible
  */
  public void setBtnCancelVisible(bool visible)
  {
    m_loginFrameworkView.setObjectVisible(m_loginFrameworkView.getBtnCancel(), visible);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the items of the language combo box of
    the wincc_oa_path/panels/vision/login.pnl.
    @param items The parameter "items" contains all available languages such as "de_AT.utf8".
  */
  public void setCmbBxLanguageItems(dyn_string items)
  {
    m_loginFrameworkView.setCmbBxLanguageItems(items);
  }

  /**
    @brief The method is called when the selected language in the language combo box of the
    wincc_oa_path/panels/vision/login.pnl. is changed. The method then changes the current language index.
    @param language The parameter language is a language identifier such as  "de_AT.utf8".
  */
  public void setCmbBxLanguageChanged(string language)
  {
    int langIndex = getLangIdx(language);
    m_loginFrameworkView.setLangIndex(langIndex);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the visible state of the text txt_platform
    of the wincc_oa_path/panels/vision/login.pnl.
    @param visible The parameter visible sets the visible state of the text txt_platform of
    the wincc_oa_path/panels/vision/login.pnl.

    - TRUE = visible
    - FALSE = invisible
  */
  public void setTxtPlatformVisible(bool visible)
  {
    m_loginFrameworkView.setObjectVisible(m_loginFrameworkView.getTxtPlatform(), visible);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the visible state of the text txt_version of
    the wincc_oa_path/panels/vision/login.pnl.
    @param visible The parameter visible sets the visible state of the text  txt_version of
    the wincc_oa_path/panels/vision/login.pnl.

    - TRUE = visible
    - FALSE = invisible
  */
  public void setTxtVersionVisible(bool visible)
  {
    m_loginFrameworkView.setObjectVisible(m_loginFrameworkView.getTxtVersion(), visible);
  }

  /**
    @brief The method calls the loginFrameworkView class to set the visible state of the text txt_welcome
    of the wincc_oa_path/panels/vision/login.pnl.
    @param visible The parameter visible sets the visible state of the text txt_welcome of the
    wincc_oa_path/panels/vision/login.pnl.

    - TRUE = visible
    - FALSE = invisible
  */
  public void setTxtWelcomeVisible(bool visible)
  {
    m_loginFrameworkView.setObjectVisible(m_loginFrameworkView.getTxtWelcome(), visible);
  }

  /**
    @brief The method is called when clicking the btn_action button.
    The state is transitioned to the next state and the action method of the child panel
    is executed.
  */
  public void doContinue()
  {
    this.nextState();
    m_loginFrameworkChildView.doContinue();
  }

  /**
    @brief The method is called when clicking the btn_cancel (Cancel) button.
    The state is transition to the previous state and the cancel method of the child
    panel is executed.
  */
  public void doCancel()
  {
    this.previousState();
    m_loginFrameworkChildView.doCancel();
  }

  /**
    @brief The method loads the given panel as child panel into the base panel. If another child panel
    already exists it is removed first.
    @param panel The panel which should be added as child panel.
    @param dollars Optional parameter dollar parameters that are used in the child panel.
  */
  public void switchPanel(string panel, dyn_string dollars = makeDynString())
  {
    m_loginFrameworkView.switchPanel(panel, dollars);
  }

  /**
    @brief The method delegates the openHelp call to the child panel which opens the help with the
    keyword fitting the context. E.g. SystemUseNotification panel and login panel open a different
    page of the online help.
  */
  public void openHelp()
  {
    m_loginFrameworkChildView.openHelp();
  }

  /**
    @brief The method returns the index of the selected language.
    @return m_loginFrameworkView Index of the selected language.
  */
  public int getLangIndex()
  {
    return m_loginFrameworkView.getLangIndex();
  }

  /**
    @brief The method sets the selected language for all objects in the views/panels of the login framework.
    The selected language is the language that was selected from the language combo box in the login panel.

    @note The language is not set via the switchlang() function since it would open and close the panel.
  */
  public void setLanguage()
  {
    m_loginFrameworkView.setLanguage();
    m_loginFrameworkChildView.setLanguage(this.getLangIndex());
  }

  /**
    @brief The method returns the information whether system use notifications are used or not.
    @return bool The method returns TRUE if system use notifications are used or FALSE if not.
  */
  public bool useSystemNotification()
  {
    bool enabled;
    if(dpExists("_SystemUseNotification_0001"))
    {
      dpGet("_SystemUseNotification_0001.Enabled", enabled);
      return enabled;
    }
    return FALSE;
  }

  /**
    @brief The method returns the path of the next panel in the login framework structure.
    @details There are three states in the login framework: "Login", "Systemusenotification" and "Close"
    In case of the login panel (LOGIN state), this method uses the getLoginPanel() method to determine
    which panel should be loaded. The method "getNextPanel" reads the config entries: loginPanelLocal
    (default: panels/vision/loginFramework/login_Standard.pnl) and loginPanelServer
    (default: panels/vision/loginFramework/login_Server.pnl). If the state is SYSTEMUSENOTIFICATION ("Systemusenotification"),
    the method returns the path to the Systerm use notifcation panel. The state (CLOSE) does not have
    a "next" panel in the login framework structure.
    @return string panel The path to the next child panel.
  */
  public string getNextPanel()
  {
    string panel = "";

    switch(m_state)
    {
      case LoginFrameworkState::LOGIN:
        panel = m_loginPanel != "" ? m_loginPanel : getLoginPanel();
        break;
      case LoginFrameworkState::SYSTEMUSENOTIFICATION:
        panel = "vision/loginFramework/SystemUseNotification.pnl";
        break;
      default:
        break;
    }

    return panel;
  }

  /**
    @brief The method startLogin() starts the login process. Call the method in order to log in.
  */
  public void startLogin()
  {
    if(m_ui.setUiUser())
    {
      this.setShapes(FALSE);
      m_ui.updateNewPanelTopology(); // in case panel topology has been created while panel was already open

      this.startUserInterface();

      this.setShapes(TRUE);
    }
    else
    {
      OaAuthenticationError err = OaAuthenticationError::UserNotAuth;
      string message = getCatStr("OaLogin", OaAuthError::getErrorKeyword(err), m_loginFrameworkController.getLangIndex());
      displayFailedLogin(message);
    }
  }

  /**
    @brief The method displays a warning panel when the login via the login.pnl fails.
    @param reason String that specifies the reason why the login failed.
  */
  public void displayFailedLogin(string reason)
  {
    dyn_string result;
    dyn_float fResult;

    ChildPanelOnCentralModalReturn("vision/MessageWarning", getCatStr("general", "warning"), makeDynString(reason), fResult, result);
  }

  /**
    @brief The method defines a device related login panel.
    @note The method does not check if related login panel does exist.
    @attention The method process the login_Standard panel only.

    @param mainLoginPanel String that contains the main panel path, which will be
    used to generate the appropriate login panel.
    @return The defined login panel or an empty string if the panel cannot be defined or not login_Standard panel.
  */
  public string deviceClassLoginPanel(const string &mainLoginPanel)
  {
    string panelFilePath = makeUnixPath(mainLoginPanel);
    const string loginPanel = makeUnixPath(getLoginPanel());
    const string standardLoginPanel = "vision/loginFramework/login_Standard.pnl";

    // check if it is a deviceClass of the login panel and login_Standard is defined as default login
    if ( panelFilePath.endsWith(DEFAULT_LOGIN_PANEL) &&
         (loginPanel == standardLoginPanel || loginPanel == "/" + standardLoginPanel) )
    {
      panelFilePath.remove(panelFilePath.lastIndexOf(DEFAULT_LOGIN_PANEL, -1, string::CaseInsensitive), panelFilePath.length());
      panelFilePath = panelFilePath + loginPanel;
    }
    else
    {
      panelFilePath.clear();
    }

    return panelFilePath;
  }

  //--------------------------------------------------------------------------------
  //@private members
  //--------------------------------------------------------------------------------

  /**
    * function starts the UI and sets the necessary options for the HMI to work
  */
  private void startUserInterface()
  {
    bool loadFromDp = TRUE;
    int configNumber;

    m_ui.setManagerUser();

    if(m_ui.getNewPanelTopology())
    {
      CommandInterface::commandCreateUserUiConfigurationDp(getUserId(m_ui.getUsername()));
      configNumber = m_ui.getMonitorConfigNumber();
      if (m_openMonitorConfiguration)
      {
        bool success = this.selectMultiScreenPara(configNumber);
        if(!success)
        {
          return;
        }
        else
        {
          loadFromDp = FALSE;
        }
      }

      if (loadFromDp)
      {
        m_ui.initPtms(configNumber);
      }
    }

    string nom_user = "$NOM_USUARIO:" + m_ui.getUsername();
    // password is actually not used in this function therefor we just pass empty string
    afterLogin(m_ui.getUsername(), "", this.getLanguageForUI(), m_closeModules, configNumber, "vision/sinopticos/00_principal/principal/despliegue_pantallas.pnl", m_module, nom_user);
  }

  //--------------------------------------------------------------------------------
  //@public members
  //--------------------------------------------------------------------------------

  /**
    @brief handles the SSO login mechanism.
  */
  public void handleSSO()
  {
    if(m_ui.isSSOEnabled())
    {
      setShapes(FALSE);

      delay(1); //to give the user the possibility to change the language
      this.doContinue();
    }
  }

  //--------------------------------------------------------------------------------
  //@private members
  //--------------------------------------------------------------------------------

  /*
    @brief de/activates control shapes in login panel
    @param enabled TRUE to activate control shapes, FALSE to deactivate them.
  */
  private void setShapes(bool enabled)
  {
    if(m_ui.isSSOEnabled())
    {
      if(enabled)
      {
        this.setBtnAcceptEnabled(enabled);
        this.setBtnCancelEnabled(enabled);
      }
    }
    else
    {
      this.setBtnAcceptEnabled(enabled);
      this.setBtnCancelEnabled(enabled);
    }
  }

  /*
    @brief Opens the multimonitor configuration panel
    @param iConfigNum Number of config for a user.
  */
  private bool selectMultiScreenPara(int &iConfigNum)
  {
    if (openMultiMonitorPara(m_ui.getUsername(), iConfigNum) == 1)
    {
      return TRUE;
    }
    return FALSE;
  }

  /**
   * The function initializes the language combobox with all available languages for the current project
   */
  private void initializeLanguage()
  {
    dyn_string dsLangs;

    for(int i = 0; i < getNoOfLangs(); i++)
    {
      dynAppend(dsLangs,getLocale(i));
    }

    this.setCmbBxLanguageItems(dsLangs);
    this.setCmbBxLanguageChanged(m_loginFrameworkView.getObjectText(m_loginFrameworkView.getCmbBxLanguage()));
  }

  /**
   *
   * function returns the language that will be used in the HMI. in case the member variable
   * m_useUserLanguage is set to TRUE the language is read from the user object stored in the m_ui member
   * which read the language from the datapoint. otherwise the currently selected language is chosen.
   *
   * @return string language Language to be used for the HMI (e.g. de_AT.utf8)
   */
  private string getLanguageForUI()
  {
    string language;
    if(m_useUserLanguage)
    {
      language = m_ui.getUserLanguage();
    }
    else
    {
      language = getLocale(this.getLangIndex());
    }

    return language;
  }
};

  /**
    @brief Loads the <a href="qthelp://wincc_oa/doc/UserAdmin/UserAdmin-18.htm">Multi-Screen Configuration Panel</a>
    @param user The user whose configuration is loaded.
    @param &iConfigNum The screen configuration number that should be loaded.
  */
int openMultiMonitorPara(string user, int &iConfigNum)
{
  dyn_float df;
  dyn_string ds;

  ChildPanelOnModalReturn("para/msc/msc_selectScreens.pnl","SelectScreens",makeDynString(""),0,0,df,ds);

  if(ds[1] != "OK")  //if Canceled Load Configuration from Datapoint
  {
    ptms_InitPanelGlobalsFromDp("_"+user);
    iConfigNum = 1;
    return -1;
  }
  iConfigNum = df[1];
  return 1;
}
