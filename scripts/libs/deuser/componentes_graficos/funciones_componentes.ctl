//--------------------------------------------------------------------------------
// Listado de variables const a utilizar  en el ctl
const string pathEstadoIndicador = "iconos/indicador_modo/indicador_";
const mapping estadosIndicador = makeMapping(0, pathEstadoIndicador + "autooff_",
                                  1, pathEstadoIndicador + "autooff_",
                                  2, pathEstadoIndicador + "autoon_",
                                  3, pathEstadoIndicador + "autooff_",
                                  4, pathEstadoIndicador + "autoon_",
                                  10, pathEstadoIndicador + "manualoff_",
                                  11, pathEstadoIndicador + "manualoff_",
                                  12, pathEstadoIndicador + "manualon_",
                                  13, pathEstadoIndicador + "manualoff_",
                                  14, pathEstadoIndicador + "manualon_",
                                  20, pathEstadoIndicador + "manuallocal_",
                                  21, pathEstadoIndicador + "mantenimientoparado_",
                                  22, pathEstadoIndicador + "mantenimientomarcha1_",
                                  23, pathEstadoIndicador + "mantenimientomarcha2_",
                                  100, pathEstadoIndicador + "autoalm_",
                                  101, pathEstadoIndicador + "autoalm_",
                                  102, pathEstadoIndicador + "autoalm_",
                                  110, pathEstadoIndicador + "manualalm_",
                                  111, pathEstadoIndicador + "manualalm_",
                                  112, pathEstadoIndicador + "manualalm_",
                                  113, pathEstadoIndicador + "manuallocalalm_",
                                  114, pathEstadoIndicador + "manuallocalalm_",
                                  115, pathEstadoIndicador + "manuallocalalm_",
                                  255, pathEstadoIndicador + "inha_");

const mapping estadosValvulas = makeMapping(0, pathEstadoIndicador + "autooff_",
    1, pathEstadoIndicador + "autooff_",
    2, pathEstadoIndicador + "autoon_",
    3, pathEstadoIndicador + "autooff_",
    4, pathEstadoIndicador + "autooff_",
    10, pathEstadoIndicador + "manualoff_",
    11, pathEstadoIndicador + "manualoff_",
    12, pathEstadoIndicador + "manualon_",
    13, pathEstadoIndicador + "manualoff_",
    14, pathEstadoIndicador + "manualoff_",
    20, pathEstadoIndicador + "manuallocal_",
    21, pathEstadoIndicador + "mantenimientoparado_",
    22, pathEstadoIndicador + "mantenimientomarcha1_",
    23, pathEstadoIndicador + "mantenimientomarcha2_",
    100, pathEstadoIndicador + "autoalm_",
    101, pathEstadoIndicador + "autoalm_",
    102, pathEstadoIndicador + "autoalm_",
    110, pathEstadoIndicador + "manualalm_",
    111, pathEstadoIndicador + "manualalm_",
    112, pathEstadoIndicador + "manualalm_",
    113, pathEstadoIndicador + "manuallocalalm_",
    114, pathEstadoIndicador + "manuallocalalm_",
    115, pathEstadoIndicador + "manuallocalalm_",
    255, pathEstadoIndicador + "inha_");


/***************************************************************************************
  Función con dpConnectUserData para cuando se produzca un cambio de estado en el
  estado del indicador cambiar su tipo.
****************************************************************************************/
void cambiarEstadoIndicador(string inst, string grados)
{
  if (!dpExists(inst + ".Output.Yb_EST"))  //Comprobamos si no existe el DP
  {
    this.buttonType(BT_PIXMAP);
    this.buttonDownPixmap(pathEstadoIndicador + "estado_off_error.svg");
    this.buttonUpPixmap(pathEstadoIndicador + "estado_off_error.svg");
    return;
  }
  else
  {
    dpConnectUserData("cambiarEstadoIndicadorObjeto", grados, inst + ".Output.Yb_EST");
  }
}
/******* Fin de la función cambiarEstadoIndicador() *********/

