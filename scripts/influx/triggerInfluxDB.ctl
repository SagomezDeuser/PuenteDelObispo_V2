/*
  Función ciclica para guardar en influxDB aunque los valores no cambien. Se puede configurar el tiempo que se ejecutará esta función.
  Para que funcione correctamente hay que dejar System1: en las variables
*/
main()
{
  timedFunc("escribirInfluxDB","System1:_Intervalo_5_Min_Insert_Bd");
}

escribirInfluxDB(string trigger, time t1, time t2)
{
  dpSet("System1:_NGA_G_NIVELES.commands.triggerWrite",TRUE);
  //Hola JOrge
}
