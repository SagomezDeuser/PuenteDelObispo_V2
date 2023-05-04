main()
{
  string consulta_alarmas;

  consulta_alarmas = "SELECT ALERT '_alert_hdl.._value', '_alert_hdl.._came_time', '_alert_hdl.._ack_time', '_alert_hdl.._text', '_alert_hdl.._ack_state', '_alert_hdl.._gone_time' " +
                     "FROM '*' " +
                     "WHERE _DPT NOT LIKE \"_*\" " +
                     "SORT BY 2 DESC";


  dpQueryConnectSingle("cargar_alarmas", TRUE, consulta_alarmas, consulta_alarmas);
}




/***************************************************************************************
  @brief Recibe la información de las alarmas y las inserta en base de datos.
  @return No devuelve nada.
****************************************************************************************/
cargar_alarmas(string consulta, dyn_dyn_anytype resultado_consulta){
  //Declaración de variables//
  //dyn_string nombres;
  int fila, columna, estado_acusado;
  time tiempo_inicio, tiempo_fin, tiempo_acusado, duracion;
  string color_fondo, color_fuente, nom_dpe, texto, horas, minutos, segundos;

  //Se recorre el resultado de la consulta que ejecuta esta función//
  for(int i = 2; i <= dynlen(resultado_consulta); i++){
    //Se obtiene cada uno de los datos y se llevan a su correspondiente variable//
    nom_dpe = resultado_consulta[i][1];
    nom_dpe = dpSubStr(nom_dpe, DPSUB_DP_EL);

    tiempo_inicio = resultado_consulta[i][4];   //tiempo came de la alarma
    tiempo_acusado = resultado_consulta[i][5];  //tiempo acuse de la alarma
    texto = resultado_consulta[i][6];           //texto de la alarma
    tiempo_fin = resultado_consulta[i][8];      //tiempo pone de la alarma

    dpGet(nom_dpe + ":_alert_hdl.._act_state", estado_acusado);  //Se obtienen estado de acusado para saber si se trata de una alarma CAME/UNACK = 1, CAME/ACK = 2, WENT/UNACK  = 3 o WENT/ACK = 0

    //Introducción de nuevas líneas y borrado según estado alarmas//
    if(estado_acusado == 1){  //Estado CAME/UNACK
      archivado_bd_nueva_alarma(tiempo_inicio, texto, nom_dpe);  //Registramos la nueva alarma en la Base de datos del sistema
    }else if(estado_acusado == 2){  //Estado CAME/ACK
      archivado_bd_acuse_came_alarma(tiempo_inicio, tiempo_acusado, nom_dpe);  //Actualizamos el estado de acuse de la alarma en la Base de datos del sistema
    }else if(estado_acusado == 3){  //Estado WENT/UNACK
      duracion = tiempo_fin - tiempo_inicio;

      segundos = second(duracion);
      if(strlen(segundos) == 1) segundos = "0" + segundos;

      minutos = minute(duracion);
      if(strlen(minutos) == 1) minutos = "0" + minutos;

      horas = hour(duracion) - 1;
      if(strlen(horas) == 1) horas = "0" + horas;

      archivado_bd_duracion_alarma(tiempo_inicio, tiempo_fin, horas, minutos, segundos, nom_dpe);  //Actualizamos la duración de tiempo en la que la alarma estuvo activa en la Base de datos del sistema
    }else if(estado_acusado == 0){  //Estado WENT/ACK
      duracion = tiempo_fin - tiempo_inicio;

      segundos = second(duracion);
      if(strlen(segundos) == 1) segundos = "0" + segundos;

      minutos = minute(duracion);
      if(strlen(minutos) == 1) minutos = "0" + minutos;

      horas = hour(duracion) - 1;
      if(strlen(horas) == 1) horas = "0" + horas;

      archivado_bd_acuse_went_alarma(tiempo_inicio, tiempo_fin, tiempo_acusado, horas, minutos, segundos, nom_dpe);  //Actualizamos el acuse, la fecha de acuse y la fecha de fin de una alarma que ha sido acusada y se fué
    }
  }
}
/******* Fin de la función cargar_alarmas() *********/

