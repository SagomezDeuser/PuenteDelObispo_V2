//-----------------CLASES ESENCIALES----------------------
class lib_accionamiento_motor_s_var
{
  //Configuración de la instancia del lib_deuser_motor_s_vf_an
  public string instancia;
  public string tipo;

  //--------------Data Point Connection---------------

  //Input
  private static string xd_inha = "Input.Xd_INHA";
  private static string xi_modo = "Input.Xi_MODO";
  private static string xr_dato_1 = "Input.Xr_Dato_1";  //Frecuencia
  private static string xr_dato_2 = "Input.Xr_Dato_2";   //Velocidad
  private static string xr_dato_3 = "Input.Xr_Dato_3";  //Intensidad

  //Output
  private static string yb_est = "Output.Yb_EST";
  private static string yr_csg = "Output.Yr_CSG";

  //InOut
  private static string xd_m_om_f1 = "InOut.Xd_M_OM_F1";
  private static string xr_a_csg = "InOut.Xr_A_CSG";
  private static string xr_m_csg = "InOut.Xr_M_CSG";

  //Static
  private static string cfg_csg_limite_min = "Static.CFG_CSG_LIMITE_MIN";
  private static string cfg_csg_limite_max = "Static.CFG_CSG_LIMITE_MAX";
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //DATOS_ALARMA

  //Input
  private static string xt_tiempovigilancia_cm_f1 = "Static.DATOS_ALARMA.Input.Xt_TiempoVigilancia_CM_F1";
  private static string xt_tiempovigilancia_cp_f1 = "Static.DATOS_ALARMA.Input.Xt_TiempoVigilancia_CP_F1";

  //Output
  private static string yd_alarma_general = "Static.DATOS_ALARMA.Output.Yd_Alarma_General";
  private static string yd_alarma_ep = "Static.DATOS_ALARMA.Output.Yd_Alarma_EP";
  private static string yd_alarma_vf = "Static.DATOS_ALARMA.Output.Yd_Alarma_VF";
  private static string yd_alarma_cm_f1 = "Static.DATOS_ALARMA.Output.Yd_Alarma_CM_F1";
  private static string yd_alarma_cp_f1 = "Static.DATOS_ALARMA.Output.Yd_Alarma_CP_F1";
  private static string yd_alarma_ext = "Static.DATOS_ALARMA.Output.Yd_Alarma_EXT";

  //DATOS_TIEMPOS_MARCHA

  //Input
  private static string xd_reset_parcial = "Static.DATOS_TIEMPOS_MARCHA.Input.Xd_RESET_PARCIAL";
  private static string xd_reset_total = "Static.DATOS_TIEMPOS_MARCHA.Input.Xd_RESET_TOTAL";
  private static string xd_habilitar = "Static.DATOS_TIEMPOS_MARCHA.Input.Xd_HABILITAR";

  //Output
  private static string yi_contador_seg_parciales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Seg_Parciales";
  private static string yi_contador_min_parciales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Min_Parciales";
  private static string yi_contador_horas_parciales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Horas_Parciales";
  private static string yi_contador_dias_parciales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Dias_Parciales";
  private static string yi_contador_seg_totales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Seg_Totales";
  private static string yi_contador_min_totales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Min_Totales";
  private static string yi_contador_horas_totales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Horas_Totales";
  private static string yi_contador_dias_totales = "Static.DATOS_TIEMPOS_MARCHA.Output.Yi_Contador_Dias_Totales";

  //Unidades
  //Consigna manual
  private static string uni_cm = " %";

  //Velocidad actual
  private static string uni_vel = " rpm";

  //Corriente
  private static string uni_corriente = " A";

  //Frecuencia
  private static string uni_frecuencia = " Hz";

  //Tiempos
  private static string uni_tiempo = " s";

