#uses "userMan"
#uses "classes/auth/OaAuthFactory"
#uses "login"
//------------------------------------------------------------------------------
// ChildPanel oeffnen
//------------------------------------------------------------------------------
ChildPanelOn(string FileName,string PanelName,
             dyn_string Parameter,int x,int y)
{

  if (isPanelOpen(PanelName))
  {
    restorePanel(PanelName);
    return;
  }

  if ( !isEvConnOpen() )  // for console/PA
  {
    dyn_anytype params, daResult;

    params[ 1] = myModuleName();
    params[ 2] = FileName;
    params[ 3] = myPanelName();
    params[ 4] = PanelName;
    params[ 5] = x;
    params[ 6] = y;
    params[ 7] = 1.0;
    params[ 8] = false;
    params[ 9] = Parameter;
    params[10] = true;  // modal

    childPanel(params, daResult);
  }
  else
  {
    string dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",myModuleName(),
          dp+"ChildPanelOn.ParentName:_original.._value",myPanelName(),
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",0);
  }
}

//------------------------------------------------------------------------------
// ChildPanel oeffnen mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnReturn(string FileName,string PanelName,
                   dyn_string Parameter,int x,int y,
                   dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,x,y,
                          resultFloat,resultText,1);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen
//------------------------------------------------------------------------------
ChildPanelOnModal(string FileName,string PanelName,
                  dyn_string Parameter,int x,int y)
{
  string sModule = myModuleName();
  string sPanelName = myPanelName();

  if (isPanelOpen(PanelName))
  {
    restorePanel(PanelName);
    return;
  }

  if (!isPanelOpen(PanelName))
  {
    string dp;

    dp = myUiDpName() + ".";

    if( dpExists("_PanelTopology"))
      if (sModule == "infoModule")
      {
      	sModule = "mainModule";
      	sPanelName = rootPanel(sModule);
      }
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",sModule,
          dp+"ChildPanelOn.ParentName:_original.._value",sPanelName,
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",1);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnModalReturn(string FileName,string PanelName,
                        dyn_string Parameter,int x,int y,
                        dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,x,y,
                          resultFloat,resultText,2);
  }
}

//------------------------------------------------------------------------------
// ChildPanel Oeffnen in anderem RootPanel
//------------------------------------------------------------------------------
ChildPanelOnParent(string FileName,string PanelName,string ParentName,
                   dyn_string Parameter,int x,int y)
{
  if (isPanelOpen(PanelName))
  {
    restorePanel(PanelName);
    return;
  }

  if (isPanelOpen(ParentName) && !isPanelOpen(PanelName))
  {
    string dp;

    dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",myModuleName(),
          dp+"ChildPanelOn.ParentName:_original.._value",ParentName,
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",0);
  }
}

//------------------------------------------------------------------------------
// ChildPanel Oeffnen in anderem RootPanel mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnParentReturn(string FileName,string PanelName,string ParentName,
                         dyn_string Parameter,int x,int y,
                         dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,ParentName,"",Parameter,x,y,
                          resultFloat,resultText,3);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen in anderem RootPanel
//------------------------------------------------------------------------------
ChildPanelOnParentModal(string FileName,string PanelName,string ParentName,
                   dyn_string Parameter,int x,int y)
{
  if (isPanelOpen(PanelName))
  {
    restorePanel(PanelName);
    return;
  }

  if (isPanelOpen(ParentName) && !isPanelOpen(PanelName))
  {
    string dp;

    dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",myModuleName(),
          dp+"ChildPanelOn.ParentName:_original.._value",ParentName,
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",1);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen in anderem RootPanel mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnParentModalReturn(string FileName,string PanelName,string ParentName,
                   dyn_string Parameter,int x,int y,
                   dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,ParentName,"",Parameter,x,y,
                          resultFloat,resultText,4);
  }
}

//------------------------------------------------------------------------------
// ChildPanel Oeffnen in anderem Modul
//------------------------------------------------------------------------------
ChildPanelOnModule(string FileName,string PanelName,string ModuleName,
                   dyn_string Parameter,int x,int y)
{
  string dp;

  if (isPanelOpen(PanelName, ModuleName) && isModuleOpen(ModuleName))
  {
    restorePanel(PanelName, ModuleName);
    return;
  }

  if (isModuleOpen(ModuleName) && !isPanelOpen(PanelName,ModuleName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",ModuleName,
          dp+"ChildPanelOn.ParentName:_original.._value",rootPanel(ModuleName),
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",0);
  }
}

//------------------------------------------------------------------------------
// ChildPanel oeffnen in anderem Modul mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnModuleReturn(string FileName,string PanelName,string ModuleName,
                         dyn_string Parameter,int x,int y,
                         dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName, ModuleName))
  {
    ChildPanelReturnValue(FileName,PanelName,"",ModuleName,Parameter,x,y,
                          resultFloat,resultText,5);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen in anderem Modul
//------------------------------------------------------------------------------
ChildPanelOnModuleModal(string FileName,string PanelName,string ModuleName,
                        dyn_string Parameter,int x,int y)
{
  string dp;

  if (isPanelOpen(PanelName, ModuleName) && isModuleOpen(ModuleName))
  {
    restorePanel(PanelName, ModuleName);
    return;
  }

  if (isModuleOpen(ModuleName) && !isPanelOpen(PanelName,ModuleName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",ModuleName,
          dp+"ChildPanelOn.ParentName:_original.._value",rootPanel(ModuleName),
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x,
          dp+"ChildPanelOn.Y:_original.._value",y,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",1);
  }
}

//------------------------------------------------------------------------------
// ChildPanel modal Oeffnen in anderem Modul mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnModuleModalReturn(string FileName,string PanelName,string ModuleName,
                              dyn_string Parameter,int x,int y,
                              dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName, ModuleName))
  {
    ChildPanelReturnValue(FileName,PanelName,"",ModuleName,Parameter,x,y,
                          resultFloat,resultText,6);
  }
}

