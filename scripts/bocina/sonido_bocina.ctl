// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author sagomez
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)

//--------------------------------------------------------------------------------
// Variables and Constants

//--------------------------------------------------------------------------------
/**
*/
main()
{
  sonidoBocina();
}

sonidoBocina(){
  int val1;
  int val2;
  dpGet("13_ALARMAS.SonarBocina:_online.._value", val1);
  dpGet("13_ALARMAS.HabilitarBocina:_online.._value",val2);
  if (val1 == 1 && val2 == 1){
  startSound(WINCCOA_PATH+"data/sounds/ALARM.WAV", TRUE);
  }else{
  stopSound();
  }
}
