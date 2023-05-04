//-----------------CLASES ESENCIALES----------------------
class lib_accionamiento_valvula
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Input
  private static string xd_inha = "Input.Xd_INHA";
  private static string xi_modo = "Input.Xi_MODO";

  //Output
  private static string yb_est = "Output.Yb_EST";

  //InOut
  private static string xd_m_om_f1 = "InOut.Xd_M_OM_F1";

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //DATOS_ALARMA

  //Input
  private static string xt_tiempovigilancia_cm_f1 = "Static.DATOS_ALARMA.Input.Xt_TiempoVigilancia_CM_F1";
  private static string xt_tiempovigilancia_cp_f1 = "Static.DATOS_ALARMA.Input.Xt_TiempoVigilancia_CP_F1";

  //Output
  private static string yd_alarma_general = "Static.DATOS_ALARMA.Output.Yd_Alarma_General";
  private static string yd_alarma_ep = "Static.DATOS_ALARMA.Output.Yd_Alarma_EP";
  private static string yd_alarma_cm_f1 = "Static.DATOS_ALARMA.Output.Yd_Alarma_CM_F1";
  private static string yd_alarma_cp_f1 = "Static.DATOS_ALARMA.Output.Yd_Alarma_CP_F1";
  private static string yd_alarma_ext = "Static.DATOS_ALARMA.Output.Yd_Alarma_EXT";

  //Unidades
  //Tiempos
  private static string uni_tiempo = " s";

  //CONSTRUCTOR
  public lib_accionamiento_valvula(string instancia, string tipo){
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

  public string get_st_modo_auto(){
    return this.instancia + "." + this.st_modo_auto;
  }

  public string get_st_modo_manual(){
    return this.instancia + "." + this.st_modo_man;
  }

  public string get_st_modo_manual_remoto(){
    return this.instancia + "." + this.st_modo_man_r;
  }

  public string get_st_modo_manual_local(){
    return this.instancia + "." + this.st_modo_man_l;
  }

  public string get_st_modo_manual_mantenimiento(){
    return this.instancia + "." + this.st_modo_man_m;
  }

  public string get_parar_lim(){
    return this.instancia + "." + this.cfg_parar_lim;
  }

  public string get_tiempovigilancia_cm_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cm_f1;
  }

  public string get_tiempovigilancia_cp_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cp_f1;
  }

  public string get_tiempoalarma_CF_MODO(){
    return this.instancia + "." + this.xi_alm_cf_modo;
  }

  public string get_alm_general(){
    return this.instancia + "." + this.yd_alarma_general;
  }

  public string get_alm_ep(){
    return this.instancia + "." + this.yd_alarma_ep;
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
  //Tiempo
  public static string unidad_tiempo(){
    return uni_tiempo;
  }

  //--Acciones sobre el motor--
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

  //Para el motor de forma manual (VALVULAS SIMPLES)
  public void cierre_manual(){
    dpSet(get_m_om_f1(), 0);  //Poner InOut.Xd_M_OM_AB a 0
  }

  //Arranca el motor de forma manual (VALVULAS SIMPLES)
  public void apertura_manual(){
    dpSet(get_m_om_f1(), 1);
  }

  public void set_tiempovigilancia_cm_f1(int tiempo){
    dpSet(get_tiempovigilancia_cm_f1(), tiempo);
  }

  public void set_tiempovigilancia_cp_f1(int tiempo){
    dpSet(get_tiempovigilancia_cp_f1(), tiempo);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(xi_modo, TRUE),makeDynAnytype(yb_est, TRUE),
                                             makeDynAnytype(xd_m_om_f1, FALSE),
                                             makeDynAnytype(xt_tiempovigilancia_cm_f1, FALSE), makeDynAnytype(xt_tiempovigilancia_cp_f1, FALSE),
                                             makeDynAnytype(yd_alarma_general, TRUE), makeDynAnytype(yd_alarma_ep, TRUE), makeDynAnytype(yd_alarma_cm_f1, TRUE),
                                             makeDynAnytype(yd_alarma_cp_f1, TRUE), makeDynAnytype(yd_alarma_ext, FALSE),makeDynAnytype(archivado_bbdd, FALSE));

//     variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(xi_modo, FALSE),makeDynAnytype(yb_est, FALSE),
//                                              makeDynAnytype(xd_m_om_f1, FALSE),
//                                              makeDynAnytype(st_modo_auto, FALSE), makeDynAnytype(st_modo_man, FALSE), makeDynAnytype(cfg_parar_lim, FALSE),
//                                              makeDynAnytype(xt_tiempovigilancia_cm_f1, FALSE), makeDynAnytype(xt_tiempovigilancia_cp_f1, FALSE), makeDynAnytype(xi_alm_cf_modo, FALSE),
//                                              makeDynAnytype(yd_alarma_general, FALSE), makeDynAnytype(yd_alarma_ep, FALSE), makeDynAnytype(yd_alarma_cm_f1, FALSE),
//                                              makeDynAnytype(yd_alarma_cp_f1, FALSE),makeDynAnytype(archivado_bbdd, FALSE), makeDynAnytype(yd_alarma_ext, FALSE),makeDynAnytype(st_modo_man_r, FALSE),
//                                              makeDynAnytype(st_modo_man_l, FALSE), makeDynAnytype(st_modo_man_m, FALSE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(xd_inha, ""), makeDynAnytype(xi_modo, ""),makeDynAnytype(yb_est, ""),
                                             makeDynAnytype(xd_m_om_f1, ""),
                                             makeDynAnytype(xt_tiempovigilancia_cm_f1, "s"), makeDynAnytype(xt_tiempovigilancia_cp_f1, "s"),
                                             makeDynAnytype(yd_alarma_general, ""), makeDynAnytype(yd_alarma_ep, ""), makeDynAnytype(yd_alarma_cm_f1, ""),
                                             makeDynAnytype(yd_alarma_cp_f1, ""), makeDynAnytype(yd_alarma_ext, ""),makeDynAnytype(archivado_bbdd, ""));

      return (variable_unidad_dp);
    }
};