  //CONSTRUCTOR de la clase motor_s_vf_an
  public lib_accionamiento_motor_s_var(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  //--FORMACIÓN DE CADENAS CON LOS NOMBRES DE LOS DP--
  public string get_inhabilitado(){
    return this.instancia + "." + this.xd_inha;
  }

   public string get_estado(){
    return this.instancia + "." + this.yb_est;
  }

  public string get_modo(){
    return this.instancia + "." + this.xi_modo;
  }

  public string get_m_om_f1(){
    return this.instancia + "." + this.xd_m_om_f1;
  }

  public string get_sr_csg(){
    return this.instancia + "." + this.yr_csg;
  }

  public string get_frecuencia()
  {
    return this.instancia + "." + this.xr_dato_1;
  }

  public string get_velocidad(){
    return this.instancia + "." + this.xr_dato_2;
  }

  public string get_intensidad(){
    return this.instancia + "." + this.xr_dato_3;
  }

  public string get_consigna_automatico(){
    return this.instancia + "." + this.xr_a_csg;
  }

  public string get_consigna_manual(){
    return this.instancia + "." + this.xr_m_csg;
  }

  public string get_limite_consigna_min(){
    return this.instancia + "." + this.cfg_csg_limite_min;
  }

  public string get_limite_consigna_max(){
    return this.instancia + "." + this.cfg_csg_limite_max;
  }

  public string get_tiempo_cm_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cm_f1;
  }

