//--------------------------------------------------------------------------------
// Listado de variables const a utilizar  en el ctl
const string ip_port_wamp = "http://localhost:8081/SCADA";
const string ip_port_grafana = "http://192.168.1.3:3008/";
const string ip_port_wincc_oa = "http://localhost:8008/data/html/";
const string ip_port_erp_idi = "http://servidor_almaza:8082/Reports/browse/";
const string mobilePattern = "Android|iPad|iPhone|iPod|webOS|BlackBerry|Windows Phone";

//Variables a utilizar por las funciones para mostrar u ocultar el teclado virtual
int language = -1;
int original_w = -1;
bool onMobile = FALSE;

/***************************************************************************************
  @brief Función para recuperar la dirección IP localhost del servidor Web WAMP del sistema.
  @return Devuelve la dirección IP y puerto del equipo local Servidor Web WAMP.
****************************************************************************************/
string get_url_server_wamp()
{
  return (ip_port_wamp);
}
/******* Fin de la función get_url_server_wamp() *********/

/***************************************************************************************
  @brief Función para recuperar la dirección IP:Port del servidor Web de WinCC OA.
  @return Devuelve la dirección IP y el puerto del equipo local Servidor Web de WinCC OA.
****************************************************************************************/
string get_url_server_wincc_oa()
{
  return (ip_port_wincc_oa);
}
/******* Fin de la función get_url_server_wincc_oa() *********/


/***************************************************************************************
  @brief Función para recuperar la dirección IP localhost del servidor Web PowerBi del sistema.
  @return Devuelve la dirección IP y puerto del equipo local Servidor Web PowerBi.
****************************************************************************************/
string ip_port_erp_powerbi()
{
  return (ip_port_erp_idi);
}
/******* Fin de la función funcion_get_ip_port_erp_powerbi() *********/


/***************************************************************************************
  @brief Función para mostrar el teclado virtual.
****************************************************************************************/
void teclado(string dp, string tipo_teclado, bool oculto = FALSE, int fila = 0, string columna = "", string max = "", string min = "")
{
  string tipo_elemento = this.shapeType(), descripcion, motivo, valor_sp_ini;
  dyn_string return_string, valor_teclado, split;
  dyn_float return_float;
  int error;

  if (tipo_teclado == "keypad")
  {
    ChildPanelOnCentralModalReturn("objects/tecladosVirtuales/teclado_" + tipo_teclado + "_nuevo.pnl", "Teclado", makeDynString("$TXT:" + valor_sp_ini, "$oculto:" + oculto, "$MAX:" + max, "$MIN:" + min), return_float, return_string);
  }
  else
  {
    ChildPanelOnCentralReturn("objects/tecladosVirtuales/teclado_" + tipo_teclado + "_nuevo.pnl", "Teclado", makeDynString("$TXT:" + valor_sp_ini, "$oculto:" + oculto), return_float, return_string);
  }

  if (dpExists(dp))
  {
    dpGet(dp, valor_sp_ini);  //Recuperamos el valor inicial del DP correspondiente

    split = strsplit(dp, ".");
    descripcion = dpGetAlias(split[1] + ".");
    motivo = "Actualización del valor: " + descripcion;
  }

  dpGet("_Ui_" + myManNum() + ".ReturnValue.Text:_original.._value", valor_teclado);

  if (dpExists(dp) && (valor_teclado[1] != "ESC"))
  {
    dpSetWait(dp, valor_teclado[1]);
    writeAuditEntry(dp, valor_sp_ini, valor_teclado[1], error, motivo);
  }

  else if (tipo_elemento == "TEXT_FIELD" && (valor_teclado[1] != "ESC"))
  {
    this.text = valor_teclado[1];
  }
  else if (tipo_elemento == "TABLE" && (valor_teclado[1] != "ESC"))
  {
    this.cellValueRC(fila, columna, valor_teclado);
  }

  dpSet("_Ui_" + myManNum() + ".ReturnValue.Text:_original.._value", "");
}
/******* Fin de la función teclado_virtual() *********/