/***************************************************************************************
  Función para modificar del el boton indicador de estado según el estado de la instancia
****************************************************************************************/
void cambiarEstadoIndicadorObjeto(string grados, string dp1, int estado)
{
  string inst = dpSubStr(dp1, DPSUB_DP);
  string alias = dpGetAlias(inst + "."), tipoInst = dpTypeName(inst), pathDownpixmap, pathUppixmap;// recuperamos el alias y el dptype de la instanacia
  this.toolTipText(alias);  //Establecemos el tooltips con el nombre del tag para mostrarse cuando se pase el ratón por encima del objeto

  if (tipoInst.contains("VALVULA"))//Combrobamos si el dptype es de valvula
  {
    pathDownpixmap = estadosValvulas.value(estado, "");   //Recuperamos la ruta de estado dependiendo del estado que llega por parámetro
  }
  else
  {
    pathDownpixmap = estadosIndicador.value(estado, "");   //Recuperamos la ruta de estado dependiendo del estado que llega por parámetro
  }

  pathDownpixmap = pathDownpixmap + grados + ".svg";

  pathUppixmap = pathDownpixmap;

  if (pathDownpixmap != grados + ".svg")
  {
    this.buttonType(BT_PIXMAP);
    this.buttonDownPixmap(pathDownpixmap);
    this.buttonUpPixmap(pathUppixmap);
  }
  else
  {
    this.buttonType(BT_PIXMAP);
    this.buttonDownPixmap(pathEstadoIndicador + "error_" + grados + ".svg");
    this.buttonUpPixmap(pathEstadoIndicador + "error_" + grados + ".svg");
  }
}
/******* Fin de la función cambiarEstadoIndicadorObjeto() *********/


/***************************************************************************************
  Función con dpConnectUserData para cuando se produzca un cambio de estado en el
  indicador de señal cambiar su apariencia.
****************************************************************************************/
void cambiarEstadoIndicadorSenial(string dp, string colorAct, string colorInact)
{
  string alias;

  if (!dpExists(dp))  //Comprobamos si no existe el DP
  {
    this.backCol = "LIB_IRC_MORADO_01";

    return;
  }

  alias = dpGetAlias(dp + ".");  //Recuperamos el alias de la instancia
  this.toolTipText(alias);  //Establecemos el tooltips con el nombre del tag para mostrarse cuando se pase el ratón por encima del objeto
  dyn_string datos = makeDynString(colorAct, colorInact);
  dpConnectUserData("cambiarIndicadorSenialObjeto", datos, dp);
}
/******* Fin de la función cambiar_estado_indicador_senal() *********/


/***************************************************************************************
  Función para modificar del estado el buttonType de estado de un objeto del tipo
  de indicador de señal en función de su estado.
****************************************************************************************/
void cambiarIndicadorSenialObjeto(dyn_string datos, string dp1, bool estado)
{
  if (estado)
  {
    this.backCol = datos[1];
  }
  else
  {
    this.backCol = datos[2];
  }
}
/******* Fin de la función cambiar_indicador_senal_objeto() *********/

/***************************************************************************************
  Función con dpConnect al estado de la instacia para cambiar la flecha de sentido de giro del motor doble
****************************************************************************************/
void cambiarSentidoGiro(string inst, string posicion)
{
  string tipoInst = dpTypeName(inst);

  if (dpExists(inst + ".Output.Yb_EST") && (tipoInst == "531_LIB_ACCIONAMIENTO_MOTOR_D" || tipoInst == "531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"))  //Comprobamos si existe el DP y y si el dptype sea de tipo doble
  {
    dpConnectUserData("seleccionSentidoGiro", posicion, inst + ".Output.Yb_EST");
  }
  else
  {
    this.visible(FALSE);
  }
}
/******* Fin de la función cambiar_sentido_indicador_doble() *********/

/***************************************************************************************
  Función que establece la flecha de sentido de giro del motor doble según su estado.
****************************************************************************************/
void seleccionSentidoGiro(string posicion, string dp1, int estado)
{
  if (estado == 2 || estado == 12)  //Estados ON de avance
  {
    this.visible(TRUE);
    this.fill("[pattern,[fit,any,pictures/iconos/indicador_modo/flecha_horario_" + posicion + ".svg]]");
  }
  else if (estado == 4 || estado == 14)  //Estados ON de retroceso
  {
    this.visible(TRUE);
    this.fill("[pattern,[fit,any,pictures/iconos/indicador_modo/flecha_antihorario_" + posicion + ".svg]]");
  }
  else
  {
    this.visible(FALSE);
  }
}
/******* Fin de la función seleccion_sentido() *********/



