//SCRIPT PARA PARAR EL PROYECTO DE WINCC OA CORRECTAMENTE CUANDO EL SAI LEVE UN TIEMPO FUNCIONANDO. DE ESTA FORMA EVITAMOS CORROMPER EL PROYECTO POR APAGO DE EQUIPO SIN TENSIÓN.
//TIENEN QUE CORRER EN UN CONTROL MANAGER PARA QUE SE EJECUTE SIEMPRE.
//SUSTITUIR LA VARIABLE DE CONTROL DE SAI Y EL NOMBRE DEL PROYECTO
main()
{
  dpConnect("cerrarProyecto", "SUSTITUIR_POR_VARIABLE_SAI"); //Función para cerrar el proyecto adecuadamente cuando el sai lleve x tiempo sin tensión. TIMER controlado por PLC.
}

void cerrarProyecto(string dp1, bool valor)
{
  if (valor)
  {
    dpSet("SUSTITUIR_POR_VARIABLE_SAI",FALSE);//FORZAR A FALSE PARA PODER REINICIAR EL PROYECTO DESPUES DEL APAGADO AUTOMATICO.
    system("C:\\Siemens\\Automation\\WinCC_OA\\3.18\\bin\\WCCILpmon -stopWait -config C:\\WinCC_OA_Proj_3_18\\SUSTITUR_POR_NOMBRE_PROYECTO\\config\\config");
  }
}