  public string get_tiempo_cp_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cp_f1;
  }

  public string get_alm_ep(){
    return this.instancia + "." + this.yd_alarma_ep;
  }

  public string get_alm_vf(){
    return this.instancia + "." + this.yd_alarma_vf;
  }

  public string get_alm_cm_f1(){
    return this.instancia + "." + this.yd_alarma_cm_f1;
  }

  public string get_alm_cp_f1(){
    return this.instancia + "." + this.yd_alarma_cp_f1;
  }

  public string get_alm_ext(){
    return this.instancia + "." + this.yd_alarma_ext;
  }

  //--Métodos para recuperar las unidades--
  //Consigna manual
  public static string unidad_cm(){
    return uni_cm;
  }

  //Velocidad actual
  public static string unidad_vel(){
    return uni_vel;
  }

  //Corriente
  public static string unidad_corriente(){
    return uni_corriente;
  }

  //Frecuencia
  public static string unidad_frecuencia(){
    return uni_frecuencia;
  }

  //Tiempo
  public static string unidad_tiempo(){
    return uni_tiempo;
  }

  //--Acciones sobre el motor_s_vf_an--
  //Cambia a modo automático
  public void set_automatico(){
    dpSet(get_modo(), 0);  //Poner Xi_MODO en automatico
  }

  //Cambia a modo manual
  public void set_manual_remoto(){
    dpSet(get_modo(), 10);  //Poner Xi_MODO en manual remoto
  }

  public void set_manual_local(){
    dpSet(get_modo(), 11);  //Poner Xi_MODO en manual local
  }

  public void set_manual_mantenimiento(){
    dpSet(get_modo(), 12);  //Poner Xi_MODO en manual mantenimiento
  }

  public void set_inhabilitado(){
    dpSet(get_modo(), 255);  //Poner Xi_MODO en modo inhabilitado
  }

  //Para el motor_s_vf_an de forma manual (MOTORES SIMPLES)
  public void parar_manual(){
    dpSet(get_m_om_f1(), 0);
  }

  //Arranca el motor_s_vf_an de forma manual (MOTORES SIMPLES)
  public void arrancar_manual(){
    dpSet(get_m_om_f1(), 1);
  }

  public void set_tiempo_cm_f1(int tiempo){
    dpSet(get_tiempo_cm_f1(), tiempo);
  }

  public void set_tiempo_cp_f1(int tiempo){
    dpSet(get_tiempo_cp_f1(), tiempo);
  }

  public void set_tiempo_arranque(int tiempo){
    dpSet(get_tiempo_arranque(), tiempo);
  }

  public void set_tiempo_paro(int tiempo){
    dpSet(get_tiempo_paro(), tiempo);
  }

  //Establece la consigna manual
  public void set_consigna_manual(float consigna){
    dpSet(get_consigna_manual(), consigna);
  }

  //Establece la consigna automatico
  public void set_consigna_automatico(float consigna){
    dpSet(get_consigna_automatico(), consigna);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(xi_modo, TRUE),
                                             makeDynAnytype(yb_est, TRUE), makeDynAnytype(yr_csg, TRUE),
                                             makeDynAnytype(xd_m_om_f1, TRUE), makeDynAnytype(xr_a_csg, FALSE), makeDynAnytype(xr_m_csg, FALSE),
                                             makeDynAnytype(cfg_csg_limite_min, FALSE), makeDynAnytype(cfg_csg_limite_max, FALSE),
                                             makeDynAnytype(xt_tiempovigilancia_cm_f1, FALSE), makeDynAnytype(xt_tiempovigilancia_cp_f1, FALSE),
                                             makeDynAnytype(yd_alarma_general, TRUE), makeDynAnytype(yd_alarma_ep, TRUE), makeDynAnytype(yd_alarma_vf, TRUE),
                                             makeDynAnytype(yd_alarma_cm_f1, TRUE), makeDynAnytype(yd_alarma_cp_f1, TRUE),makeDynAnytype(xd_reset_parcial, FALSE), makeDynAnytype(xd_reset_total, FALSE),
                                             makeDynAnytype(yi_contador_seg_parciales, FALSE), makeDynAnytype(yi_contador_min_parciales, FALSE), makeDynAnytype(yi_contador_horas_parciales, FALSE), makeDynAnytype(yi_contador_dias_parciales, FALSE),
                                             makeDynAnytype(yi_contador_seg_totales, FALSE), makeDynAnytype(yi_contador_min_totales, FALSE), makeDynAnytype(yi_contador_horas_totales, FALSE), makeDynAnytype(yi_contador_dias_totales, FALSE),
                                             makeDynAnytype(xr_dato_1, TRUE),
                                             makeDynAnytype(xr_dato_2, TRUE), makeDynAnytype(xr_dato_3, TRUE),
                                             makeDynAnytype(archivado_bbdd, FALSE),
                                             makeDynAnytype(yd_alarma_ext, TRUE),makeDynAnytype(xd_habilitar, FALSE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(xd_inha, ""), makeDynAnytype(xi_modo, ""),
                                        makeDynAnytype(yb_est, ""), makeDynAnytype(yr_csg, ""),
                                        makeDynAnytype(xd_m_om_f1, ""), makeDynAnytype(xr_a_csg, "rpm"), makeDynAnytype(xr_m_csg, "rpm"),
                                        makeDynAnytype(cfg_csg_limite_min, ""), makeDynAnytype(cfg_csg_limite_max, ""),
                                        makeDynAnytype(xt_tiempovigilancia_cm_f1, "s"), makeDynAnytype(xt_tiempovigilancia_cp_f1, "s"),
                                        makeDynAnytype(yd_alarma_general, ""), makeDynAnytype(yd_alarma_ep, ""), makeDynAnytype(yd_alarma_vf, ""),
                                        makeDynAnytype(yd_alarma_cm_f1, ""), makeDynAnytype(yd_alarma_cp_f1, ""),makeDynAnytype(xd_reset_parcial, ""), makeDynAnytype(xd_reset_total, ""),
                                        makeDynAnytype(yi_contador_seg_parciales, "s"), makeDynAnytype(yi_contador_min_parciales, "min"), makeDynAnytype(yi_contador_horas_parciales, "h"), makeDynAnytype(yi_contador_dias_parciales, ""),
                                        makeDynAnytype(yi_contador_seg_totales, "s"), makeDynAnytype(yi_contador_min_totales, "min"), makeDynAnytype(yi_contador_horas_totales, "h"), makeDynAnytype(yi_contador_dias_totales, ""),
                                        makeDynAnytype(xr_dato_1, "Hz"),makeDynAnytype(xr_dato_2, "rpm"), makeDynAnytype(xr_dato_3, "A"),
                                        makeDynAnytype(archivado_bbdd, ""),
                                        makeDynAnytype(yd_alarma_ext, ""),makeDynAnytype(xd_habilitar, ""));

      return (variable_unidad_dp);
    }
};