/***************************************************************************************
  Función con dpConnect para cuando se produzca un cambio de estado en el
  valor de una señal analógica.
****************************************************************************************/
void cambiarValorNivel(string dp)
{
  string alias;

  if (!dpExists(dp))  //Comprobamos si no existe el DP
  {
    this.backCol("LIB_IRC_MORADO_01");
    return;
  }

  alias = dpGetAlias(dp);  //Recuperamos el alias de la instancia
  this.toolTipText(alias);  //Establecemos el tooltips con el nombre del tag para mostrarse cuando se pase el ratón por encima del objeto
  dpConnect("cambiarValorNivelObjeto", dp);
}
/******* Fin de la función cambiar_valor_nivel_analogica() *********/

/***************************************************************************************
  Función para modificar el valor del TextField de un objeto del tipo analógica.
****************************************************************************************/
void cambiarValorNivelObjeto(string dp1, float valor)
{
  dyn_string dpSplit;
  bool valorLL, valorHH, valorL, valorH, fondoEscala;
  dpSplit = strsplit(dp1, ".");//Separamos el nombre del DP para obtener solo el nombre del DP sin variable asociada para poder obener otras variables
  dpGet(dpSplit[1] + ".Output.Yd_ALL", valorLL,//Alarma muy baja
        dpSplit[1] + ".Output.Yd_AL", valorL,//Aviso baja
        dpSplit[1] + ".Output.Yd_AH", valorH,//Aviso alta
        dpSplit[1] + ".Output.Yd_AHH", valorHH,//Alarma muy alta
        dpSplit[1] + ".Output.Yd_FondoEscala", fondoEscala);//Alarma fondo de escala

  if (fondoEscala)//Si la analógica esta a fondo de escala se mostraráel nivel a 0.
  {
    this.value(0);
    this.backCol("LIB_IRC_BLANCO");
  }
  else // Sino se comprobará que el resto de alarmas estan activas y se mostrará el nivel de diferentes colores
  {
    if (valorLL || valorHH)//si hay alarma se mostrará fondo rojo
    {
      this.backCol("LIB_IRC_ROJO_04");
    }
    else if (valorL || valorH)//si hay aviso se mostrará fondo amarillo
    {
      this.backCol("LIB_IRC_AMARILLO_01");
    }
    else//si no hay alarmas ni avisos se mostrará fondo blanco
    {
      this.backCol("LIB_IRC_BLANCO");
    }

    this.value(valor); //se muestra el valor en el nivel
  }
}
/******* Fin de la función cambiarValorNivelObjeto() *********/

/***************************************************************************************
  Función con dpConnectUserData para cuando se produzca un cambio de estado en un
  botón y cambiar su apariencia.
****************************************************************************************/
void cambiarEstadoBoton(string dp)
{
  if (!dpExists(dp))  //Comprobamos si no existe el DP
  {
    this.color("LIB_IRC_MORADO_01");
    this.foreCol("LIB_IRC_MORADO_01");
    return;
  }
  dpConnect("cambiarEstadoBotonObjeto", dp);
}
/******* Fin de la función cambiarEstadoBoton() *********/

/***************************************************************************************
  Función para modificar del estado el buttonType de estado de un objeto del tipo
  de botón de secuencia en función de su estado.
****************************************************************************************/
void cambiarEstadoBotonObjeto(string dp1, bool estado)
{
  string pathDownpixmap, pathUppixmap;

  pathDownpixmap = this.buttonDownPixmap();  //Recuperamos el buttonDownPixmap de relleno del objeto
  pathUppixmap = this.buttonUpPixmap();  //Recuperamos el buttonUpPixmap de relleno del objeto

  if (pathDownpixmap == "")
  {
    pathDownpixmap = pathUppixmap; //Si el path de la imagen del button DownPixmap está vacia se rellena con la del UpPixmap que debe estar rellena al colocar el button
  }

  if (estado)
  {
    strreplace(pathDownpixmap, "_off", "_on");  //Remplazamos la ruta de la imagen del button DownPixmap de OFF A ON
    strreplace(pathUppixmap, "_off", "_on");  //Remplazamos la ruta de la imagen del button UpPixmap de OFF A ON

    this.buttonType(BT_PIXMAP);
    this.buttonDownPixmap(pathDownpixmap);
    this.buttonUpPixmap(pathUppixmap);
  }
  else
  {
    strreplace(pathDownpixmap, "_on", "_off");  //Remplazamos la ruta de la imagen del button DownPixmap de ON A OFF
    strreplace(pathUppixmap, "_on", "_off");  //Remplazamos la ruta de la imagen del button UpPixmap de ON A OFF

    this.buttonType(BT_PIXMAP);
    this.buttonDownPixmap(pathDownpixmap);
    this.buttonUpPixmap(pathUppixmap);
  }
}
/******* Fin de la función cambiarEstadoBotonObjeto() *********/

