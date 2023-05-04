// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author fcordoba
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

  timedFunc("valor_rand", "_Intervalo_60_Segundos_Insert_Bd");

}

valor_rand(string dp, time t1, time t2)
{
  float random;
  int random_int;

  random = rand();
  random = (random / 32767.0) * 100.0;
  dpSet("PRUEBAS.pruebaFloat", random);
  random = rand();
  random = (random / 32767.0) * 100.0;
  dpSet("PRUEBAS.pruebaInt", floor(random));
}
