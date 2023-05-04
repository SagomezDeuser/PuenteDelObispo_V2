//--------------------------------------------------------------------------------
// Listado de variables const a utilizar  en el ctl
const string rutaFaceplates = "vision/faceplates/";
const mapping nomPaneles = makeMapping(0, "_PRINCIPAL",
                                       1, "_CONFIG",
                                       2, "_FUNCIONAMIENTO",
                                       3, "_GRAFICA",
                                       4, "_ESQUEMA_ELECTRICO");



/***************************************************************************************
  @brief Cambia el panel activo del faceplate dependiendo si es PID o no.
  @return No devuelve nada.
****************************************************************************************/
cambiarPanelActivo(int clave, string inst, string autoMod, string elem, string inha, string moduleName, bool tag)
{
  dyn_string dollarPanel;
  string nomPanel, pathPanel, tipoInst = dpTypeName(inst);

  nomPanel = nomPaneles.value(clave, "");

  RootPanelOnModule(rutaFaceplates + tipoInst + "/" + tipoInst + nomPanel + ".pnl", nomPanel, moduleName, makeDynString("$INST:" + inst, "$AUTO_MODIF:" + autoMod, "$TIPO_INST:" + tipoInst, "$ELEM:" + elem, "$INHA:" + inha, "$TAG:" + tag));  //Abrimos el panel principal en otro módulo

}
/******* Fin de la función cambiarPanelActivo() *********/

/***************************************************************************************
  @brief Función para establecer como activa los address de una instancia pasada como
  parámetro junto al tipo de instancia de un faceplates.
****************************************************************************************/
void activarAddressFP(string inst)
{
  dyn_anytype addressActivas;
  string tipoInst = dpTypeName(inst);
  addressActivas = recuperarEstadoAddressClase(tipoInst);  //Recuperamos el Array con las variables de clase de la instancia y su estado original

  for (int k = 1; k <= dynlen(addressActivas); k++)
  {
    if (dpExists(inst + "." + addressActivas[k][1])  && addressActivas[k][1] != "Static.archivado_bbdd") dpSet(inst + "." + addressActivas[k][1] + ":_address.._active", TRUE); //Activamos todas las address de la instancia de la clase pasada como parámetro cuyo DP exista
  }
}
/******* Fin de la función activar_address_fp() *********/

/***************************************************************************************
  @brief Función para establecer como desactiva los address de una instancia pasada como
  parámetro junto al tipo de instancia de un faceplates.
****************************************************************************************/
void desactivarAddressFP(string inst)
{
  bool estadoAddress, limitador;
  dyn_anytype addressInactivas;
  string tipoInst = dpTypeName(inst);
  addressInactivas = recuperarEstadoAddressClase(tipoInst);  //Recuperamos el Array con las variables de clase de la instancia y su estado original

  for (int r = 1; r <= dynlen(addressInactivas); r++)
  {
    estadoAddress = addressInactivas[r][2];

    if (!estadoAddress && dpExists(inst + "." + addressInactivas[r][1]) && addressInactivas[r][1] != "Static.archivado_bbdd") dpSet(inst + "." + addressInactivas[r][1] + ":_address.._active", FALSE); //Desactivamos todas las address de la instancia de la clase pasada como parámetro cuyo estado original sea FALSE y su DP exista
  }
}
/******* Fin de la función desactivar_address_fp() *********/