/***************************************************************************************
  @brief Realizamos la inserción en la BD de una nueva alarma registrada en el sistema.
  @return No devuelve nada.
****************************************************************************************/
archivado_bd_nueva_alarma(time tiempo_inicio, string descripcion, string nom_dpe){
  //Declaramos todas las variables a emplear en la función
  int descripcion_ok;
  string insert_sql, inst_bd, fecha_hora_entrada_alarma, fecha_entrada_alarma, hora_entrada_alarma, elemento, tag, nom_dp, nombre_dpe;

    nombre_dpe = dpSubStr(nom_dpe, DPSUB_DP_EL);
    nom_dp = dpSubStr(nom_dpe, DPSUB_DP);
    elemento = dpGetDescription(nom_dp + ".");
    if(nom_dp.contains("Alarma") || nom_dp.contains("Aviso") || nom_dp.contains("MARCAS")){
      elemento=dpGetDescription(nombre_dpe);
    }

  tag = dpGetAlias(nom_dp + ".");
  fecha_hora_entrada_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_inicio, ".%03d");
  fecha_entrada_alarma = formatTime("%Y-%m-%d", tiempo_inicio);
  hora_entrada_alarma = formatTime("%H:%M:%S", tiempo_inicio, ".%03d");

  inst_bd = instancia_bd();

  insert_sql = "INSERT INTO " + inst_bd + "[ALARMAS] ([fecha_hora_entrada],[fecha_entrada],[hora_entrada],[tag],[elemento],[descripcion],[nombre_dpe]) " +
               "VALUES ('" + fecha_hora_entrada_alarma + "', '" + fecha_entrada_alarma + "', '" + hora_entrada_alarma + "', '" + tag + "', '" + elemento + "', '" +  descripcion + "', '" +  nom_dpe + "');";

  cmd_bd("SQL",insert_sql);
}
/******* Fin de la función archivado_bd_nueva_alarma() *********/

/***************************************************************************************
  @brief Realizamos la actualización por acuse CAME en la BD de una alarma registrada
  en el sistema.
  @return No devuelve nada.
****************************************************************************************/
archivado_bd_acuse_came_alarma(time tiempo_inicio, time tiempo_acuse, string dpe){
  //Declaramos todas las variables a emplear en la función
  string update_sql, inst_bd, fecha_hora_entrada_alarma, fecha_hora_acuse_alarma, fecha_acuse_alarma, hora_acuse_alarma;

  fecha_hora_entrada_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_inicio, ".%03d");
  fecha_hora_acuse_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_acuse, ".%03d");
  fecha_acuse_alarma = formatTime("%Y-%m-%d", tiempo_acuse);
  hora_acuse_alarma = formatTime("%H:%M:%S", tiempo_acuse, ".%03d");

  inst_bd = instancia_bd();

  update_sql = "UPDATE " + inst_bd + "[ALARMAS] SET acuse = 1, fecha_hora_acuse = '" + fecha_hora_acuse_alarma + "', fecha_acuse = '" + fecha_acuse_alarma +
               "', hora_acuse = '" + hora_acuse_alarma + "' WHERE fecha_hora_entrada = '" + fecha_hora_entrada_alarma + "' AND nombre_dpe = '" + dpe + "';";

  cmd_bd("SQL",update_sql);
}
/******* Fin de la función archivado_bd_acuse_came_alarma() *********/