//------------------------------------------------------------------------------
// ChildPanel Oeffnen in anderem Modul, Position pruefen
//------------------------------------------------------------------------------
ChildPanelOnModuleCheckPos(string FileName,string PanelName,string ModuleName,
                           dyn_string Parameter,int x1,int y1)
{
  int dx0, dy0, x2, y2;
  string dp,ParentName;
  dyn_int di;

  di=getPanelSize(FileName);
  ParentName=myPanelName();
  if (ModuleName=="") ModuleName=myModuleName();

  if (isPanelOpen(PanelName, ModuleName) && isModuleOpen(ModuleName))
  {
    restorePanel(PanelName, ModuleName);
    return;
  }

  if (isModuleOpen(ModuleName) && !isPanelOpen(PanelName,ModuleName))
  {
    panelSize(myPanelName(),dx0,dy0);

    if (x1+di[1]<dx0)
      x2=x1;
    else
    if (x1-di[1]-10>=0)
      x2=x1-di[1]-10;
    else
      x2=0;

    if (y1+di[2]+30<dy0)
      y2=y1;
    else
    if (y1-di[2]-30>=0)
      y2=y1-di[2]-30;
    else
      y2=0;

    dp = myUiDpName() + ".";
    dpSet(dp+"ChildPanelOn.ModuleName:_original.._value",ModuleName,
          dp+"ChildPanelOn.ParentName:_original.._value",rootPanel(ModuleName),
          dp+"ChildPanelOn.FileName:_original.._value",FileName,
          dp+"ChildPanelOn.X:_original.._value",x2,
          dp+"ChildPanelOn.Y:_original.._value",y2,
          dp+"ChildPanelOn.Scale:_original.._value",1.0,
          dp+"ChildPanelOn.ParentScale:_original.._value",0,
          dp+"ChildPanelOn.PanelName:_original.._value",PanelName,
          dp+"ChildPanelOn.Parameter:_original.._value",Parameter,
          dp+"ChildPanelOn.Modal:_original.._value",0);
  }
}

//------------------------------------------------------------------------------
// Oeffnet ein Childpanel relativ zu einem Object
//------------------------------------------------------------------------------
ChildPanelOnRelativ(string FileName,string PanelName,
                    dyn_string Parameter,int offsetX,int offsetY)
{

  int dx0, dy0, x1, y1, x2, y2, i;
  string ParentName;
  dyn_int di;

  di=getPanelSize(FileName);
  ParentName=myPanelName();

  if(!isPanelOpen(PanelName))
  {
    panelSize(myPanelName(),dx0,dy0);
    getValue("","position",x1,y1);

    if (x1+offsetX+di[1]<dx0)
      x2=x1+offsetX;
    else
    if (x1+di[1]<dx0)
      x2=x1;
    else
    if (x1-offsetX-di[1]-10>=0 && x1-offsetX-10<=dx0)
      x2=x1-offsetX-di[1]-10;
    else
    if (x1-di[1]-10>=0 && x1-10<=dx0)
      x2=x1-di[1]-10;
    else
    {
      for (i=x1;i>=0;i--)
      {
        if (i+di[1]<dx0-10) break;
      }
      if (i>=0)
        x2=i;
      else
        x2=0;
    }

    if (y1+offsetY+di[2]+30<dy0)
      y2=y1+offsetY;
    else
    if (y1+di[2]+30<dy0)
      y2=y1;
    else
    if (y1-offsetY-di[2]-30>=0 && y1-offsetY-30<=dy0)
      y2=y1-offsetY-di[2]-30;
    else
    if (y1-di[2]-30>=0 && y1-30<=dy0)
      y2=y1-di[2]-30;
    else
    {
      for (i=y1;i>=0;i--)
      {
        if (i+di[2]<dy0-30) break;
      }
      if (i>=0)
        y2=i;
      else
        y2=0;
    }

    ChildPanelOn(FileName,PanelName,Parameter,x2,y2);
  }
}

//------------------------------------------------------------------------------
// Oeffnet ein Childpanel relativ zu einem Object mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnRelativReturn(string FileName,string PanelName,
                          dyn_string Parameter,int offsetX,int offsetY,
                          dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,offsetX,offsetY,
                          resultFloat,resultText,7);
  }
}

