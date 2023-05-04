//-----------------CLASES ESENCIALES----------------------
class lib_accionamiento_valvula_motor
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Input
  private static string xd_inha = "Input.Xd_INHA";
  private static string xi_modo = "Input.Xi_MODO";
  private static string xr_dato_1 = "Input.Xr_Dato_1"; //Posición

  //Output
  private static string yb_est = "Output.Yb_EST";

  //InOut
  private static string xd_m_om_f1 = "InOut.Xd_M_OM_F1";
  private static string xd_m_om_f2 = "InOut.Xd_M_OM_F2";
  private static string xr_a_csg = "InOut.Xr_A_CSG";
  private static string xr_m_csg = "InOut.Xr_M_CSG";

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
  private static string yd_alarma_pos = "Static.DATOS_ALARMA.Output.Yd_Alarma_POS";

  //Unidades
  //Consigna manual
  private static string uni_frecuencia = "Hz";

  //Tiempos
  private static string uni_tiempo = " s";

  //Posicion
  private static string uni_posicion = "%";


  //CONSTRUCTOR de la clase valvula_motorizada
  public lib_accionamiento_valvula_motor(string instancia, string tipo){
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

  public string get_m_om_f2(){
    return this.instancia + "." + this.xd_m_om_f2;
  }

  public string get_posicion(){
    return this.instancia + "." + this.xr_dato_1;
  }

  public string get_consigna_automatico(){
    return this.instancia + "." + this.xr_a_csg;
  }

  public string get_consigna_manual(){
    return this.instancia + "." + this.xr_m_csg;
  }

  public string get_tiempovigilancia_cm_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cm_f1;
  }

  public string get_tiempovigilancia_cp_f1(){
    return this.instancia + "." + this.xt_tiempovigilancia_cp_f1;
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

  public string get_alm_pos(){
    return this.instancia + "." + this.yd_alarma_pos;
  }

  //--Métodos para recuperar las unidades--
  //Consigna manual
  public static string unidad_frecuencia(){
    return uni_frecuencia;
  }

  //Tiempo
  public static string unidad_tiempo(){
    return uni_tiempo;
  }

  //Posicion
  public static string unidad_posicion(){
    return uni_posicion;
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

  //Cierra la valvula de forma manual
  public void cierre_manual(){
    dpSet(get_m_om_f1(), 0);
  }

  //Abre la valvula de forma manual
  public void apertura_manual(){
    dpSet(get_m_om_f1(), 1);  //Poner InOut.Xd_M_OM_F1 a 1
  }

//   public void set_tiempo_cm(int tiempo){
//     dpSet(get_tiempo_cm(), tiempo);
//   }

  public void set_tiempovigilancia_cm_f1(int tiempo){
    dpSet(Get_tiempovigilancia_cm_f1(), tiempo);
  }

  public void set_tiempovigilancia_cp_f1(int tiempo){
    dpSet(get_tiempovigilancia_cp_f1(), tiempo);
  }

  //Establece la consigna manual
  public void set_consigna_manual(float consigna){
    dpSet(get_consigna_manual(), consigna);
  }

  //Establece la consigna automatica
  public void set_consigna_automatico(float consigna){
    dpSet(get_consigna_automatico(), consigna);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(xi_modo, TRUE),
                                             makeDynAnytype(yb_est, TRUE),
                                             makeDynAnytype(xd_m_om_f1, FALSE), makeDynAnytype(xd_m_om_f2, FALSE), makeDynAnytype(xr_a_csg, FALSE), makeDynAnytype(xr_m_csg, FALSE),
                                             makeDynAnytype(xt_tiempovigilancia_cm_f1, FALSE), makeDynAnytype(xt_tiempovigilancia_cp_f1, FALSE),
                                             makeDynAnytype(yd_alarma_general, TRUE), makeDynAnytype(yd_alarma_ep, TRUE), makeDynAnytype(yd_alarma_cm_f1, TRUE), makeDynAnytype(yd_alarma_cp_f1, TRUE),makeDynAnytype(archivado_bbdd, FALSE),
                                             makeDynAnytype(yd_alarma_ext, TRUE),makeDynAnytype(yd_alarma_pos, TRUE),
                                             makeDynAnytype(xr_dato_1, TRUE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(xd_inha, ""), makeDynAnytype(xi_modo, ""),
                                        makeDynAnytype(yb_est, ""),
                                        makeDynAnytype(xd_m_om_f1, ""), makeDynAnytype(xd_m_om_f1, ""), makeDynAnytype(xr_a_csg, "%"), makeDynAnytype(xr_m_csg, "%"),
                                        makeDynAnytype(xt_tiempovigilancia_cm_f1, "s"), makeDynAnytype(xt_tiempovigilancia_cp_f1, "s"),
                                        makeDynAnytype(yd_alarma_general, ""), makeDynAnytype(yd_alarma_ep, ""), makeDynAnytype(yd_alarma_cm_f1, ""), makeDynAnytype(yd_alarma_cp_f1, ""),makeDynAnytype(archivado_bbdd, ""),
                                        makeDynAnytype(yd_alarma_ext, ""),makeDynAnytype(yd_alarma_pos, ""),
                                        makeDynAnytype(xr_dato_1, "%"));

      return (variable_unidad_dp);
    }
};