/***************************************************************************************
  @brief Realizamos la actualización por acuse WENT en la BD de una alarma registrada
  en el sistema.
  @return No devuelve nada.
****************************************************************************************/
archivado_bd_acuse_went_alarma(time tiempo_inicio, time tiempo_fin, time tiempo_acuse, string horas_dura, string minutos_dura, string segundos_dura, string dpe){
  //Declaramos todas las variables a emplear en la función
  int tiempo_acuse_recibido;
  string update_sql, inst_bd, fecha_hora_entrada_alarma, fecha_hora_acuse_alarma, fecha_acuse_alarma, hora_acuse_alarma, fecha_hora_salida_alarma, fecha_salida_alarma, hora_salida_alarma;

  fecha_hora_entrada_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_inicio, ".%03d");
  fecha_hora_acuse_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_acuse, ".%03d");
  fecha_acuse_alarma = formatTime("%Y-%m-%d", tiempo_acuse);
  hora_acuse_alarma = formatTime("%H:%M:%S", tiempo_acuse, ".%03d");
  fecha_hora_salida_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_fin, ".%03d");
  fecha_salida_alarma = formatTime("%Y-%m-%d", tiempo_fin);
  hora_salida_alarma = formatTime("%H:%M:%S", tiempo_fin, ".%03d");

  inst_bd = instancia_bd();

  tiempo_acuse_recibido = tiempo_acuse;  //Convertimos el tiempo de acuse a int para comprobar si realmente recibimos dicha información

  if(tiempo_acuse_recibido != 0){  //Si recibimos la fecha de acuse el valor de dicha variable es distinta a 0
    update_sql = "UPDATE " + inst_bd + "[ALARMAS] SET acuse = 1, fecha_hora_acuse = '" + fecha_hora_acuse_alarma + "', fecha_acuse = '" + fecha_acuse_alarma +
                 "', hora_acuse = '" + hora_acuse_alarma + "', fecha_hora_salida = '" + fecha_hora_salida_alarma + "', fecha_salida = '" + fecha_salida_alarma +
                 "', hora_salida = '" + hora_salida_alarma + "', duracion = '" + horas_dura + ":" + minutos_dura + ":" + segundos_dura +
                 "' WHERE fecha_hora_entrada = '" + fecha_hora_entrada_alarma + "' AND nombre_dpe = '" + dpe + "';";
  }else{
    update_sql = "UPDATE " + inst_bd + "[ALARMAS] SET acuse = 1, fecha_hora_salida = '" + fecha_hora_salida_alarma + "', fecha_salida = '" + fecha_salida_alarma +
                 "', hora_salida = '" + hora_salida_alarma + "', duracion = '" + horas_dura + ":" + minutos_dura + ":" + segundos_dura +
                 "' WHERE fecha_hora_entrada = '" + fecha_hora_entrada_alarma + "' AND nombre_dpe = '" + dpe + "';";
  }

  cmd_bd("SQL",update_sql);
}
/******* Fin de la función archivado_bd_acuse_went_alarma() *********/

/***************************************************************************************
  @brief Realizamos la actualización de la duración de una alarma de activa a inactiva
  en la BD del sistema.
  @return No devuelve nada.
****************************************************************************************/
archivado_bd_duracion_alarma(time tiempo_inicio, time tiempo_fin, string horas_dura, string minutos_dura, string segundos_dura, string dpe){
  //Declaramos todas las variables a emplear en la función
  string update_sql, inst_bd, fecha_hora_entrada_alarma, fecha_hora_salida_alarma, fecha_salida_alarma, hora_salida_alarma;

  fecha_hora_entrada_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_inicio, ".%03d");
  fecha_hora_salida_alarma = formatTime("%Y-%m-%dT%H:%M:%S", tiempo_fin, ".%03d");
  fecha_salida_alarma = formatTime("%Y-%m-%d", tiempo_fin);
  hora_salida_alarma = formatTime("%H:%M:%S", tiempo_fin, ".%03d");

  inst_bd = instancia_bd();

  update_sql = "UPDATE " + inst_bd + "[ALARMAS] SET duracion = '" + horas_dura + ":" + minutos_dura + ":" + segundos_dura +
               "', fecha_hora_salida = '" + fecha_hora_salida_alarma + "', fecha_salida = '" + fecha_salida_alarma +
               "', hora_salida = '" + hora_salida_alarma + "' WHERE fecha_hora_entrada = '" + fecha_hora_entrada_alarma +
               "' AND nombre_dpe = '" + dpe + "';";

  cmd_bd("SQL",update_sql);
}
/******* Fin de la función archivado_bd_duracion_alarma() *********/