//------------------------------------------------------------------------------
// Oeffnet modal ein Childpanel relativ zu einem Object
//------------------------------------------------------------------------------
ChildPanelOnRelativModal(string FileName,
                         string PanelName,
                         dyn_string Parameter,
                         int offsetX,
                         int offsetY)
{

  int dx0, dy0, x1, y1, x2, y2, i;
  string ParentName;
  dyn_int di;

  di=getPanelSize(FileName);
  ParentName=myPanelName();

  if(!isPanelOpen(PanelName))
  {
    panelSize(myPanelName(),dx0,dy0);
    getValue("","position",x1,y1);

    if (x1+offsetX+di[1]<dx0)
      x2=x1+offsetX;
    else
    if (x1+di[1]<dx0)
      x2=x1;
    else
    if (x1-offsetX-di[1]-10>=0 && x1-offsetX-10<=dx0)
      x2=x1-offsetX-di[1]-10;
    else
    if (x1-di[1]-10>=0 && x1-10<=dx0)
      x2=x1-di[1]-10;
    else
    {
      for (i=x1;i>=0;i--)
      {
        if (i+di[1]<dx0-10) break;
      }
      if (i>=0)
        x2=i;
      else
        x2=0;
    }

    if (y1+offsetY+di[2]+30<dy0)
      y2=y1+offsetY;
    else
    if (y1+di[2]+30<dy0)
      y2=y1;
    else
    if (y1-offsetY-di[2]-30>=0 && y1-offsetY-30<=dy0)
      y2=y1-offsetY-di[2]-30;
    else
    if (y1-di[2]-30>=0 && y1-30<=dy0)
      y2=y1-di[2]-30;
    else
    {
      for (i=y1;i>=0;i--)
      {
        if (i+di[2]<dy0-30) break;
      }
      if (i>=0)
        y2=i;
      else
        y2=0;
    }

    ChildPanelOnModal(FileName,PanelName,Parameter,x2,y2);
  }
}

//------------------------------------------------------------------------------
// Oeffnet modal ein Childpanel relativ zu einem Object mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnRelativModalReturn(string FileName,string PanelName,
                               dyn_string Parameter,int offsetX,int offsetY,
                               dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,offsetX,offsetY,
                          resultFloat,resultText,8);
  }
}

//------------------------------------------------------------------------------
// Oeffnet ein Childpanel in der Mitte des RootPanels
//------------------------------------------------------------------------------
ChildPanelOnCentral(string FileName, string PanelName,
                    dyn_string Parameter)
{
   int     PBreite, PHoehe, x, y;
   float   factor, initFactor;
   dyn_int di;

   di = getPanelSize(FileName);
   getZoomFactor(factor, myModuleName());
   panelSize(myPanelName(), PBreite, PHoehe, (factor == 1));  // when no zooming use current size
   getInitialZoomFactor(initFactor);

   //PBreite, PHoehe and di are given in original size(factor = 1).
   //root panel is shown with factor(user might have resized)
   //childpanel is shown with initializeFactor
   //Scale PBreite/PHoehe and di to screen scale
   //after calculating the position(subtract and divide by 2) scale it back(factor = 1):
   //x = ((PBreite * factor) - (di[1] * initFactor)) / 2 / factor; //this is the same as the following:
   x = ((PBreite) - (di[1] * initFactor / factor)) / 2;
   y = ((PHoehe) - (di[2] * initFactor / factor) - 20) / 2;

   ChildPanelOn(FileName, PanelName, Parameter, x, y);
}

//------------------------------------------------------------------------------
// Oeffnet ein Childpanel in der Mitte des RootPanels mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnCentralReturn(string FileName,string PanelName,
                          dyn_string Parameter,
                          dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,0,0,
                          resultFloat,resultText,9);
  }
}

//------------------------------------------------------------------------------
// Oeffnet modal ein Childpanel in der Mitte des RootPanels
//------------------------------------------------------------------------------
ChildPanelOnCentralModal(string FileName, string PanelName,
                         dyn_string Parameter)
{
   int PBreite, PHoehe, x, y;
   float factor, initFactor;
   dyn_int di;

   di = getPanelSize(FileName);
   getZoomFactor(factor, myModuleName());
   panelSize(myPanelName(), PBreite, PHoehe, (factor == 1));  // when no zooming use current size
   getInitialZoomFactor(initFactor);

   //PBreite, PHoehe and di are given in original size(factor = 1).
   //root panel is shown with factor(user might have resized)
   //childpanel is shown with initializeFactor
   //Scale PBreite/PHoehe and di to screen scale
   //after calculating the position(subtract and divide by 2) scale it back(factor = 1):
   //x = ((PBreite * factor) - (di[1] * initFactor)) / 2 / factor; //this is the same as the following:
   x = ((PBreite) - (di[1] * initFactor / factor)) / 2;
   y = ((PHoehe) - (di[2] * initFactor / factor) - 20) / 2;

   ChildPanelOnModal(FileName, PanelName, Parameter, x, y);
}

//------------------------------------------------------------------------------
// Oeffnet modal ein Childpanel in der Mitte des RootPanels mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelOnCentralModalReturn(string FileName,string PanelName,
                               dyn_string Parameter,
                               dyn_float &resultFloat,dyn_string &resultText)
{
  if (!isPanelOpen(PanelName))
  {
    ChildPanelReturnValue(FileName,PanelName,"","",Parameter,0,0,
                          resultFloat,resultText,10);
  }
}

//------------------------------------------------------------------------------
// RootPanel Oeffnen
//------------------------------------------------------------------------------
RootPanelOn(string FileName,string PanelName,
            dyn_string Parameter)
{
  string dp;

  restorePanel(PanelName);

  dp = myUiDpName() + ".";

  if(dpExists("_2x2Redu") && isFunctionDefined("HOOK_disRecSystem_syncRootPanelToSSS") )
  {
    HOOK_disRecSystem_syncRootPanelToSSS(dp,myModuleName(), FileName, PanelName,Parameter);
  }

  dpSet(dp+"RootPanelOrigOn.ModuleName:_original.._value",myModuleName(),
        dp+"RootPanelOrigOn.FileName:_original.._value",FileName,
        dp+"RootPanelOrigOn.PanelName:_original.._value",PanelName,
        dp+"RootPanelOrigOn.Parameter:_original.._value",Parameter);

}

