//-----------------CLASES ESENCIALES----------------------
class lib_servo
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Input
  private static string xd_pc_om = "Xd_PC_OM";
  private static string xd_mov_om = "Xd_MOV_OM";
  private static string xr_mov_csg = "Xr_MOV_CSG";  //Frecuencia
  private static string xr_mov_vel = "Xr_MOV_VEL";  //Velocidad
  private static string xr_mov_acc = "Xr_MOV_ACC";  //Intensidad

  //Output
  private static string xr_mov_dec = "Xr_MOV_DEC";
  private static string xr_mov_jerk = "Xr_MOV_JERK";

  //InOut
  private static string xr_mov_dir = "Xr_MOV_DIR"; //Modo Funcionamiento 1 - Avance
  private static string xr_mov_buffer = "Xr_MOV_BUFFER"; //Modo Funcionamiento 2 - Retroceso
  private static string xd_vel_om_av = "Xd_VEL_OM_AV";
  private static string xd_vel_om_rt = "Xd_VEL_OM_RT";

  //Static
  private static string xr_vel_csg = "Xr_VEL_CSG";
  private static string xr_vel_acc = "Xr_VEL_ACC";
  private static string xr_vel_dec = "Xr_VEL_DEC";
  private static string xr_vel_jerk = "Xr_VEL_JERK";
  private static string yd_ejepreparado = "Yd_EjePreparado";
  private static string yd_ejehabilitado = "Yd_EjeHabilitado";
  private static string yd_ejeenalarma = "Yd_EjeEnAlarma";
  private static string yd_alarmaep = "Yd_AlarmaEP"; ////////////////////////////////////////////////////////////

  //DATOS_ALARMA

  //Input
  private static string yd_ejeenmovimiento = "Yd_EjeEnMovimiento";
  private static string yd_ejereferenciado = "Yd_EjeReferenciado";
  private static string yd_ejeposicionado = "Yd_EjePosicionado";
  private static string yd_ejeposicionactualizada = "Yd_EjePosicionActualizada";
  private static string yd_ejesincronzado_gear = "Yd_EjeSincronizado_GEAR";

  //Output
  private static string yd_ejeenmodo_pc = "Yd_EjeEnModo_PC";
  private static string yd_ejeenmodo_jog = "Yd_EjeEnModo_JOG";
  private static string yd_ejeenmodo_mov = "Yd_EjeEnModo_MOV";
  private static string yd_ejeenmodo_vel = "Yd_EjeEnModo_VEL";
  private static string yr_posicionactual = "Yr_PosicionActual";
  private static string yr_velocidadactual = "Yr_VelocidadActual";
  private static string yr_paractual = "Yr_ParActual";
  private static string xi_mov_mod = "Xi_MOV_MOD";

  //DATOS_TIEMPOS_MARCHA

  //Input
  private static string xd_jog_om = "Xd_JOG_OM";
  private static string xd_jog_oma = "Xd_JOG_OMA";
  private static string xd_jog_omr = "Xd_JOG_OMR";

  //Output
  private static string xr_jog_vel = "Xr_JOG_VEL";
  private static string xr_ovr = "Xr_OVR";

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

  //Par
  private static string uni_par = " Nm";

  //Distancia
  private static string uni_dist = " mm";

  //CONSTRUCTOR de la clase motor_d_vf_an
  public lib_servo(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  //--FORMACIÓN DE CADENAS CON LOS NOMBRES DE LOS DP--
  public string get_pc_om(){
    return this.instancia + "." + this.xd_pc_om;
  }

  public string get_mov_dec(){
    return this.instancia + "." + this.xr_mov_dec;
  }

  public string get_mov_om(){
    return this.instancia + "." + this.xd_mov_om;
  }

  public string get_mov_dir(){
    return this.instancia + "." + this.xr_mov_dir;
  }

  public string get_mov_buffer(){
    return this.instancia + "." + this.xr_mov_buffer;
  }

  public string get_mov_jerk(){
    return this.instancia + "." + this.xr_mov_jerk;
  }

  public string get_vel_dec(){
    return this.instancia + "." + this.xr_vel_dec;
  }

  public string get_vel_jerk(){
    return this.instancia + "." + this.xr_vel_jerk;
  }

  public string get_eje_preparado(){
    return this.instancia + "." + this.yd_ejepreparado;
  }

  public string get_eje_habilitado(){
    return this.instancia + "." + this.yd_ejehabilitado;
  }

  public string get_eje_en_alarma(){
    return this.instancia + "." + this.yd_ejeenalarma;
  }

  public string get_alarmaep(){
    return this.instancia + "." + this.yd_alarmaep; //AAA
  }

  public string get_mov_csg(){
    return this.instancia + "." + this.xr_mov_csg;
  }

  public string get_mov_vel(){
    return this.instancia + "." + this.xr_mov_vel;
  }

  public string get__mov_acc(){
    return this.instancia + "." + this.xr_mov_acc;
  }

  public string get_vel_om_av(){
    return this.instancia + "." + this.xd_vel_om_av;
  }

  public string get_vel_om_rt(){
    return this.instancia + "." + this.xd_vel_om_rt;
  }

  public string get_vel_csg(){
    return this.instancia + "." + this.xr_vel_csg;
  }

  public string get_vel_acc(){
    return this.instancia + "." + this.xr_vel_acc;
  }

  public string get_ejesincronizado_gear(){
    return this.instancia + "." + this.yd_ejesincronzado_gear;
  }

  //Tiempo confirmación marcha 1
  public string get_eje_en_movimiento(){
    return this.instancia + "." + this.yd_ejeenmovimiento;
  }

  //Tiempo confirmación paro 1
  public string get_eje_referenciado(){
    return this.instancia + "." + this.yd_ejereferenciado;
  }

  //Tiempo confirmación marcha 2
  public string get_eje_posicionado(){
    return this.instancia + "." + this.yd_ejeposicionado;
  }

  //Tiempo confirmación paro 2
  public string get_eje_posicion_actualizada(){
    return this.instancia + "." + this.yd_ejeposicionactualizada;
  }

  public string get_tiempo_paro(){
    return this.instancia + "." + this.ef_filtro_ina;   //AAA
  }

  public string get_ejeenmodo_pc(){
    return this.instancia + "." + this.yd_ejeenmodo_pc;  //AAA
  }

  public string get_ejeenmodo_jog(){
    return this.instancia + "." + this.yd_ejeenmodo_jog;
  }

  public string get_ejeenmodo_mov(){
    return this.instancia + "." + this.yd_ejeenmodo_mov;
  }

  public string get_ejeenmodo_vel(){
    return this.instancia + "." + this.yd_ejeenmodo_vel;
  }

  public string get_velocidadactual(){
    return this.instancia + "." + this.yr_velocidadactual;
  }

  public string get_posicionactual(){
    return this.instancia + "." + this.yr_posicionactual;
  }

  public string get_paractual(){
    return this.instancia + "." + this.yr_paractual;
  }

  public string get_mov_mod(){
    return this.instancia + "." + this.xi_mov_mod;
  }

  public string get_jog_om(){
    return this.instancia + "." + this.xd_jog_om;
  }

  public string get_jog_oma(){
    return this.instancia + "." + this.xd_jog_oma;
  }

  public string get_jog_omr(){
    return this.instancia + "." + this.xd_jog_omr;
  }

  public string get_jog_vel(){
    return this.instancia + "." + this.xr_jog_vel;
  }

  public string get_ovr(){
    return this.instancia + "." + this.xr_ovr;
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

  //Par
  public static string unidad_par(){
    return uni_par;
  }

  //Distancia
  public static string unidad_dist(){
    return uni_dist;
  }

  //--Acciones sobre el motor--
  //Cambia a modo automático
  public void set_automatico(){
    dpSet(get_modo(), 0);  //Poner xd_mov_om en automatico
  }

  //Cambia a modo manual
  public void set_manual_remoto(){
    dpSet(get_modo(), 10);  //Poner xd_mov_om en manual remoto
  }

  public void set_manual_local(){
    dpSet(get_modo(), 11);  //Poner xd_mov_om en manual local
  }

  public void set_manual_mantenimiento(){
    dpSet(get_modo(), 12);  //Poner xd_mov_om en manual mantenimiento
  }

  //Para el motor de forma manual
  public void parar_manual(){
    dpSet(get_m_om_f1(), 0);
    dpSet(get_m_om_f2(), 0);
  }

  //Arranca el motor de forma manual sentido av
  public void arrancar_manual_f1(){
     bool f1, f2;
     dpGet(get_m_om_f1(), f1,
           get_m_om_f2(), f2);

     if(!f1 && !f2)  dpSet(get_m_om_f1(), 1);  //Solamente arrancamos si está parado, para evitar que intente arrancar en un sentido si está ya funcionando en el contrario.
  }

  //Arranca el motor de forma manual sentido rt
  public void arrancar_manual_f2(){
     bool f1, f2;
     dpGet(get_m_om_f1(), f1,
           get_m_om_f2(), f2);

     if(!f1 && !f2)  dpSet(get_m_om_f2(), 1);  //Solamente arrancamos si está parado, para evitar que intente arrancar en un sentido si está ya funcionando en el contrario.
  }

  public void set_vel_om_av(bool om_av){
    dpSet(get_vel_om_av(), om_av);
  }

  public void set_vel_om_rt(bool om_rt){
    dpSet(get_vel_om_rt(), om_rt);
  }

  public void set_mov_mod(int modo){
    dpSet(get_mov_mod(), modo);
  }

  public void set_mov_om(bool mov_om){
    dpSet(get_mov_om(), mov_om);
  }

  public void set_jog_om(bool jog_om){
    dpSet(get_jog_om(), jog_om);
  }

  public void set_jog_oma(bool jog_oma){
    dpSet(get_jog_oma(), jog_oma);
  }

  public void set_jog_omr(bool jog_omr){
    dpSet(get_jog_omr(), jog_omr);
  }

  public void set_jog_vel(float jog_vel){
    dpSet(get_jog_vel(), jog_vel);
  }

  public void set_mov_csg(float mov_csg){
    dpSet(get_mov_csg(), mov_csg);
  }

  public void set_mov_vel(float mov_vel){
    dpSet(get_mov_vel(), mov_vel);
  }

  public void set_ovr(float ovr){
    dpSet(get_ovr(), ovr);
  }

  //Establece la consigna manual
  public void set_consigna_manual(float consigna){
    dpSet(get_consigna_manual(), consigna);
  }

  //Establece la consigna automatico
  public void set_consigna_automatico(float consigna){
    dpSet(get_consigna_automatico(), consigna);
  }

  public void set_pc_om(bool pc_om){
    dpSet(get_pc_om(), pc_om);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xd_pc_om, FALSE), makeDynAnytype(xd_mov_om, FALSE), makeDynAnytype(xr_mov_csg, FALSE),
                                             makeDynAnytype(xr_mov_vel, FALSE), makeDynAnytype(xr_mov_acc, FALSE),
                                             makeDynAnytype(xr_mov_dec, FALSE), makeDynAnytype(xr_mov_jerk, FALSE),
                                             makeDynAnytype(xr_mov_dir, FALSE), makeDynAnytype(xr_mov_buffer, FALSE), makeDynAnytype(xr_vel_csg, FALSE),
                                             makeDynAnytype(xr_vel_acc, FALSE), makeDynAnytype(xr_vel_dec, FALSE), makeDynAnytype(xr_vel_jerk, FALSE),
                                             makeDynAnytype(yd_ejepreparado, FALSE),makeDynAnytype(yd_ejehabilitado, FALSE),makeDynAnytype(yd_ejeenalarma, FALSE),makeDynAnytype(yd_alarmaep, FALSE),
                                             makeDynAnytype(yd_ejeenmovimiento, FALSE), makeDynAnytype(yd_ejereferenciado, FALSE), makeDynAnytype(yd_ejeposicionado, FALSE), makeDynAnytype(yd_ejeposicionactualizada, FALSE),
                                             makeDynAnytype(yd_ejesincronzado_gear, FALSE), makeDynAnytype(yd_ejeenmodo_pc, FALSE), makeDynAnytype(yd_ejeenmodo_jog, FALSE), makeDynAnytype(yd_ejeenmodo_mov, FALSE),
                                             makeDynAnytype(yd_ejeenmodo_vel, FALSE), makeDynAnytype(yr_posicionactual, FALSE), makeDynAnytype(yr_velocidadactual, FALSE), makeDynAnytype(yr_paractual, FALSE),
                                             makeDynAnytype(xd_vel_om_av, FALSE), makeDynAnytype(xd_vel_om_rt, FALSE), makeDynAnytype(xi_mov_mod, FALSE), makeDynAnytype(xd_jog_om, FALSE), makeDynAnytype(xd_jog_oma, FALSE),
                                             makeDynAnytype(xd_jog_omr, FALSE), makeDynAnytype(xr_jog_vel, FALSE), makeDynAnytype(xr_ovr, FALSE));

//     variable_estado_address = makeDynAnytype(makeDynAnytype(xd_pc_om, FALSE), makeDynAnytype(xd_mov_om, FALSE), makeDynAnytype(xr_mov_csg, TRUE),
//                                              makeDynAnytype(xr_mov_vel, TRUE), makeDynAnytype(xr_mov_acc, TRUE),
//                                              makeDynAnytype(xr_mov_dec, TRUE), makeDynAnytype(xr_mov_jerk, TRUE),
//                                              makeDynAnytype(xr_mov_dir, FALSE), makeDynAnytype(xr_mov_buffer, FALSE), makeDynAnytype(xr_vel_csg, FALSE),
//                                              makeDynAnytype(xr_vel_acc, FALSE), makeDynAnytype(xr_vel_dec, TRUE), makeDynAnytype(xr_vel_jerk, TRUE),
//                                              makeDynAnytype(yd_ejepreparado, FALSE),makeDynAnytype(yd_ejehabilitado, FALSE),makeDynAnytype(yd_ejeenalarma, TRUE),makeDynAnytype(yd_alarmaep, TRUE),
//                                              makeDynAnytype(yd_ejeenmovimiento, FALSE), makeDynAnytype(yd_ejereferenciado, FALSE), makeDynAnytype(yd_ejeposicionado, FALSE), makeDynAnytype(yd_ejeposicionactualizada, FALSE),
//                                              makeDynAnytype(yd_ejesincronzado_gear, FALSE), makeDynAnytype(yd_ejeenmodo_pc, TRUE), makeDynAnytype(yd_ejeenmodo_jog, TRUE), makeDynAnytype(yd_ejeenmodo_mov, TRUE),
//                                              makeDynAnytype(yd_ejeenmodo_vel, TRUE), makeDynAnytype(yr_posicionactual, TRUE), makeDynAnytype(yr_velocidadactual, TRUE), makeDynAnytype(yr_paractual, TRUE),
//                                              makeDynAnytype(xd_vel_om_av, FALSE), makeDynAnytype(xd_vel_om_rt, FALSE), makeDynAnytype(xi_mov_mod, FALSE), makeDynAnytype(xd_jog_om, FALSE), makeDynAnytype(xd_jog_oma, FALSE),
//                                              makeDynAnytype(xd_jog_omr, FALSE), makeDynAnytype(xr_jog_vel, FALSE), makeDynAnytype(xr_ovr, FALSE));
    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

     variable_unidad_dp = makeDynAnytype(makeDynAnytype(xd_pc_om, ""), makeDynAnytype(xd_mov_om, ""), makeDynAnytype(xr_mov_csg, "Hz"),
                                         makeDynAnytype(xr_mov_vel, "rpm"), makeDynAnytype(xr_mov_acc, "A"),
                                         makeDynAnytype(xr_mov_dec, ""), makeDynAnytype(xr_mov_jerk, ""),
                                         makeDynAnytype(xr_mov_dir, ""), makeDynAnytype(xr_mov_buffer, ""), makeDynAnytype(xr_vel_csg, ""),
                                         makeDynAnytype(xr_vel_acc, ""), makeDynAnytype(xr_vel_dec, ""), makeDynAnytype(xr_vel_jerk, ""),
                                         makeDynAnytype(yd_ejepreparado, ""),makeDynAnytype(yd_ejehabilitado, ""),makeDynAnytype(yd_ejeenalarma, ""),makeDynAnytype(yd_alarmaep, ""),
                                         makeDynAnytype(yd_ejeenmovimiento, "s"), makeDynAnytype(yd_ejereferenciado, "s"), makeDynAnytype(yd_ejeposicionado, "s"), makeDynAnytype(yd_ejeposicionactualizada, "s"),
                                         makeDynAnytype(yd_ejesincronzado_gear, ""), makeDynAnytype(yd_ejeenmodo_pc, ""), makeDynAnytype(yd_ejeenmodo_jog, ""), makeDynAnytype(yd_ejeenmodo_mov, ""),
                                         makeDynAnytype(yd_ejeenmodo_vel, ""), makeDynAnytype(yr_posicionactual, ""), makeDynAnytype(yr_velocidadactual, ""), makeDynAnytype(yr_paractual, ""),
                                         makeDynAnytype(xd_vel_om_av, "rpm"), makeDynAnytype(xd_vel_om_rt, "rpm"), makeDynAnytype(xi_mov_mod, ""), makeDynAnytype(xd_jog_om, ""), makeDynAnytype(xd_jog_oma, ""),
                                         makeDynAnytype(xd_jog_omr, ""), makeDynAnytype(xr_jog_vel, ""), makeDynAnytype(xr_ovr, ""));

      return (variable_unidad_dp);
    }
};
