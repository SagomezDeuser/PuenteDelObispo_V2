/***************************************************************************************
  @author dceballos
  @date 28/03/2019.
  @brief Función para establecer un texto en un objeto Primitive Text dependiendo del idioma
  seleccionado por el usuario.
  @return Devuelve el texto traducido a establecer en el objeto Primitive Text.
****************************************************************************************/
string text_idioma_pt(string nom_pt)
{
  shape shape_pt;
  string texto_pt;
  int id_idioma_activo;
  langString text_idiomas;

  shape_pt = getShape(nom_pt);  //Recuperamos mediante el nombre del objeto el shape del mismo para poder tratarlo correctamente

  getValue(shape_pt, "text", text_idiomas);  //Recuperamos todos los textos establecidos en los diferentes idiomas del Primitive Text

  id_idioma_activo = getActiveLang(); //Recuperamos el idioma activo en el sistema

  texto_pt = text_idiomas[id_idioma_activo];  //Recuperamos dependiendo del id del idioma activo el texto dentro del Array con los diferentes texto en los distintos idiomas del objeto Primitive Text

  return (texto_pt);
}
/******* Fin de la función text_idioma_pt() *********/

/***************************************************************************************
  @author dceballos
  @date 07/02/2020.
  @brief Función para mostrar por pantalla un mensaje en el idioma que se encuentre activo.
  Dependiendo del parámetro tipo_mensaje se mostrará valga la redundancia un tipo de mensaje
  u otro. Existen 6 tipos de mensajes;
  0: Mensaje emergente de confirmación que necesita respuesta por parte del usuario.
  1: Mensaje emergente de cancelación que necesita respuesta por parte del usuario.
  2: Mensaje emergente personalizado que necesita respuesta por parte del usuario.
  3: Mensaje emergente informativo de confirmación que NO necesita respuesta por parte del usuario.
  4: Mensaje emergente informativo de cancelación que NO necesita respuesta por parte del usuario.
  5: Mensaje emergente informativo de error que NO necesita respuesta por parte del usuario.
  @return Devuelve la respuesta dado por el usuario en forma de dyn_anytype, con un float
  y un string, donde en el float 1 es aceptar y 0 cancelar.
****************************************************************************************/
dyn_anytype mostrar_msg_emergente(int tipo_mensaje, string kw_msg = "", string kw_titulo = "" )
{
  dyn_float devuelto;
  int id_idioma_activo;
  dyn_anytype respuesta;
  dyn_string devuelto_st;
  string titulo_idioma, msg_idioma;

  DebugN(tipo_mensaje + "\n");
  DebugN(kw_titulo + "\n");
  DebugN(kw_msg + "\n");

  switch(tipo_mensaje){
    case 0:  //Tipo de Confirmación
      ChildPanelOnCentralModalReturn("vision/emergentes/internas/confirmacion_confirmar.pnl", "Confirmación", "", devuelto, devuelto_st);  //Mostramos la ventana de confirmación

      respuesta.append(devuelto);
      respuesta.append(devuelto_st);
      break;
    case 1:   //Tipo de Cancelación
      ChildPanelOnCentralModalReturn("vision/emergentes/internas/confirmacion_cancelar.pnl", "Cancelación", "", devuelto, devuelto_st);  //Mostramos la ventana de cancelación

      respuesta.append(devuelto);
      respuesta.append(devuelto_st);
      break;
    case 2:  //Tipo Personalizado
      id_idioma_activo = getActiveLang();  //Recuperamos el id del idioma activo en el sistema

      kw_titulo = getCatStr("mensajes_emergentes", kw_titulo);  //Recuperamos el título del catálogo correspondiente que se desea mostrar traducido al idioma seleccionado
      kw_msg = getCatStr("mensajes_emergentes", kw_msg);  //Recuperamos el mensaje emergente del catálogo correspondiente que se desea mostrar traducido al idioma seleccionado

      ChildPanelOnCentralModalReturn("vision/emergentes/internas/confirmacion_personalizada.pnl", "Confirmación personalizada",
                                     makeDynString("$TITULO:" + kw_titulo, "$TEXTO:" + kw_msg), devuelto, devuelto_st);  //Mostramos el mensaje de confirmación personalizado

      respuesta.append(devuelto);
      respuesta.append(devuelto_st);
      break;
    case 3:
      id_idioma_activo = getActiveLang();  //Recuperamos el id del idioma activo en el sistema

      kw_msg = getCatStr("mensajes_emergentes", kw_msg);  //Recuperamos el mensaje emergente del catálogo correspondiente que se desea mostrar traducido al idioma seleccionado

      ChildPanelOnCentralModal("vision/emergentes/internas/mensaje_confirmacion.pnl", "Confirmación", makeDynString("$TEXTO:" + kw_msg));  //Mostramos el mensaje de confirmación
      break;
    case 4:
      id_idioma_activo = getActiveLang();  //Recuperamos el id del idioma activo en el sistema

      kw_msg = getCatStr("mensajes_emergentes", kw_msg);  //Recuperamos el mensaje emergente del catálogo correspondiente que se desea mostrar traducido al idioma seleccionado

      DebugN("DESPUES: " + kw_msg + "\n");

      ChildPanelOnCentralModal("vision/emergentes/internas/mensaje_advertencia.pnl", "Advertencia", makeDynString("$TEXTO:" + kw_msg));  //Mostramos el mensaje de advertencia
      break;
    case 5:
      id_idioma_activo = getActiveLang();  //Recuperamos el id del idioma activo en el sistema

      kw_msg = getCatStr("mensajes_emergentes", kw_msg);  //Recuperamos el mensaje emergente del catálogo correspondiente que se desea mostrar traducido al idioma seleccionado

      ChildPanelOnCentralModal("vision/emergentes/internas/mensaje_error.pnl", "Error", makeDynString("$TEXTO:" + kw_msg));  //Mostramos el mensaje de error
      break;
  }

  return (respuesta);
}
/******* Fin de la función mostrar_msg_emergente() *********/

/***************************************************************************************
  @author dceballos
  @date 07/02/2020.
  @brief Función para recuperar la ruta de la imagen de los botones del menu para PC.
  @return Devuelve idioma_st con la ruta de la imagen del idioma seleccionado para la
  botonera del menu para PC.
****************************************************************************************/
string ruta_idioma_botonera_pc()
{
  string idioma_st;
  dyn_string idioma;

  idioma_st = getLocale(getActiveLang()); //Recuperamos el id del idioma activo en el sistema
  idioma = strsplit(idioma_st, ".");
  idioma_st = "iconos/botoneras/botonera_principal_pc/" + idioma[1] + "/";

  return (idioma_st);
}
/******* Fin de la función ruta_idioma_botonera_pc() *********/