//------------------------------------------------------------------------------
// RootPanel Oeffnen in anderem Modul
//------------------------------------------------------------------------------
RootPanelOnModule(string FileName,string PanelName,string ModuleName,
                  dyn_string Parameter)
{
  string dp;

  restorePanel(PanelName, ModuleName);

  if (isModuleOpen(ModuleName) && !isPanelOpen(PanelName, ModuleName))
  {
    dp = myUiDpName() + ".";

    if(dpExists("_2x2Redu") && isFunctionDefined("HOOK_disRecSystem_syncRootPanelToSSS") )
    {
      HOOK_disRecSystem_syncRootPanelToSSS(dp,ModuleName, FileName, PanelName,Parameter);
    }

    dpSet(dp+"RootPanelOrigOn.ModuleName:_original.._value",ModuleName,
          dp+"RootPanelOrigOn.FileName:_original.._value",FileName,
          dp+"RootPanelOrigOn.PanelName:_original.._value",PanelName,
          dp+"RootPanelOrigOn.Parameter:_original.._value",Parameter);
  }
}

//------------------------------------------------------------------------------
// aktuelles Panel schliessen
//------------------------------------------------------------------------------
PanelOff()
{
  if ( isDialog() )
  {
    mapping m;
    closeDialog(m);
    return;
  }

  if ( !isEvConnOpen() )
  {
    dyn_anytype params;
    params[1] = myModuleName();
    params[2] = myPanelName();
    params[3] = makeDynString();
    panelOff(params);
  }

  string dp;

  if (myPanelName() == rootPanel())
    ModuleOff(myModuleName());
  else
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"PanelOff.ModuleName:_original.._value",myModuleName(),
          dp+"PanelOff.PanelName:_original.._value",myPanelName());
  }
}

//------------------------------------------------------------------------------
// aktuelles Panel schliessen mit Rueckgabewert
//------------------------------------------------------------------------------
PanelOffReturn(dyn_float df, dyn_string ds)
{
  if ( isDialog() )
  {
    mapping m = makeMapping("float", df, "string", ds);
    closeDialog(m);
    return;
  }

  string dp;

  dp = myUiDpName() + ".";
  // IM 117941 - make one dpSet instead of two seperate dpSet-calls
  // necessary that childpanels with return values work correctly
  dpSet(dp+"ReturnValue.Float:_original.._value",df,
        dp+"ReturnValue.Text:_original.._value",ds,
        dp+"PanelOff.ModuleName:_original.._value",myModuleName(),
        dp+"PanelOff.PanelName:_original.._value",myPanelName());
}

//------------------------------------------------------------------------------
// Panel schliessen im Panel PanelName
//------------------------------------------------------------------------------
PanelOffPanel(string PanelName)
{
  string dp;

  if (isPanelOpen(PanelName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"PanelOff.ModuleName:_original.._value",myModuleName(),
          dp+"PanelOff.PanelName:_original.._value",PanelName);
  }
}

//------------------------------------------------------------------------------
// Panel schliessen in anderem Modul
//------------------------------------------------------------------------------
PanelOffModule(string PanelName,string ModuleName)
{
  string dp;

  if (isModuleOpen(ModuleName) && isPanelOpen(PanelName,ModuleName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"PanelOff.ModuleName:_original.._value",ModuleName,
          dp+"PanelOff.PanelName:_original.._value",PanelName);
  }
}

//------------------------------------------------------------------------------
// Panelgroesse auslesen; ETM internal use only
//------------------------------------------------------------------------------
dyn_int _PanelSize(string FileName)
{
  string s,t,name;
  int i,j;
  file f;
  dyn_int di;

  di[1]=0; di[2]=0;
  name=getPath(PANELS_REL_PATH,FileName);  // PROJ_PATH + "panels/"
  s="     ";
  // access with filename "" works, fopen with filename "" works on linux
  if ( (name != "") && (access(name,R_OK)==0) )
  {
    f=fopen(name,"r");
    while (!feof(f) && substr(s,0,5)!="PANEL")
    {
      fgets(s,1024,f);
    }
    if (substr(s,0,5)=="PANEL")
    {
      sscanf(s,"%s %d %d %d",t,i,i,j);
      di[1]=i; di[2]=j;
    }
    fclose(f);
  }

  return(di);
}

//------------------------------------------------------------------------------
// Umschalten zwischen 2 Ebenen in aktuellem Panel
//------------------------------------------------------------------------------
SwitchLayer(int Nr1,int Nr2)
{
   string dp = myUiDpName();
   string moduleName = myModuleName();
   string panelName = myPanelName();

   dpSet(dp + ".LayerOff.ModuleName", moduleName,
	 dp + ".LayerOff.Layer", Nr1,
	 dp + ".LayerOff.PanelName", panelName,
	 dp + ".LayerOn.ModuleName", moduleName,
	 dp + ".LayerOn.Layer", Nr2,
	 dp + ".LayerOn.PanelName", panelName);
}

//------------------------------------------------------------------------------
// Ebene aufschalten in aktuellem Panel
//------------------------------------------------------------------------------
LayerOn(int Nr)
{
  string dp;

  dp = myUiDpName() + ".";
  dpSet(dp+"LayerOn.ModuleName:_original.._value", myModuleName(),
        dp+"LayerOn.Layer:_original.._value", Nr,
        dp+"LayerOn.PanelName:_original.._value", myPanelName());
}