/***************************************************************************************
  Función con dpConnectUserData para cuando se produzca un cambio de estado en el
  estado de una válvula monoestable.
****************************************************************************************/
void cambiar_estado_valvula_monoestable(string inst, string variable, string editable, string nom_obj_graf)
{
  string alias_dp;

  if (!dpExists(inst + "." + variable))  //Comprobamos si no existe el DP
  {
    this.color("LIB_IRC_MORADO_01");
    this.foreCol("LIB_IRC_MORADO_01");
    return;
  }

  alias_dp = dpGetAlias(inst + ".");  //Recuperamos el alias de la instancia
  setMultiValue(nom_obj_graf, "toolTipText", alias_dp,  //Establecemos el tooltips con el nombre del tag para mostrarse cuando se pase el ratón por encima del objeto
                nom_obj_graf, "editable", editable);  //Establecemos si el objeto será editable o no encima del objeto

  dpConnectUserData("cambiar_estado_valvula_monoestable_objeto", nom_obj_graf, inst + "." + variable);
}
/******* Fin de la función cambiar_estado_valvula_monoestable() *********/

/***************************************************************************************
  Función para modificar el valor del TextField de un objeto válvula.
****************************************************************************************/
void cambiar_estado_valvula_monoestable_objeto(string nom_obj, string dp1, bool estado)
{
  if (estado == 0 || estado == 10 && estado == 100 && estado == 110)
  {
    setValue(nom_obj, "text", "Cerrada");
  }
  else if (estado == 1 || estado == 11 && estado == 101 && estado == 111)
  {
    setValue(nom_obj, "text", "Abierta");
  }
}
/******* Fin de la función cambiar_estado_valvula_monoestable_objeto() *********/

//******Función para cambiar la pantalla actual que se muestra en el SCADA.
void cambiar_pantalla_actual(string pantalla_actual, string pantalla = myModuleName())
{
  int n_ui = myUiNumber();
  strreplace(pantalla, "PANTALLA", "");
  dpSetWait("ui_" + n_ui + "_pantalla_" + pantalla + ".pantalla_actual", pantalla_actual);
}
/******* Fin de la función cambiar_pantalla_actual() *********/

/***************************************************************************************
  Función para devolver el número de pantalla.
****************************************************************************************/
int numero_pantalla()
{
  int n_pantalla;

  if (myModuleName() == "PANTALLA1")
  {
    n_pantalla = 1;
  }
  else if (myModuleName() == "PANTALLA2")
  {
    n_pantalla = 2;
  }
  else if (myModuleName() == "PANTALLA3")
  {
    n_pantalla = 3;
  }
  else if (myModuleName() == "PANTALLA4")
  {
    n_pantalla = 4;
  }
  else if (myModuleName() == "PANTALLA5")
  {
    n_pantalla = 5;
  }
  else if (myModuleName() == "PANTALLA6")
  {
    n_pantalla = 6;
  }

  return n_pantalla;

}
/******* Fin de la función numero_pantalla() *********/

/***************************************************************************************
  Cambia el color de la pestaña seleccionada.
****************************************************************************************/
void cambiar_fondo_btns_objeto(string nom_obj, dyn_string btns)
{
  for (int u = 1; u <= dynlen(btns); u++)
  {
    if (nom_obj == btns[u])
    {
      setValue(nom_obj, "backCol", "LIB_DEUSER_AZUL_06");
    }
    else
    {
      setValue(btns[u], "backCol", "LIB_IRC_AZUL_01");
    }
  }
}
/******* Fin de la función cambiar_estado_btns_objeto() *********/

/*** Funcion para abrir faceplates desde un botón. ***/
void abrirFaceplates(string inst, bool autoModificable, string elemento, bool inha, bool esq, bool tag)
{
  string pathFaceplates, tipoInst;
  tipoInst = dpTypeName(inst);
  pathFaceplates = rutaFaceplates + tipoInst + "/" + tipoInst + ".pnl";

  ChildPanelOnCentral(pathFaceplates, dpGetDescription(inst + "."), makeDynString("$INST:" + inst,
                      "$TIPO_INST:" + tipoInst,
                      "$AUTO_MODIF:" + autoModificable,
                      "$ELEM:" + elemento,
                      "$INHA:" + inha,
                      "$ESQ_ELEC:" + esq,
                      "$TAG:" + tag));
}
/*** Fin de la función abrirFaceplates() ***/