/***************************************************************************************
  @brief Función para convertir de hexadecimal a decimal.
****************************************************************************************/
void cambiarHexDecimal(string dp, string numHexa, string dpReal){
 mapping numerosHexa = makeMapping("1", 1,
                                    "2", 2,
                                    "3", 3,
                                    "4", 4,
                                    "5", 5,
                                    "6", 6,
                                    "7", 7,
                                    "8", 8,
                                    "9", 9,
                                    "A", 10,
                                    "B", 11,
                                    "C", 12,
                                    "D", 13,
                                    "E", 14,
                                    "F", 15);
  DebugN(numHexa);
  int ultimo = numHexa.length() - 1;
  string elemento;
  int producto, elementoHex, cuenta = 0;
  for(int i = ultimo; i>=0; i--)
  {
     producto = pow(16,ultimo - i);
     elemento = numHexa.at(i);
     elementoHex = numerosHexa.value(elemento,0);
     cuenta = cuenta + producto*elementoHex;
  }
  dpSet(dpReal, cuenta);
}
/******* Coneversion Hex to Dec *********/
/***************************************************************************************
  @brief Función para mostrar el teclado virtual hexadecimal.
****************************************************************************************/
void tecladoHex(string dp, string tipo_teclado, bool oculto = FALSE, int fila = 0, string columna = "", string max = "", string min = "", string dpReal)
{
  string tipo_elemento = this.shapeType(), descripcion, motivo, valor_sp_ini;
  dyn_string return_string, valor_teclado, split;
  dyn_float return_float;
  int error;

  if (tipo_teclado == "keypad")
  {
    ChildPanelOnCentralModalReturn("objects/tecladosVirtuales/teclado_" + tipo_teclado + "_nuevo.pnl", "Teclado", makeDynString("$TXT:" + valor_sp_ini, "$oculto:" + oculto, "$MAX:" + max, "$MIN:" + min), return_float, return_string);
  }
  else
  {
    ChildPanelOnCentralReturn("objects/tecladosVirtuales/teclado_" + tipo_teclado + "_nuevo.pnl", "Teclado", makeDynString("$TXT:" + valor_sp_ini, "$oculto:" + oculto), return_float, return_string);
  }

  if (dpExists(dp))
  {
    dpGet(dp, valor_sp_ini);  //Recuperamos el valor inicial del DP correspondiente

    split = strsplit(dp, ".");
    descripcion = dpGetAlias(split[1] + ".");
    motivo = "Actualización del valor: " + descripcion;
  }

  dpGet("_Ui_" + myManNum() + ".ReturnValue.Text:_original.._value", valor_teclado);

  if (dpExists(dp) && (valor_teclado[1] != "ESC"))
  {
    cambiarHexDecimal(dp, valor_teclado[1], dpReal);
    writeAuditEntry(dp, valor_sp_ini, valor_teclado[1], error, motivo);
  }

  else if (tipo_elemento == "TEXT_FIELD" && (valor_teclado[1] != "ESC"))
  {
    this.text = valor_teclado[1];
  }
  else if (tipo_elemento == "TABLE" && (valor_teclado[1] != "ESC"))
  {
    this.cellValueRC(fila, columna, valor_teclado);
  }

  dpSet("_Ui_" + myManNum() + ".ReturnValue.Text:_original.._value", "");
}
/******* Fin de la función teclado_virtual() *********/