//------------------------------------------------------------------------------
// Ebene wegschalten in aktuellem Panel
//------------------------------------------------------------------------------
LayerOff(int Nr)
{
  string dp;

  dp = myUiDpName() + ".";
  dpSet(dp+"LayerOff.ModuleName:_original.._value", myModuleName(),
        dp+"LayerOff.Layer:_original.._value", Nr,
        dp+"LayerOff.PanelName:_original.._value", myPanelName());
}

//------------------------------------------------------------------------------
// Umschalten zwischen 2 Ebenen in PanelName
//------------------------------------------------------------------------------
SwitchLayerPanel(int Nr1,int Nr2,string PanelName)
{
  LayerOffPanel(Nr1,PanelName);
  LayerOnPanel(Nr2,PanelName);
}

//------------------------------------------------------------------------------
// Ebene aufschalten in PanelName
//------------------------------------------------------------------------------
LayerOnPanel(int Nr,string PanelName)
{
  string dp;

  if (isPanelOpen(PanelName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"LayerOn.ModuleName:_original.._value", myModuleName(),
          dp+"LayerOn.Layer:_original.._value", Nr,
          dp+"LayerOn.PanelName:_original.._value", PanelName);
  }
}

//------------------------------------------------------------------------------
// Ebene wegschalten in PanelName
//------------------------------------------------------------------------------
LayerOffPanel(int Nr,string PanelName)
{
  string dp;

  if (isPanelOpen(PanelName))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"LayerOff.ModuleName:_original.._value", myModuleName(),
          dp+"LayerOff.Layer:_original.._value", Nr,
          dp+"LayerOff.PanelName:_original.._value", PanelName);
  }
}

//------------------------------------------------------------------------------
// 10.05.2001 PV/MS
//------------------------------------------------------------------------------
// SwitchLayerPanelInModule(int Nr1,int Nr2,string PanelName, string ModulName)
// Parameters:	selfexplaning
// Purpose:		switches between two layers (Nr1,Nr2) in a given panel and module
//------------------------------------------------------------------------------
SwitchLayerPanelInModule(int Nr1,int Nr2,string PanelName, string ModulName)
{
  LayerOffPanelInModule(Nr1,PanelName,ModulName);
  LayerOnPanelInModule(Nr2,PanelName,ModulName);
}

//------------------------------------------------------------------------------
// LayerOnPanelInModule (int layerNumber, string PanelName, string ModulName)
// Parameters:	selfexplaning
// Purpose:		switches a layer (layerNumber) in a given panel and module
//				to visible
//------------------------------------------------------------------------------
LayerOnPanelInModule(int layerNumber ,string PanelName, string ModulName)
{
  string dp;

  dp = myUiDpName() + ".";
  dpSet(dp+"LayerOn.ModuleName:_original.._value", ModulName,
        dp+"LayerOn.Layer:_original.._value", layerNumber,
        dp+"LayerOn.PanelName:_original.._value", PanelName);

}

//------------------------------------------------------------------------------
// LayerOffPanelInModule (int layerNumber, string PanelName, string ModulName)
// Parameters:	selfexplaning
// Purpose:		switches a layer (layerNumber) in a given panel and module
//				to invisible
//------------------------------------------------------------------------------
LayerOffPanelInModule(int layerNumber ,string PanelName, string ModulName)
{
  string dp;

  dp = myUiDpName() + ".";
  dpSet(dp+"LayerOff.ModuleName:_original.._value", ModulName,
        dp+"LayerOff.Layer:_original.._value", layerNumber,
        dp+"LayerOff.PanelName:_original.._value", PanelName);

}

//------------------------------------------------------------------------------
// ChildPanel oeffnen mit Rueckgabewert
//------------------------------------------------------------------------------
ChildPanelReturnValue(string FileName,string PanelName,string ParentName,
                      string ModuleName,dyn_string Parameter,int x,int y,
                      dyn_float &resultFloat,dyn_string &resultText,int typ)
{
  int status;
  time t=86400;
  string dp;
  dyn_string dpNamesWait,dpNamesReturn;
  dyn_anytype conditions,result;

  dp = myUiDpName() + ".";
  if(ModuleName == "")
    ModuleName = myModuleName();
  // IM 117942 - also include the module name at the wait condition
  dpNamesWait=makeDynString(dp+"PanelOff.PanelName:_original.._value",
                            dp+"PanelOff.ModuleName:_original.._value");
  dpNamesReturn=makeDynString(dp+"ReturnValue.Float:_original.._value",
                              dp+"ReturnValue.Text:_original.._value");

  // TI 14655: Initialisierung fuer Panelabbruch durch 'X'
  // IM 117941 - this dpSet is not necessary any more
  // needs to be removed that child panels with return values work correctly
  //dpSetWait(dp+"ReturnValue.Float:_original.._value",makeDynFloat(),
  //          dp+"ReturnValue.Text:_original.._value",makeDynString());
  resultFloat = makeDynFloat(); resultText = makeDynString();

  // make sure this function and the Panel-C++ code use the same path delimiter
  FileName = makeNativePath(FileName);

  // IM 117942 - also include the module name at the wait condition
  if (PanelName=="")
    conditions[1]=FileName;
  else
    conditions[1]=PanelName;
  conditions[2]=ModuleName;

  switch (typ)
  {
  case  1: ChildPanelOn(FileName,PanelName,Parameter,x,y);
           break;
  case  2: ChildPanelOnModal(FileName,PanelName,Parameter,x,y);
           break;
  case  3: ChildPanelOnParent(FileName,PanelName,ParentName,Parameter,x,y);
           break;
  case  4: ChildPanelOnParentModal(FileName,PanelName,ParentName,Parameter,x,y);
           break;
  case  5: ChildPanelOnModule(FileName,PanelName,ModuleName,Parameter,x,y);
           break;
  case  6: ChildPanelOnModuleModal(FileName,PanelName,ModuleName,Parameter,x,y);
           break;
  case  7: ChildPanelOnRelativ(FileName,PanelName,Parameter,x,y);
           break;
  case  8: ChildPanelOnRelativModal(FileName,PanelName,Parameter,x,y);
           break;
  case  9: ChildPanelOnCentral(FileName,PanelName,Parameter);
           break;
  case 10: ChildPanelOnCentralModal(FileName,PanelName,Parameter);
           break;

  }
  status=dpWaitForValue(dpNamesWait,conditions,
                        dpNamesReturn,result,t);

  dyn_errClass dErr = getLastError();
  if (status==-1)
  {
    dynClear(result);
  }
  else
  if (dynlen(dErr)!=0 || dynlen(result)<1 )
  {
    dynClear(result);
    throwError(dErr);
  }
  else
  {
    resultFloat=result[1];
    resultText=result[2];
  }
}

