#uses "CtrlADO"

//--------------------------------------------------------------------------------
// Listado de variables const a utilizar  en el ctl
const string inst_bd_1 = "[SCADA_MEMORIAN_ACESUR].[dbo].";
const string inst_bd_2 = "[]";

/***************************************************************************************
  @autor agromero
  @fecha 01/04/19
  @descrip Devuelve el nombre de la instancia de la BD de SQL.
  @return Devuelve el nombre de la base de datos concatenado con '.' con el schema seguido de '.'.
****************************************************************************************/
string instancia_bd()
{
  string bbdd;
  dpGet("ConfiguracionSCADA.configuracion_bd.nombre_bd",bbdd);
  return ("[" + bbdd + "].[dbo].");
}
/******* Fin de la función instancia_memorian_bd() *********/

/***************************************************************************************
  @autor agromero
  @fecha 01/04/19
  @descrip Devuelve el nombre de la instancia de la BD de SQL.
  @return Devuelve el nombre de la base de datos concatenado con '.' con el schema seguido de '.'.
****************************************************************************************/
string instancia_mysql_bd()
{
  string bbdd;
  dpGet("ConfiguracionSCADA.configuracion_bd.nombre_bd_mysql",bbdd);
  return ("[" + bbdd + "]");
}
/******* Fin de la función instancia_memorian_mysql_bd() *********/

/***************************************************************************************
  @author dceballos
  @date 02/11/2018.
  @brief Realizamos un SELECT en la base de datos del sistema.
  @return Devuelve el resultado de una consulta del tipo dyn_dyn_anytype.

  Modificado por fcordoba para solo tener que pasarle la sentencia como parámetro y
  para detectar el error, en caso de que lo haya.
  @date 03/03/2020
****************************************************************************************/
dyn_dyn_anytype select_bd(string bbdd, string sentencia_sql)
{
  dyn_dyn_anytype resultado_sql;
  int rc;
  dbRecordset rs;
  string abrir_conexion;
  dbConnection conexion;
  dyn_string columnas;
  dyn_dyn_anytype resultado_sql;


  if(bbdd == "SQL"){
    dpGet("ConfiguracionSCADA.configuracion_bd.conexion_1", abrir_conexion); rc = dbOpenConnection(abrir_conexion, conexion);

  }else if(bbdd == "MySQL"){
    dpGet("ConfiguracionSCADA.configuracion_bd.conexion_2", abrir_conexion); rc = dbOpenConnection(abrir_conexion, conexion);
  }

  if(!rc){  //Comprobamos si hemos establecido conexión con la base de datos correctamente
    rc = dbOpenRecordset (conexion, sentencia_sql, rs);
    if(!rc){ //Comprobamos si se ha abierto bien la tabla
      rc = dbGetResult(rs, resultado_sql, columnas);
      if(!rc){  //Comprobamos si hemos obtenido correctamente los datos solicitados
        rc = dbCloseRecordset(rs);
        if(!rc){ //Comprobamos si se ha cerrado bien la tabla
          rc = dbCloseConnection(conexion);
        }
        else{
          error_conex_bd(conexion);
        }
      }else{
        error_conex_bd(conexion);
      }
    }else{
      error_conex_bd(conexion);
    }
  }else{
    error_conex_bd(conexion);
  }
  return (resultado_sql);

}
/******* Fin de la función select_bd() *********/

/***************************************************************************************
  @author dceballos
  @date 02/11/2018.
  @brief Realizamos un INSERT, un DELETE y un UPDATE en la base de datos del sistema.
  @return Devuelve el estado resultante del comando. -1 en caso de haber algún fallo.

  Modificado por fcordoba para solo tener que pasarle la sentencia como parámetro y
  para detectar el error, en caso de que lo haya.
  @date 27/02/2020
****************************************************************************************/
int cmd_bd(string bbdd, string sentencia_sql)
{
  int rc;
  dbCommand cmd;
  dbRecordset rs;
  string abrir_conexion;
  dbConnection conexion;
  if(bbdd == "SQL"){
    dpGet("ConfiguracionSCADA.configuracion_bd.conexion_1", abrir_conexion); rc = dbOpenConnection(abrir_conexion, conexion);
  }else if(bbdd == "MySQL"){
    dpGet("ConfiguracionSCADA.configuracion_bd.conexion_2", abrir_conexion); rc = dbOpenConnection(abrir_conexion, conexion);
  }

  if(!rc){  //Comprobamos si hemos establecido conexión con la base de datos correctamente
    rc = dbStartCommand(conexion, sentencia_sql, cmd);
    if(!rc){  //Comprobamos si se ha preparado bien el proceso para manipular los datos
      rc = dbExecuteCommand(cmd);
      if(!rc){  //Comprobamos si se ha ejecutado bien el proceso preparado anteriormente
        rc = dbFinishCommand(cmd);
        if(!rc){  //Comprobamos si ha finalizado correctamente
          rc = dbCloseConnection(conexion);
        }else{
          error_conex_bd(conexion);
        }
      }else{  //Los "else" llaman a la función de error, en caso de que sea necesario
        error_conex_bd(conexion);
      }
    }else{
      error_conex_bd(conexion);
    }
  }else{
    error_conex_bd(conexion);
  }

  return (rc);
}
/******* Fin de la función cmd_bd() *********/

/***************************************************************************************
  @author fcordoba
  @date 02/03/2020.
  @brief Comprobamos si hay algun error en la conexion con la BD.
  @return No devuelve nada.
****************************************************************************************/
void error_conex_bd(dbConnection conexion){
  string errDescr, errSql;
  int rc, errCnt, errNo, errNative;

  errCnt = 1;
  rc = 0;

  while(errCnt > 0 && !rc){
    rc = dbGetError (conexion, errCnt, errNo, errNative, errDescr, errSql);
    if(!rc){
      DebugN("Número de error: ", errNo);
      DebugN("Error base: ", errNative);
      DebugN("Descripción: ", errDescr);
      DebugN("Texto error SQL: ", errSql);
    }else{
      DebugN("dbGetError failed, rc = ", rc);
      errCnt--;
    }
  }
}
/******* Fin de la función error_conex_bd() *********/