/***************************************************************************************
  @brief Función que devuelve el tipo de transformacion de un dato. Devuelve un int.
****************************************************************************************/
int tipoTransformacionDato(string dp)
{
  int tipoDato =  dpElementType(dp);

  switch (tipoDato)
  {
    case (20):    //tipo de dato UINT
    {
      tipoDato = 1008; //Transformación a UINT
      break;
    }

    case (21):    //tipo de dato INT
    {
      tipoDato = 1012;//Transformación a INT
      break;
    }

    case (22):    //tipo de dato FlOAT
    {
      tipoDato = 1015;//Transformación a FLOAT
      break;
    }

    case (23):    //tipo de dato BOOL
    {
      tipoDato = 1002;//Transformación a BOOL
      break;
    }

    case (24):    //tipo de dato BIT32
    {
      tipoDato = 1005;//Transformación a DWORD
      break;
    }

    case (25):    //tipo de dato STRING
    {
      tipoDato = 1026;//Transformación a STRING
      break;
    }

    default:    //tipo diferente a los más usados
    {
      tipoDato = 1001;// TRANSFORMACIÓN DEFAULT (SIN TRANSFORMACION)
      break;
    }
  }

  return tipoDato;
}
/******* Fin de la funcion tipoTransformacionDato() *********/

/***************************************************************************************
  @brief Función para recuperar la dirección IP localhost del servidor Web PowerBi del sistema.
  @return Devuelve la dirección IP y puerto del equipo local Servidor Web PowerBi.
****************************************************************************************/
string ip_port_erp_powerbi()
{
  return (ip_port_erp_idi);
}
/******* Fin de la función funcion_get_ip_port_erp_powerbi() *********/


/***************************************************************************************
  @brief Función de pulso para boton.
****************************************************************************************/
void pulsoBit(string dp)
{
  dpSetWait(dp, TRUE);
  delay(1);
  dpSet(dp, FALSE);
}
/******* Fin de la funcion botonPulso *********/

/***************************************************************************************
  @brief Función de invertir bit para boton.
****************************************************************************************/
void invertirBit (string dp)
{
  string valor;
  dpGet(dp, valor);

  if (!valor)
  {
    dpSet(dp, TRUE);
  }
  else
  {
    dpSet(dp, FALSE);
  }
}
/******* Fin de la funcion botonInvertir *********/


/***************************************************************************************
  @brief Función que comprueba si ya hay un Ui usado donde se está abriendo otro,
  bloqueando la posible duplicidad
****************************************************************************************/
void comprobarUiDuplicado()
{
  bool abierto;
  int numero, cuenta = 0;
  string miPC, otroUiPC, cadena;
  dyn_string miPCSplit;
  dpGet("ConfiguracionSCADA.UIsPorPCPermitidos", numero);
  dpGet(myUiDpName() + ".DisplayName", cadena);
  miPCSplit = strsplit(cadena, ",");
  miPC = miPCSplit[2]; //después de partir la cadena de DisplayName, en la 2 parte aparece el nombre del PC donde está el Ui
  strreplace(miPC, "\"", "");
  strreplace(miPC, "name:", ""); //Tras cortar la cadena, nos quedamos exclusivamente con el nombre del PC
  for (int i = 1; i < myUiNumber(); i++) //WinCC OA te asigna el siguiente Ui disponible, así que recorremos los anteriores al nuestro para comprobar
  {
    dpGet("_Ui_" + i + ".DisplayName", otroUiPC);
    abierto = patternMatch("*" + miPC + "*", otroUiPC); //vemos si hay coincidencia de equipo entre mi Ui y el resto
    if (abierto) //En el momento que encuentro coincidencia entro en el IF
    {
      cuenta++;
      if (cuenta >= numero)
      {
        setUserId(0, "VESENtrIMPUT!"); //Inicio sesión en este Ui con root, único usuario que puede cerrar UIs
        DebugN("------------------- Este PC ya tiene un UI abierto -------------------");
        dpSet(myUiDpName() + ".ModuleOff.ModuleName", myModuleName()); //Cerramos el Ui
        break; //Rompemos el bucle for al haber encontrado la coincidencia
      }
    }
  }
}
/******* Fin de la funcion comprobarUiDuplicado() *********/