// -----------------------------------------------------------------------------
// Modul schliessen
// -----------------------------------------------------------------------------

ModuleOff(string modulname)
{
  string dp;

  if (isModuleOpen(modulname))
  {
    dp = myUiDpName() + ".";
    dpSet(dp+"ModuleOff.ModuleName:_original.._value",modulname);
  }
}

// -----------------------------------------------------------------------------
// Modul oeffnen
// -----------------------------------------------------------------------------
ModuleOn(string modulname,
         int x = -2, int y =-2, unsigned w=0, unsigned h=0,
         unsigned iconbar=0, unsigned menubar=0,
         string ResizeMode="",
         int ModuleType=1)
{
  string dp;

  ResizeMode=strrtrim(strltrim(ResizeMode));
  if (w==0 || h==0)
  {
    w=0;h=0;
  }
  if (iconbar>2) iconbar=0;
  if (menubar>2) menubar=0;
  dp = myUiDpName() + ".";

  if (!isModeExtended())
    ModuleType = 1;

  if (modulname!="" && !isModuleOpen(modulname))
  {
    dpSetWait(dp+"ModuleOn.ModuleName:_original.._value",modulname,
          dp+"ModuleOn.ModuleType:_original.._value", ModuleType,
          dp+"ModuleOn.X:_original.._value",x,
          dp+"ModuleOn.Y:_original.._value",y,
          dp+"ModuleOn.W:_original.._value",w,
          dp+"ModuleOn.H:_original.._value",h,
          dp+"ModuleOn.IconBar:_original.._value",iconbar,
          dp+"ModuleOn.MenuBar:_original.._value",menubar,
          dp+"ModuleOn.MessageArea:_original.._value",1,
          dp+"ModuleOn.ResizeMode:_original.._value",ResizeMode);
    while ( !isModuleOpen(modulname) ) delay(0,100);
  }
}

// -----------------------------------------------------------------------------
// Modul oeffnen mit Rootpanel
// -----------------------------------------------------------------------------
ModuleOnWithPanel(string ModuleName,
         int x, int y, unsigned w, unsigned h,
         unsigned iconbar, unsigned menubar, string ResizeMode,
         string FileName, string PanelName, dyn_string Parameter)
{
  string  dp;

  ResizeMode=strrtrim(strltrim(ResizeMode));
  if (w==0 || h==0)
  {
    w=0;h=0;

    if (FileName != "")
    {
      dyn_int diSize= getPanelSize( FileName );
      w= diSize[1];
      h= diSize[2];
    }
  }
  if (iconbar>2) iconbar=0;
  if (menubar>2) menubar=0;
  dp = myUiDpName() + ".";

  if (ModuleName!="" && !isModuleOpen(ModuleName))
  {
    ModuleOn(ModuleName, x,y,w,h,iconbar,menubar,ResizeMode);
  }
  if (isModuleOpen(ModuleName) && !isPanelOpen(PanelName,ModuleName))
  {
    dpSetWait(dp+"RootPanelOrigOn.ModuleName:_original.._value",ModuleName,
              dp+"RootPanelOrigOn.FileName:_original.._value",FileName,
              dp+"RootPanelOrigOn.PanelName:_original.._value",PanelName,
              dp+"RootPanelOrigOn.Parameter:_original.._value",Parameter);
  }
}

//--------------------------------------------------------------------------
// open the login-dialog
//
// closeModules:
// 0 = don't close open modules, open new module for login
// 1 =       close open modules, open new module for login
// 2 = don't close open modules, use current module for login
// 3 =       close open modules, use current module for login
// loginModule: moduleName for the login dialog if new module is opened,
//              if loginModule == "", "PVSS" is used
// picture:  fileName to show instead of the PVSS-woman-logo

