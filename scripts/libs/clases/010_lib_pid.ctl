//-----------------CLASES ESENCIALES----------------------
class lib_pid
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  private static string xr_setpoint = "Xr_SetPoint";
  private static string xr_valorproceso = "Xr_ValorProceso";
  private static string xr_gain = "Xr_Gain";
  private static string xr_output_maximo = "Xr_Output_Maximo";
  private static string xr_output_minimo = "Xr_Output_Minimo";
  private static string xr_ti = "Xr_Ti";
  private static string xr_td = "Xr_Td";
  private static string xr_setpoint_maximo = "Xr_SetPoint_Maximo";
  private static string xr_setpoint_minimo = "Xr_SetPoint_Minimo";
  private static string xr_manualvalue = "Xr_ManualValue";
  private static string yr_output = "Yr_Output";
  private static string xd_habilitado_1 = "Xd_Habilitado_1";
  private static string xd_habilitado_2 = "Xd_Habilitado_2";

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //CONSTRUCTOR de la clase lib_pid
  public lib_pid(string instancia, string tipo)
  {
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia()
  {
    return this.instancia;
  }

  //--FORMACIÓN DE CADENAS CON LOS NOMBRES DE LOS DP--
  public string get_setpoint()
  {
    return this.instancia + "." + this.xr_setpoint;
  }

  public string get_valorproceso()
  {
    return this.instancia + "." + this.xr_valorproceso;
  }

  public string get_gain()
  {
    return this.instancia + "." + this.xr_gain;
  }

  public string get_ti()
  {
    return this.instancia + "." + this.xr_ti;
  }

  public string get_td()
  {
    return this.instancia + "." + this.xr_td;
  }

  public string get_setpoint_maximo()
  {
    return this.instancia + "." + this.xr_setpoint_maximo;
  }

  public string get_setpoint_minimo()
  {
    return this.instancia + "." + this.xr_setpoint_minimo;
  }

  public string get_manualvalue()
  {
    return this.instancia + "." + this.xr_manualvalue;
  }

  public string get_output()
  {
    return this.instancia + "." + this.yr_output;
  }
  public string get_output_maximo()
  {
    return this.instancia + "." + this.xr_output_maximo;
  }
  public string get_output_minimo()
  {
    return this.instancia + "." + this.xr_output_minimo;
  }
  public string get_xd_habilitado_1()
  {
    return this.instancia + "." + this.xd_habilitado_1;
  }
  public string get_xd_habilitado_2()
  {
    return this.instancia + "." + this.xd_habilitado_2;
  }

//Escritura de datos a PLC

  public void set_setpoint(float valor)
  {
    dpSet(get_tiempo_cm_f1(), valor);
  }

  public void set_valorproceso(float valor)
  {
    dpSet(get_valorproceso(), valor);
  }

  public void set_gain(float valor)
  {
    dpSet(get_gain(), valor);
  }

  public void set_ti(float valor)
  {
    dpSet(get_ti(), valor);
  }

  public void set_td(float valor)
  {
    dpSet(get_td(), valor);
  }

  public void set_setpoint_maximo(float valor)
  {
    dpSet(get_setpoint_maximo(), valor);
  }

  public void set_setpoint_minimo(float valor)
  {
    dpSet(get_setpoint_minimo(), valor);
  }

  public void set_manualvalue(float valor)
  {
    dpSet(get_manualvalue(), valor);
  }
  public void set_output(float valor)
  {
    dpSet(get_output(), valor);
  }
  public void set_output_maximo(float valor)
  {
    dpSet(get_output_maximo(), valor);
  }
  public void set_output_minimo(float valor)
  {
    dpSet(get_output_minimo(), valor);
  }
  public void set_xd_habilitado_1(float valor)
  {
    dpSet(get_xd_habilitado_1(), valor);
  }
  public void set_xd_habilitado_2(float valor)
  {
    dpSet(get_xd_habilitado_2(), valor);
  }

  public dyn_anytype rellenar_array_address()
  {
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xr_setpoint, TRUE), makeDynAnytype(xr_manualvalue, FALSE),
                              makeDynAnytype(xr_gain, FALSE), makeDynAnytype(xr_ti, FALSE), makeDynAnytype(xr_td, FALSE),
                              makeDynAnytype(xr_setpoint_maximo, TRUE), makeDynAnytype(xr_setpoint_minimo, TRUE),
                              makeDynAnytype(xr_valorproceso, TRUE), makeDynAnytype(yr_output, TRUE), makeDynAnytype(archivado_bbdd, FALSE),
                              makeDynAnytype(xr_output_maximo, FALSE), makeDynAnytype(xr_output_minimo, FALSE), makeDynAnytype(xd_habilitado_1, TRUE), makeDynAnytype(xd_habilitado_2, TRUE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp()
  {
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(xr_setpoint, ""), makeDynAnytype(xr_manualvalue, ""),
                                        makeDynAnytype(xr_gain, ""), makeDynAnytype(xr_ti, ""), makeDynAnytype(xr_td, ""),
                                        makeDynAnytype(xr_setpoint_maximo, ""), makeDynAnytype(xr_setpoint_minimo, ""),
                                        makeDynAnytype(xr_valorproceso, ""), makeDynAnytype(yr_output, ""), makeDynAnytype(archivado_bbdd, ""),
                                        makeDynAnytype(xr_output_maximo, ""), makeDynAnytype(xr_output_minimo, ""), makeDynAnytype(xd_habilitado_1, ""), makeDynAnytype(xd_habilitado_2, ""));
    return (variable_unidad_dp);
  }
};
