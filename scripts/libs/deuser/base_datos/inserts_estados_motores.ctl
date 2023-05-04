main()
{
  //Conectamos con el array antiguo para desconectar sus elementos,y una vez desconectados los antiguos, conectar
  //con los nuevos
  dpConnect("conectar_instancias","Variables_Internas_Scada.array_nuevo_motores");
}

/***************************************************************************************
  @author fcordoba
  @date 06/10/2020.
  @brief Recorremos el array nuevo para conectar las variables y desconectar las antiguas
  @return No devuelve nada.
****************************************************************************************/

conectar_instancias(string dp1, dyn_string array_nuevo)
{
  int longitud_viejo, longitud_nuevo;
  string descripcion;
  dyn_string array_viejo;

  dpGet("Variables_Internas_Scada.array_viejo_motores", array_viejo);
  longitud_viejo = dynlen(array_viejo);

  for(int i = 1; i <= longitud_viejo; i++)
  {
    descripcion = dpGetDescription(array_viejo[i]);
    dpDisconnectUserData("insert_estado", descripcion, array_viejo[i]);
  }
  longitud_nuevo = dynlen(array_nuevo);

  for(int i = 1; i <= longitud_nuevo; i++)
  {
    descripcion = dpGetDescription(array_nuevo[i]);
    dpConnectUserData("insert_estado", descripcion, array_nuevo[i]);
  }

  dpSet("Variables_Internas_Scada.array_viejo_motores", array_nuevo);
}

/******* Fin de la función conectar_instancias() *********/

/***************************************************************************************
  @author fcordoba
  @date 07/10/2020.
  @brief Realizamos el insert en la BBDD con los valores del dp seleccionado
  @return No devuelve nada.
****************************************************************************************/

insert_estado(string dp1, string descripcion, string dp)
{

  int valor;
  string fecha_hora_actual_st, fecha_actual_st, hora_actual_st, inst_bd, insert_sql;
  time fecha_hora_actual;

  fecha_hora_actual = dpGet(dp + ":_online.._stime");
  fecha_hora_actual_st = formatTime("%Y-%m-%dT%H:%M:%S", fecha_hora_actual, ".%03d");
  fecha_actual_st = formatTime("%Y-%m-%d", fecha_hora_actual, "");
  hora_actual_st = formatTime("%H:%M:%S", fecha_hora_actual, ".%03d");

  dpGet(dp, valor);

  inst_bd = instancia_bd();

  insert_sql = "INSERT INTO " + inst_bd + "[Estados_Motores] (Fecha_Hora, Fecha, Hora, Datapoint, Descripcion, Valor)" +
               " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," + valor + ")";

  cmd_bd("SQL",insert_sql);
}

/******* Fin de la función insert_estado() *********/