LoginDialog(int closeModules, string loginModule, string picture)
{
  if(um_isSSA("loginSSA", "userMan")) //When user is logged in via SSA Login as... is not available
  {
    return;
  }

  int i;
  dyn_string names;
  string uiDP;

  if ( loginModule == "" ) loginModule = "PVSS";

  uiDP = myUiDpName() + ".";
  // close all modules
  if ( (closeModules == 1) || (closeModules == 3) )
  {
    names = getVisionNames();
    dynAppend(names, getParaNames());
    dynAppend(names, getGediNames());
  }

  // open login-Dialog Panel

  if ( closeModules < 2)
    ModuleOn(loginModule,  // modulename
             400,     // x
             400,     // y
             300,     // width
             100,     // height
             1,       // no iconBar
             1,       // no menubar
             "None"); // resizeMode

  string sdefaultPanelFormatValue;
  string sPanelToOpen = "vision/sinopticos/00_principal/principal/despliegue_login.pnl";
  string filename = PROJ_PATH + "config/config";
  string section = "ui";
  int iRet;
  iRet = paCfgReadValue(filename, section, "defaultPanelFormat", sdefaultPanelFormatValue);
  if ( iRet == 0 )
  {
    if( patternMatch("XML", sdefaultPanelFormatValue) )
    {
      // check if login panel in xml version exists
      if ( isfile(PROJ_PATH + "panels/vision/login.xml") )
        sPanelToOpen = "vision/login.xml";
    }
  }

  RootPanelOnModule(sPanelToOpen, "",
     ( closeModules < 2 ) ? loginModule : myModuleName(),   // moduleName
     makeDynString("$picture:"+picture, "$closeModules:"+closeModules, "$loginModule:"+loginModule));

  if ( (closeModules == 1) || (closeModules == 3) )
  {
    for (i = 1; i <= dynlen(names); i++)
    {
      // commit no suicide
      if ( names[i] != myModuleName() && isModuleOpen(names[i]) )
      {
        dpSetWait(uiDP+"ModuleOff.ModuleName:_original.._value", names[i]);
      }
    }
    // now close myself
    ModuleOff(myModuleName());
  }
}

//--------------------------------------------------------------------------
// does a logout and opens the login-dialog

LogoutDialog(bool question, int closeModules, string loginModule, string picture)
{
  string sCurrentUser = getUserName();  // TFS 7166
  string dp;

  if ( loginModule == "" ) loginModule = "PVSS";

  dp = myUiDpName() + ".";

  if ( question )
  {
    // start a panel which asks the user "really logout ?"

    int status;
    time t=86400;

    dyn_string dpNamesWait,dpNamesReturn;
    dyn_anytype conditions, result;

    dpNamesWait=makeDynString(dp+"PanelOff.ModuleName:_original.._value");
    dpNamesReturn=makeDynString(dp+"ReturnValue.Float:_original.._value");
    conditions[1] = loginModule; // TFS 7166
    dpSet(dp+"PanelOff.ModuleName:_original.._value","");

    ModuleOn(loginModule,  // modulename
             400,     // x
             400,     // y
             300,     // width
             100,     // height
             1,       // no iconBar
             1,       // no menubar
             "None"); // resizeMode
    delay(0,200);
    RootPanelOnModule("vision/loginConfirmation.pnl", "", loginModule, makeDynString(closeModules));

    status = dpWaitForValue(dpNamesWait, conditions,dpNamesReturn, result, t); // TFS 7166

    ModuleOff(loginModule);
    if ( result[1][1] == 0 ) return;  // answer was NO

    closeModules = result[1][2];
    delay(1);
  }

/* workaround: user guest ==> this user must not be deleted !!!
  dpSet(dp+"UserName:_original.._value","");
*/
  //setUserId(getUserId("guest")); // IM 109923

  //setUserId(DEFAULT_USERID);  // does not work, because this user is not allowed to open a module

  setUserId(DEFAULT_USERID,"");
  dpSetWait(dp+"UserName:_original.._value",""); // TFS 7166

  OaAuthFactory factory;
  mixed auth = factory.getAuth();
  string sessionId;

  dpGet("_Ui_" + myManNum() + ".UserName", sessionId);
  auth.logout(sCurrentUser, sessionId);

  LoginDialog(closeModules, loginModule, picture);
}

//--------------------------------------------------------------------------
// opens the password Dialog (to change the password) in the given module
// if moduleName == "", we use "PVSS" as the moduleName

PasswordDialog(string moduleName)
{
  if ( moduleName == "" ) moduleName = "PVSS";

  ModuleOn(moduleName, 100, 100, 500, 500, 1, 1, "None");
  RootPanelOnModule("vision/password.pnl", "", moduleName, makeDynString());
}

//--------------------------------------------------------------------------
// Autor:             Thomas Schirk
// Funktion:          Dieses Skript fuegt in den String 'txt' automatisch nach
//                    maximal 'width' Pixel ein CR ein, ohne ein Wort zu
//                    unterbrechen!
// Parameter:         string txt: Zu veraendernder String
//                    int width:  maximale Zeienlaenge
//                    string shapeName: Name vom Objekt (optional default = "" --> this shape)
// Rueckgabewert:      string:     Veraenderter Text
// Datum und Version: 03.09.1999 Version 1 (Korrigiert von koller & varga)
//
string makeCR(string txt, int width, string shapeName = "")
{
  int        i,h,w;
  string     s;
  dyn_string words;

  if (strpos(txt,"\n")>0 || txt=="")
    return(txt);

  words = strsplit(txt, " ");
  txt=words[1];
  for(i=2;i<=dynlen(words);i++)
  {
    s=txt+" "+words[i];
    setValue(shapeName,"text",s);
    getValue(shapeName,"size",w,h);
    if(w>width)
      txt = txt + "\n" + words[i];
    else
      txt = txt + " " + words[i];
  }
  return(txt);
}

