main()
{
  timedFunc("conectar_instancias_analogicas", "_Intervalo_60_Segundos_Insert_Bd");
  timedFunc("conectar_instancias_accionamientos", "_Intervalo_60_Segundos_Insert_Bd");
  timedFunc("conectar_instancias_analizadores_redes", "_Intervalo_60_Segundos_Insert_Bd");
  //timedFunc("limpiar_tabla_sql", "_Intervalo_1Dia_DP");
}
/***************************************************************************************
  @brief Borra el contenido de las tablas de SQL anteriores a 60 días
  @return No devuelve nada.
****************************************************************************************/
void limpiar_tabla_sql(string dp, time tUltimaLlamada, time tLlamadaActual, bool call)
{
  string inst_bd, delete_sql;
  inst_bd = instancia_bd();
  //Borramos el contenido de la tabla de alarmas superior a 60 días
  delete_sql = "DELETE FROM " + inst_bd + "[ALARMAS] WHERE [fecha_hora_entrada] <= DATEADD(DAY, -60, CONVERT(DATETIME,CONVERT(VARCHAR, GETDATE(),112)))";
  cmd_bd("SQL", delete_sql);
  delete_sql = "DELETE FROM " + inst_bd + "[Escalado_Analogica] WHERE [fecha_hora_entrada] <= DATEADD(DAY, -60, CONVERT(DATETIME,CONVERT(VARCHAR, GETDATE(),112)))";
  cmd_bd("SQL", delete_sql);
  delete_sql = "DELETE FROM " + inst_bd + "[Estado_Motor] WHERE [fecha_hora_entrada] <= DATEADD(DAY, -60, CONVERT(DATETIME,CONVERT(VARCHAR, GETDATE(),112)))";
  cmd_bd("SQL", delete_sql);
}
/******* Fin de la función limpiar_tabla_sql() *********/
/***************************************************************************************
  @brief Recorremos el array nuevo para conectar las variables y desconectar las antiguas
  @return No devuelve nada.
****************************************************************************************/
void conectar_instancias_accionamientos(string dp, time tUltimaLlamada, time tLlamadaActual, bool call)
{
  int longitud;
  string descripcion, consulta;
  dyn_dyn_anytype resultado_consulta;
  consulta = "SELECT '_online.._value' " +
             "FROM '*' " +
             "WHERE ((_EL = \"Static.archivado_bbdd\") AND (_DPT LIKE \"531_LIB_ACCIONAMIENTO*\") AND (_DP NOT LIKE \"_mp_531_LIB_ACCIONAMIENTO*\"))";
  dpQuery(consulta, resultado_consulta);
  longitud = dynlen(resultado_consulta);

  for (int i = 2; i <= longitud; i++)
  {
    if (resultado_consulta[i][2])
    {
      descripcion = dpSubStr(resultado_consulta[i][1], DPSUB_DP);
      descripcion = getCatStr("dps", descripcion);
      insert_datos(descripcion, resultado_consulta[i][1]);
    }
  }
}
/******* Fin de la función conectar_instancias() *********/
/***************************************************************************************
  @brief Realizamos el insert en la BBDD con los valores del dp seleccionado
  @return No devuelve nada.
****************************************************************************************/
void insert_datos(string descripcion, string dp)
{
  bool insert_analog = FALSE;
  int valor_estado;
  string fecha_hora_actual, fecha_hora_actual_st, fecha_actual_st, hora_actual_st, inst_bd, insert_sql, tipo_acc, dpt, insert_sql_analog;
  time fecha_hora_actual;
  float dato1, dato2, dato3;

  dp = dpSubStr(dp, DPSUB_DP);
  dpt = dpTypeName(dp);
  dpGet(dp + ".Output.Yb_EST:_online.._value", valor_estado);
//   strreplace(dp, ":_online.._value", ":_online.._stime");

  inst_bd = instancia_bd();
  fecha_hora_actual = getCurrentTime();
  fecha_hora_actual_st = formatTime("%Y-%m-%dT%H:%M:%S", fecha_hora_actual, ".%03d");
  fecha_actual_st = formatTime("%Y-%m-%d", fecha_hora_actual, "");
  hora_actual_st = formatTime("%H:%M:%S", fecha_hora_actual, ".%03d");

  if (dpt.contains("_MOTOR_"))
  {
    tipo_acc = "Motor";

    if (descripcion.contains("CINTA"))
    {
      tipo_acc = "Cinta";
    }
    else if (descripcion.contains("BOMBA"))
    {
      tipo_acc = "Bomba";
    }
    else if (descripcion.contains("SINFÍN"))
    {
      tipo_acc = "Sinfín";
    }
    else if (descripcion.contains("REDLER"))
    {
      tipo_acc = "Redler";
    }
  }
  else
  {
    tipo_acc = "Válvula";
  }

  if (dpt.contains("VARIADOR"))
  {
    dpGet(dp + ".Input.Xr_Dato_1:_online.._value", dato1,
          dp + ".Input.Xr_Dato_2:_online.._value", dato2,
          dp + ".Input.Xr_Dato_3:_online.._value", dato3);

    insert_sql_analog = "INSERT INTO " + inst_bd + "[Analogicas_Accionamiento] (Fecha_Hora, Fecha, Hora, Nombre_Datapoint, Descripcion, Dato1, Descripcion_Dato1, Dato2, Descripcion_Dato2, Dato3, Descripcion_Dato3, Tipo)" +
                        " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," + dato1 + ",'FRECUENCIA'," + dato2 + ",'VELOCIDAD'," + dato3 + ",'INTENSIDAD','" + tipo_acc + "')";
    insert_analog = TRUE;
  }
  else if (dpt.contains("VALVULA_MOTOR"))
  {
    dpGet(dp + ".Input.Xr_Dato_1:_online.._value", dato1);

    insert_sql_analog = "INSERT INTO " + inst_bd + "[Analogicas_Accionamiento] (Fecha_Hora, Fecha, Hora, Nombre_Datapoint, Descripcion, Dato1, Descripcion_Dato1, Dato2, Descripcion_Dato2, Dato3, Descripcion_Dato3, Tipo)" +
                        " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," + dato1 + ",'POSICIÓN',0,'-',0,'-','" + tipo_acc + "')";
    insert_analog = TRUE;
  }

  dp = dpSubStr(dp, DPSUB_DP);
  insert_sql = "INSERT INTO " + inst_bd + "[Estado_Accionamiento] (Fecha_Hora, Fecha, Hora, Nombre_Datapoint, Descripcion, Valor, Tipo)" +
               " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," + valor_estado + ",'" + tipo_acc + "')";
  cmd_bd("SQL", insert_sql);

  if (insert_analog) cmd_bd("SQL", insert_sql_analog);

  //Una vez insertado el estado, comprobamos si tiene variador o es válvula motorizada, para insertar sus valores analógicos (Frecuencia, Velocidad e Intensidad en caso de motores, posición en caso de válvula regulable
}
/******* Fin de la función insert_estado() *********/
void conectar_instancias_analogicas(string dp, time tUltimaLlamada, time tLlamadaActual, bool call)
{
  int longitud;
  string descripcion, consulta;
  dyn_dyn_anytype resultado_consulta;

  consulta = "SELECT '_online.._value' " +
             "FROM '*' " +
             "WHERE ((_EL = \"Static.archivado_bbdd\") AND (_DPT LIKE \"504_LIB_TRATAMIENTO*\") AND (_DP NOT LIKE \"_mp_504_LIB_TRATAMIENTO*\"))";
  dpQuery(consulta, resultado_consulta);

  longitud = dynlen(resultado_consulta);

  for (int i = 2; i <= longitud; i++)
  {
    if (resultado_consulta[i][2])
    {
      descripcion = dpSubStr(resultado_consulta[i][1], DPSUB_DP);
      descripcion = getCatStr("dps", descripcion);
      insert_escalado(descripcion, resultado_consulta[i][1]);
    }
  }
}
/******* Fin de la función conectar_instancias_analogicas() *********/
void insert_escalado(string descripcion, string dp)
{
  float valor;
  string fecha_hora_actual, fecha_hora_actual_st, fecha_actual_st, hora_actual_st, inst_bd, insert_sql;
  time fecha_hora_actual;
  dp = dpSubStr(dp, DPSUB_DP);
  dpGet(dp + ".Output.Yr_ValorEscalado:_online.._value", valor);
  strreplace(dp, ":_online.._value", ":_online.._stime");
  fecha_hora_actual = getCurrentTime();
  fecha_hora_actual_st = formatTime("%Y-%m-%dT%H:%M:%S", fecha_hora_actual, ".%03d");
  fecha_actual_st = formatTime("%Y-%m-%d", fecha_hora_actual, "");
  hora_actual_st = formatTime("%H:%M:%S", fecha_hora_actual, ".%03d");
  dp = dpSubStr(dp, DPSUB_DP);
  inst_bd = instancia_bd();
  insert_sql = "INSERT INTO " + inst_bd + "[Escalado_Analogica] (Fecha_Hora, Fecha, Hora, Nombre_Datapoint, Descripcion, Valor)" +
               " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," + valor + ")";
  cmd_bd("SQL", insert_sql);
}