/*** Función con dpConnectUserData para cuando se produzca un cambio en el valor de una variable. ***/
void cambiarValor(string dp, string unidad, int decimales)// Pasamos por parametros el DP completo de la varaible a visualizar, la unidad de la variable y los decimales que tendrá el valor
{
  dyn_anytype parametros;

  if (!dpExists(dp))  //Comprobamos si existe el DP. Sino existe se mostrará morado.
  {
    this.color("LIB_IRC_MORADO_01");
    this.foreCol("LIB_IRC_MORADO_01");
    return;
  }

  parametros = makeDynAnytype(decimales, unidad);//Añadimos los decimales y la unidad a una variable dyn_anytype para pasarselos a la función del dpConnectUserData
  dpConnectUserData("cambiarValorObjeto", parametros, dp);
}
/*** Fin de la función cambiarValor() ***/

/*** Función de dpConnectUserData para cuando se produzca un cambio en el valor de una variable.
     Esta función formatea el texto y le da color al campo según las alarmas de una variable analógica ***/
void cambiarValorObjeto(dyn_anytype parametros, string dp1, float valor)
{
  string texto, decimales = parametros[1], unidad = parametros[2], valorString = "yxxxxx", tipoInst = dpTypeName(dp1);// obtenemos el dptype del DP para comprobar si es una analógica
  dyn_string dpSplit;
  bool valorLL, valorHH, valorL, valorH, fondoEscala;

  if (unidad == "FALSE") // Si la unidad es FALSE no se mostrará nada en el texto
  {
    unidad = "";
  }
  else if (unidad == "NULL")//Si la unidad es NULL mostraremos la unidad por defecto del DP
  {
    unidad = dpGetUnit(dp1); //recuperarmos la unidad que tiene asignada el dp
  }

  sprintf(valorString, "%6." + decimales + "f", valor);//Formatea a string con 6 números enteros y el número de decimales que pasemos por parametro

  texto = valorString + " " + unidad; // unimos el valor formateado y la unidad


  if (tipoInst == "504_LIB_TRATAMIENTO_ANALOGICA")//Comprobamos si el DPType es una analógica.
  {
    dpSplit = strsplit(dp1, ".");//Separamos el nombre del DP para obtener solo el nombre del DP sin variable asociada para poder obener otras variables
    dpGet(dpSplit[1] + ".Output.Yd_ALL", valorLL,//Alarma muy baja
          dpSplit[1] + ".Output.Yd_AL", valorL,//Aviso baja
          dpSplit[1] + ".Output.Yd_AH", valorH,//Aviso alta
          dpSplit[1] + ".Output.Yd_AHH", valorHH,//Alarma muy alta
          dpSplit[1] + ".Output.Yd_FondoEscala", fondoEscala);//Alarma fondo de escala

    if (fondoEscala)//Si la analógica esta a fondo de escala se mostrará ERROR en rojo.
    {
      this.text("ERROR");
      this.backCol("LIB_IRC_BLANCO");
      this.foreCol("LIB_IRC_ROJO_04");
    }
    else // Sino se comprobará que el resto de alarmas estan activas y se mostrará el campo de diferentes colores
    {
      if (valorLL || valorHH)//si hay alarma se mostrará fondo rojo letra blanca
      {
        this.backCol("LIB_IRC_ROJO_04");
        this.foreCol("LIB_IRC_BLANCO");
      }
      else if (valorL || valorH)//si hay aviso se mostrará fondo amarillo letra negra
      {
        this.backCol("LIB_IRC_AMARILLO_01");
        this.foreCol("LIB_IRC_NEGRO");
      }
      else//si no hay alarmas ni avisos se mostrará fondo blanco y letra azul
      {
        this.backCol("LIB_IRC_BLANCO");
        this.foreCol("LIB_IRC_AZUL_01");
      }

      this.text(texto); //se muestra el valor formateado y su unidad
    }
  }
  else// si la variable no es analógica se muestra solo el texto sin cambios de color
  {
    this.text(texto);//se muestra el valor formateado y su unidad
  }
}
/*** Fin de la función cambiarValorObjeto() ***/