//--------------------------------------------------------------------------
// Zoom the given module
// if the given module-name is "", then use myModule
// if the given factor is 0.0, then use the current factor and change only
// the position

ZoomModule(string module, float factor, int x = 0, int y = 0, bool rel = false)
{
  string ui;

  ui = myUiDpName();

  if ( module == "" ) module = myModuleName();

  if ( factor == 0.0 ) getZoomFactor(factor, module);

  dpSet(ui + ".Zoom.ModuleName:_original.._value", module,
        ui + ".Zoom.Factor:_original.._value", factor,
        ui + ".Zoom.X:_original.._value", x,
        ui + ".Zoom.Y:_original.._value", y,
        ui + ".Zoom.Set:_original.._value", 1,
        ui + ".Zoom.Relative:_original.._value", rel);
}

//--------------------------------------------------------------------------

/////////////////////////////////////////////////////////////////
// This function results the central position of a child in parent
/////////////////////////////////////////////////////////////////
// Parameters:
//   string child:  FILENAME  of childpanel
//   string parent: PANELNAME of parent panel
// Result:
//   dyn_int: dr[1]==xPos; dr[2]==yPos
/////////////////////////////////////////////////////////////////
dyn_int getChildCentralPosition(string child, string parent)
{
   int     x,y;
   dyn_int dc,dr;

   dc=getPanelSize(child);
   panelSize(parent,x,y);
   dr[1]=(x-dc[1])/2;
   dr[2]=(y-dc[2]-20)/2;
   if(dr[1]<0) dr[1]=0;
   if(dr[2]<0) dr[2]=0;
   return(dr);
}

//--------------------------------------------------------------------------
Panel_OnZoomed(string moduleName, string panelName="", float factor=1.0)
{
  int         i,j,pos = 0;
  bool        b;
  dyn_bool    dbLayers;
  dyn_int     diPos;
  dyn_float   lowerLimits,upperLimits;

  getZoomFactor(factor);

  dpGet("_Config.Cluttering.LowerLimits:_online.._value",lowerLimits,
        "_Config.Cluttering.UpperLimits:_online.._value",upperLimits);

  factor *= 100;
  for (i = 1;i <= dynlen(lowerLimits);i++)
  {
    if ( (factor >= lowerLimits[i] && factor <= upperLimits[i]) ||
         (lowerLimits[i] == 0 && upperLimits[i] == 0 ))
    {
      dbLayers[i] = true;
    }
    else
    {
      LayerOffPanelInModule  (i, panelName, moduleName);
    }
  }

  for (i = 1; i <= dynlen(dbLayers); i++)
  {
    if ( dbLayers[i] )
    {
      // layer on
      LayerOnPanelInModule  (i, panelName, moduleName);
    }
  }
}

//--------------------------------------------------------------------------
// Return true, if this is the JavaUI
bool isJavaUI()
{
  return isDollarDefined("$_javauiConnIdx");
}


// Get the name of our _Ui-DP
string myUiDpName()
{
  if (isDollarDefined("$_javauiConnIdx"))
    return "_JavaUI_" + $_javauiConnIdx;
  else
    return "_Ui_" + myManNum();
}

// Get the number of our UI / JavaUI
int myUiNumber()
{
  if (isDollarDefined("$_javauiConnIdx"))
    return myManNum() + 256 * (int) $_javauiConnIdx;
  else
    return myManNum();
}

//-------------------------------------------------------------------------
// Open an editor to edit the file
int fileEditor(string filestr, bool readOnly = false)
{
  if (isJavaUI())
  {
    string    content;
    dyn_mixed dsResponse;

    if (access(filestr, F_OK) == 0)
      fileToString(filestr, content);
    else if (access(getPath("", filestr), F_OK) == 0)
      fileToString(getPath("", filestr), content);

    xmlrpcSendRequest("javaui.textEditor",
      makeDynMixed((int) $_javauiModuleId, content, readOnly), dsResponse);

    // Derzeit nur readonly
    if (dynlen(dsResponse) > 0)
      return 0;

    return -1;
  }
  else
  {
    textEditor( "file", filestr, "readOnly", readOnly);
  }
  return 0;
}

//-------------------------------------------------------------------------
// Open an editor to edit the file
int stringEditor(string &text, bool readOnly = false)
{
  if (isJavaUI())
  {
    dyn_mixed dsResponse;

    xmlrpcSendRequest("javaui.textEditor",
      makeDynMixed((int) $_javauiModuleId, text, readOnly), dsResponse);

    // Derzeit nur readonly
    if (dynlen(dsResponse) > 0)
      return 0;

    return -1;
  }
  else
  {
    textEditor( "text", text, "readOnly", readOnly);
  }
  return 0;
}

// obsolete since 3.5; only for backward compatibility
int noFlickerRedraw(bool b)
{
  return 0;
}

//-------------------------------------------------------------------------
// return the deviceclass if available
//-------------------------------------------------------------------------

string myDeviceClass(int iUiNum = 0)
{
  if ( iUiNum == 0 )
     iUiNum = myUiNumber();

  string sDeviceClass;
  int iError;
  iError = dpDynRefGet("_UiDevices.ManagerNumber",(uint)iUiNum,makeDynAnytype("_UiDevices.DeviceClass"),sDeviceClass);

  if ( iError != 0)
    return iError;

  return sDeviceClass;

}