/***************************************************************************************
  @brief Recorremos el array nuevo para conectar las variables y desconectar las antiguas
  @return No devuelve nada.
****************************************************************************************/
void conectar_instancias_analizadores_redes(string dp, time tUltimaLlamada, time tLlamadaActual, bool call)
{
  int longitud;
  string descripcion, consulta;
  dyn_dyn_anytype resultado_consulta;
  consulta = "SELECT '_online.._value' " +
             "FROM '*' " +
             "WHERE ((_EL = \"Static.archivado_bbdd\") AND (_DPT LIKE \"090_LIB_ENERGY_METER\") AND (_DP NOT LIKE \"_mp_090_LIB_ENERGY_METER\"))";
  dpQuery(consulta, resultado_consulta);
  longitud = dynlen(resultado_consulta);

  for (int i = 2; i <= longitud; i++)
  {
    if (resultado_consulta[i][2])
    {
      descripcion = dpSubStr(resultado_consulta[i][1], DPSUB_DP);
      descripcion = getCatStr("dps", descripcion);
      insert_analizadores(descripcion, resultado_consulta[i][1]);
    }
  }
}

/******* Fin de la función conectar_instancias() *********/
/***************************************************************************************
  @brief Realizamos el insert en la BBDD con los valores del dp seleccionado
  @return No devuelve nada.
****************************************************************************************/
void insert_analizadores(string descripcion, string dp)
{
  float Tension_L1_N, Tension_L2_N, Tension_L3_N, Tension_L1_L2, Tension_L2_L3, Tension_L3_L1, Intensidad_L1, Intensidad_L2, Intensidad_L3;
  float Factor_Potencia_L1, Factor_Potencia_L2, Factor_Potencia_L3, Factor_Potencia_Total, Frecuencia;
  float Potencia_Aparente_L1, Potencia_Aparente_L2, Potencia_Aparente_L3, Potencia_Aparente_Total;
  float Potencia_Reactiva_L1, Potencia_Reactiva_L2, Potencia_Reactiva_L3, Potencia_Reactiva_Total;
  float Potencia_Activa_L1, Potencia_Activa_L2, Potencia_Activa_L3, Potencia_Activa_Total, Angulo_Fase_L1, Angulo_Fase_L2, Angulo_Fase_L3;
  float Energia_Aparente_Total, Energia_Reactiva_Total, Energia_Activa_Total;
  string fecha_hora_actual, fecha_hora_actual_st, fecha_actual_st, hora_actual_st, inst_bd, insert_sql;
  time fecha_hora_actual;
  dp = dpSubStr(dp, DPSUB_DP);
  dpGet(dp + ".ST_Datos_DS_142.Tension_L1-N", Tension_L1_N,
        dp + ".ST_Datos_DS_142.Tension_L2-N", Tension_L2_N,
        dp + ".ST_Datos_DS_142.Tension_L3-N", Tension_L3_N,
        dp + ".ST_Datos_DS_142.Tension_L1-L2", Tension_L1_L2,
        dp + ".ST_Datos_DS_142.Tension_L2-L3", Tension_L2_L3,
        dp + ".ST_Datos_DS_142.Tension_L3-L1", Tension_L3_L1,
        dp + ".ST_Datos_DS_142.Intensidad_L1", Intensidad_L1,
        dp + ".ST_Datos_DS_142.Intensidad_L2", Intensidad_L2,
        dp + ".ST_Datos_DS_142.Intensidad_L3", Intensidad_L3,
        dp + ".ST_Datos_DS_142.Factor_Potencia_L1", Factor_Potencia_L1,
        dp + ".ST_Datos_DS_142.Factor_Potencia_L2", Factor_Potencia_L2,
        dp + ".ST_Datos_DS_142.Factor_Potencia_L3", Factor_Potencia_L3,
        dp + ".ST_Datos_DS_142.Factor_Potencia_Total", Factor_Potencia_Total,
        dp + ".ST_Datos_DS_142.Frecuencia", Frecuencia,
        dp + ".ST_Datos_DS_142.Potencia_Aparente_L1", Potencia_Aparente_L1,
        dp + ".ST_Datos_DS_142.Potencia_Aparente_L2", Potencia_Aparente_L2,
        dp + ".ST_Datos_DS_142.Potencia_Aparente_L3", Potencia_Aparente_L3,
        dp + ".ST_Datos_DS_142.Potencia_Aparente_Total", Potencia_Aparente_Total,
        dp + ".ST_Datos_DS_142.Potencia_Reactiva_L1", Potencia_Reactiva_L1,
        dp + ".ST_Datos_DS_142.Potencia_Reactiva_L2", Potencia_Reactiva_L2,
        dp + ".ST_Datos_DS_142.Potencia_Reactiva_L3", Potencia_Reactiva_L3,
        dp + ".ST_Datos_DS_142.Potencia_Reactiva_Total", Potencia_Reactiva_Total,
        dp + ".ST_Datos_DS_142.Potencia_Activa_L1", Potencia_Activa_L1,
        dp + ".ST_Datos_DS_142.Potencia_Activa_L2", Potencia_Activa_L2,
        dp + ".ST_Datos_DS_142.Potencia_Activa_L3", Potencia_Activa_L3,
        dp + ".ST_Datos_DS_142.Potencia_Activa_Total", Potencia_Activa_Total,
        dp + ".ST_Datos_DS_142.Angulo_Fase_L1", Angulo_Fase_L1,
        dp + ".ST_Datos_DS_142.Angulo_Fase_L2", Angulo_Fase_L2,
        dp + ".ST_Datos_DS_142.Angulo_Fase_L3", Angulo_Fase_L3,
        dp + ".ST_Datos_DS_142.Energia_Aparente_Total", Energia_Aparente_Total,
        dp + ".ST_Datos_DS_142.Energia_Reactiva_Total", Energia_Reactiva_Total,
        dp + ".ST_Datos_DS_142.Energia_Activa_Total", Energia_Activa_Total);
  strreplace(dp, ":_online.._value", ":_online.._stime");
  fecha_hora_actual = getCurrentTime();
  fecha_hora_actual_st = formatTime("%Y-%m-%dT%H:%M:%S", fecha_hora_actual, ".%03d");
  fecha_actual_st = formatTime("%Y-%m-%d", fecha_hora_actual, "");
  hora_actual_st = formatTime("%H:%M:%S", fecha_hora_actual, ".%03d");
  dp = dpSubStr(dp, DPSUB_DP);
  inst_bd = instancia_bd();
  insert_sql = "INSERT INTO " + inst_bd + "[Analizadores_Redes] (Fecha_Hora, Fecha, Hora, Nombre_Datapoint, Descripcion, " +
               "Tension_L1_N, Tension_L2_N, Tension_L3_N, Tension_L1_L2, Tension_L2_L3, Tension_L3_L1, Intensidad_L1, Intensidad_L2, Intensidad_L3, " +
               "Factor_Potencia_L1, Factor_Potencia_L2, Factor_Potencia_L3, Factor_Potencia_Total, Frecuencia, " +
               "Potencia_Aparente_L1, Potencia_Aparente_L2, Potencia_Aparente_L3, Potencia_Aparente_Total, Potencia_Reactiva_L1, " +
               "Potencia_Reactiva_L2, Potencia_Reactiva_L3, Potencia_Reactiva_Total, Potencia_Activa_L1, Potencia_Activa_L2, Potencia_Activa_L3, Potencia_Activa_Total, " +
               "Angulo_Fase_L1, Angulo_Fase_L2, Angulo_Fase_L3, Energia_Aparente_Total, Energia_Reactiva_Total, Energia_Activa_Total)" +
               " VALUES('" + fecha_hora_actual_st + "', '" + fecha_actual_st + "', '" + hora_actual_st + "','" + dp + "','" + descripcion + "'," +
               Tension_L1_N + ", " + Tension_L2_N + ", " + Tension_L3_N + ", " + Tension_L1_L2 + ", " + Tension_L2_L3 + ", " + Tension_L3_L1 + ", " +
               Intensidad_L1 + ", " + Intensidad_L2 + ", " + Intensidad_L3 + ", " + Factor_Potencia_L1 + ", " + Factor_Potencia_L2 + ", " + Factor_Potencia_L3 + ", " + Factor_Potencia_Total + ", " +
               Frecuencia + ", " + Potencia_Aparente_L1 + ", " + Potencia_Aparente_L2 + ", " + Potencia_Aparente_L3 + ", " + Potencia_Aparente_Total + ", " +
               Potencia_Reactiva_L1 + ", " + Potencia_Reactiva_L2 + ", " + Potencia_Reactiva_L3 + ", " + Potencia_Reactiva_Total + ", " +
               Potencia_Activa_L1 + ", " + Potencia_Activa_L2 + ", " + Potencia_Activa_L3 + ", " + Potencia_Activa_Total + ", " + Angulo_Fase_L1 + ", " + Angulo_Fase_L2 + ", " + Angulo_Fase_L3 + ", " +
               Energia_Aparente_Total + ", " + Energia_Reactiva_Total + ", " + Energia_Activa_Total + ")";
  cmd_bd("SQL", insert_sql);
}
