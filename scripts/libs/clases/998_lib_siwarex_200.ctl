//-----------------CLASES ESENCIALES----------------------
class lib_siwarex_200
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Estado
  private static string vacia = "s_IO_DATA.SCALE_STATUS.EMPTY";
  private static string distinto = "s_IO_DATA.SCALE_STATUS.STANDSTILL";
  private static string tara = "s_IO_DATA.SCALE_STATUS.TARA";
  private static string ptara = "s_IO_DATA.SCALE_STATUS.PRESET_TARA";
  private static string error = "s_IO_DATA.SCALE_STATUS.ERROR";
  private static string dzero = "s_IO_DATA.SCALE_STATUS.D_ZERO";
  private static string max_9e = "s_IO_DATA.SCALE_STATUS.MAX_9E";
  private static string wait_standstill = "s_IO_DATA.SCALE_STATUS.WAITING_FOR_STANDSTILL";
  private static string below_min_weight = "s_IO_DATA.SCALE_STATUS.BELOW_MIN_WEIGHT";
  private static string calibrated = "s_IO_DATA.SCALE_STATUS.CALIBRATED";
  private static string service = "s_IO_DATA.SCALE_STATUS.SERVICE_MODE";
  private static string start_up = "s_IO_DATA.SCALE_STATUS.START_UP";
  private static string CPU_error = "s_IO_DATA.SCALE_STATUS.SIMATIC_ERROR";
  private static string tara_actual_preset = "DR05.TARE_WEIGHT_PRESET";
  private static string tara_actual_sem_aut = "DR05.TARE_WEIGHT_SEM_AUT";
  private static string peso_cero_actual = "DR05.ZEROING_WEIGHT_SEM_AUT";
  private static string peso_seg_cero_actual = "DR05.ZEROING_WEIGHT_TRACKING";
  private static string peso_muerto_calculado = "DR05.DEAD_LOAD";
  private static string digitos_adc = "DR31.DIGITS_UNFILTERED";
  private static string digitos_adc_filtrados = "DR31.DIGITS_FILTERED";
  private static string sen_celula_carga = "DR31.CURRENT_INPUT_MV";
  private static string grueso_proc = "DR30.GROSS_PROCESS";
  private static string neto_proc = "DR30.NET_PROCESS";
  private static string tara_proc = "DR30.TARE_PROCESS";
  private static string gru_net_peso = "DR30.GROSS_NET_WEIGHT";
  private static string gru_net_peso_x10 = "DR30.GROSS_NET_WEIGHT_X10";
  private static string refresco_contador = "DR30.REFRESH_COUNTER";
  private static string horas_funcionamiento = "DR30.OPERATING_HOURS";
  private static string minutos_funcionamiento = "DR30.OPERATING_MINUTES";

  //Valor
  private static string valor = "DR34.ASCII_DISPLAY";

  //Codigos
  private static string cmd_code = "s_CMD2.i_CMD_CODE";
  private static string cmd_trigger = "s_CMD2.bo_CMD_TRIGGER";

  //Configuracion
  private static string nombre = "DR03.SCALE_NAME";
  private static string unidad = "DR03.WEIGHT_UNIT";
  private static string peso_grueso = "DR03.LETTER_GROSS_WEIGHT_2";
  private static string resolucion = "DR03.RESOLUTION_D";
  private static string peso_minimo = "DR03.MIN_WEIGHT_D";
  private static string peso_maximo = "DR03.MAX_WEIGHT";
  private static string cero_aut = "DR03.ZERO_TRACKING";
  private static string rango_cero_neg = "DR03.SEM_AUT_ZERO_LIM_NEG";
  private static string rango_cero_pos = "DR03.SEM_AUT_ZERO_LIM_POS";
  private static string rango_estabilidad = "DR03.STAND_STILL_RANGE_D";
  private static string tiempo_estabilidad = "DR03.STAND_STILL_TIME";
  private static string tiempo_ret_estabilidad = "DR03.STAND_STILL_WAITING_TIME";
  private static string redondeo = "DR03.DEC_POINT_PROC_VAL";
  private static string tara_maxima = "DR03.MAX_TARE";
  private static string frec_filtro_1 = "DR03.FREQ_LOW_PASS_1";
  private static string frec_filtro_2 = "DR03.FREQ_LOW_PASS_2";
  private static string orden_filtro_1 = "DR03.ORDINAL_NO_LOW_PASS_1";
  private static string orden_filtro_2 = "DR03.ORDINAL_NO_LOW_PASS_2";
  private static string tiempo_filtro_medio = "DR03.AVER_FILTER_DEPTH";
  private static string frec_muestreo = "DR10.PLF_FILTER";
  private static string peso_calib_0 = "DR03.CALIB_WEIGHT_0";
  private static string peso_calib_1 = "DR03.CALIB_WEIGHT_1";
  private static string peso_calib_2 = "DR03.CALIB_WEIGHT_2";

  //Configuracion
  private static string comm_1 = "DR14.SEL_PROC_VAL_1_SIMATIC";
  private static string comm_2 = "DR14.SEL_PROC_VAL_2_SIMATIC";

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

  //CONSTRUCTOR
  public lib_siwarex_200(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  //--FORMACIÓN DE CADENAS CON LOS NOMBRES DE LOS DP--
  public string get_nombre(){
    return this.instancia + "." + this.nombre;
  }

  public string get_vacia(){
    return this.instancia + "." + this.vacia;
  }

  public string get_distinto(){
    return this.instancia + "." + this.distinto;
  }

  public string get_tara(){
    return this.instancia + "." + this.tara;
  }

  public string get_ptara(){
    return this.instancia + "." + this.ptara;
  }

  public string get_error(){
    return this.instancia + "." + this.error;
  }

  public string get_dzero(){
    return this.instancia + "." + this.dzero;
  }

  public string get_max_9e(){
    return this.instancia + "." + this.max_9e;
  }

  public string get_wait_standstill(){
    return this.instancia + "." + this.wait_standstill;
  }

  public string get_below_min_weight(){
    return this.instancia + "." + this.below_min_weight;
  }

  public string get_calibrated(){
    return this.instancia + "." + this.calibrated;
  }

  public string get_service(){
    return this.instancia + "." + this.service;
  }

  public string get_start_up(){
    return this.instancia + "." + this.start_up;
  }

  public string get_CPU_error(){
    return this.instancia + "." + this.CPU_error;
  }

  public string get_tara_actual_preset(){
    return this.instancia + "." + this.tara_actual_preset;
  }

  public string get_tara_actual_sem_aut(){
    return this.instancia + "." + this.tara_actual_sem_aut;
  }

  public string get_peso_cero_actual(){
    return this.instancia + "." + this.peso_cero_actual;
  }

  public string get_peso_seg_cero_actual(){
    return this.instancia + "." + this.peso_seg_cero_actual;
  }

  public string get_peso_muerto_calculado(){
    return this.instancia + "." + this.peso_muerto_calculado;
  }

  public string get_digitos_adc(){
    return this.instancia + "." + this.digitos_adc;
  }

  public string get_digitos_adc_filtrados(){
    return this.instancia + "." + this.digitos_adc_filtrados;
  }

  public string get_sen_celula_carga(){
    return this.instancia + "." + this.sen_celula_carga;
  }

  public string get_grueso_proc(){
    return this.instancia + "." + this.grueso_proc;
  }

  public string get_neto_proc(){
    return this.instancia + "." + this.neto_proc;
  }

  public string get_tara_proc(){
    return this.instancia + "." + this.tara_proc;
  }

  public string get_gru_net_peso(){
    return this.instancia + "." + this.gru_net_peso;
  }

  public string get_gru_net_peso_x10(){
    return this.instancia + "." + this.gru_net_peso_x10;
  }

  public string get_refresco_contador(){
    return this.instancia + "." + this.refresco_contador;
  }

  public string get_horas_funcionamiento(){
    return this.instancia + "." + this.horas_funcionamiento;
  }

  public string get_minutos_funcionamiento(){
    return this.instancia + "." + this.minutos_funcionamiento;
  }

  public string get_valor(){
    return this.instancia + "." + this.valor;
  }

  public string get_cmd_code(){
    return this.instancia + "." + this.cmd_code;
  }

  public string get_cmd_trigger(){
    return this.instancia + "." + this.cmd_trigger;
  }

  public string get_unidad(){
    return this.instancia + "." + this.unidad;
  }

  public string get_peso_grueso(){
    return this.instancia + "." + this.peso_grueso;
  }

  public string get_resolucion(){
    return this.instancia + "." + this.resolucion;
  }

  public string get_peso_minimo(){
    return this.instancia + "." + this.peso_minimo;
  }

  public string get_peso_maximo(){
    return this.instancia + "." + this.peso_maximo;
  }

  public string get_cero_aut(){
    return this.instancia + "." + this.cero_aut;
  }

  public string get_rango_cero_neg(){
    return this.instancia + "." + this.rango_cero_neg;
  }

  public string get_rango_cero_pos(){
    return this.instancia + "." + this.rango_cero_pos;
  }

  public string get_rango_estabilidad(){
    return this.instancia + "." + this.rango_estabilidad;
  }

  public string get_tiempo_estabilidad(){
    return this.instancia + "." + this.tiempo_estabilidad;
  }

  public string get_tiempo_ret_estabilidad(){
    return this.instancia + "." + this.tiempo_ret_estabilidad;
  }

  public string get_redondeo(){
    return this.instancia + "." + this.redondeo;
  }

  public string get_tara_maxima(){
    return this.instancia + "." + this.tara_maxima;
  }

  public string get_frec_filtro_1(){
    return this.instancia + "." + this.frec_filtro_1;
  }

  public string get_frec_filtro_2(){
    return this.instancia + "." + this.frec_filtro_2;
  }

  public string get_orden_filtro_1(){
    return this.instancia + "." + this.orden_filtro_1;
  }

  public string get_orden_filtro_2(){
    return this.instancia + "." + this.orden_filtro_2;
  }

  public string get_tiempo_filtro_medio(){
    return this.instancia + "." + this.tiempo_filtro_medio;
  }

  public string get_frec_muestreo(){
    return this.instancia + "." + this.frec_muestreo;
  }

  public string get_peso_calib_0(){
    return this.instancia + "." + this.peso_calib_0;
  }

  public string get_peso_calib_1(){
    return this.instancia + "." + this.peso_calib_1;
  }

  public string get_peso_calib_2(){
    return this.instancia + "." + this.peso_calib_2;
  }

  public string get_comm_1(){
    return this.instancia + "." + this.comm_1;
  }

  public string get_comm_2(){
    return this.instancia + "." + this.comm_2;
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

  //--Acciones sobre la celula de pesaje--
  //Mandar comandos
  public void set_comandos(int codigo, int trigger){
    dpSet(get_cmd_code(), codigo,
          get_cmd_trigger(), trigger);
  }

  //Mandar nombre
  public void set_nombre(string name){
    dpSet(get_nombre(), name);
  }

  //Mandar unidad
  public void set_unidad(string uni){
    dpSet(get_unidad(), uni);

  }

  //Mandar peso grueso
  public void set_peso_grueso(uint p_gru){
    dpSet(get_peso_grueso(), p_gru);
  }

  //Mandar resolucion
  public void set_resolucion(float res){
    dpSet(get_resolucion(), res);
  }

  //Mandar peso minimo
  public void set_peso_minimo(uint p_min){
    dpSet(get_peso_minimo(), p_min);
  }

  //Mandar peso maximo
  public void set_peso_maximo(float p_max){
    dpSet(get_peso_maximo(), p_max);
  }

  //Mandar cero automatico
  public void set_cero_aut(bool cero_auto){
    dpSet(get_cero_aut(), cero_auto);
  }

  //Mandar rango cero negativo
  public void set_rango_cero_neg(float r_cero_neg){
    dpSet(get_rango_cero_neg(), r_cero_neg);
  }

  //Mandar rango cero positivo
  public void set_rango_cero_pos(float r_cero_pos){
    dpSet(get_rango_cero_pos(), r_cero_pos);
  }

  //Mandar rango estabilidad
  public void set_rango_estabilidad(float r_estabilidad){
    dpSet(get_rango_estabilidad(), r_estabilidad);
  }

  //Mandar tiempo estabilidad
  public void set_tiempo_estabilidad(int t_estabilidad){
    dpSet(get_tiempo_estabilidad(), t_estabilidad);
  }

  //Mandar tiempo retardo estabilidad
  public void set_tiempo_rte_estabilidad(int t_ret_estabilidad){
    dpSet(get_tiempo_ret_estabilidad(), t_ret_estabilidad);
  }

  //Mandar redondeo
  public void set_redondeo(uint red){
    dpSet(get_redondeo(), red);
  }

  //Mandar tara maxima
  public void set_tara_maxima(float t_max){
    dpSet(get_tara_maxima(), t_max);
  }

  //Mandar frecuencia filtro paso bajo 1
  public void set_frec_filtro_1(float f_filtro_1){
    dpSet(get_frec_filtro_1(), f_filtro_1);
  }

  //Mandar frecuencia filtro paso bajo 2
  public void set_frec_filtro_2(float f_filtro_2){
    dpSet(get_frec_filtro_2(), f_filtro_2);
  }

  //Mandar orden filtro paso bajo 1
  public void set_orden_filtro_1(uint o_filtro_1){
    dpSet(get_orden_filtro_1(), o_filtro_1);
  }

  //Mandar orden filtro paso bajo 2
  public void set_orden_filtro_2(uint o_filtro_2){
    dpSet(get_orden_filtro_2(), o_filtro_2);
  }

  //Mandar tiempo filtro medio
  public void set_tiempo_filtro_medio(uint t_filtro_medio){
    dpSet(get_tiempo_filtro_medio(), t_filtro_medio);
  }

  //Mandar frecuencia de muestreo
  public void set_frec_muestreo(uint f_muestreo){
    dpSet(get_frec_muestreo(), f_muestreo);
  }

  //Mandar peso calibracion 0
  public void set_peso_calib_0(uint p_calib_0){
    dpSet(get_peso_calib_0(), p_calib_0);
  }

  //Mandar peso calibracion 1
  public void set_peso_calib_1(uint p_calib_1){
    dpSet(get_peso_calib_1(), p_calib_1);
  }

  //Mandar peso calibracion 2
  public void set_peso_calib_2(uint p_calib_2){
    dpSet(get_peso_calib_2(), p_calib_2);
  }

  //Mandar parametro de comunicacion 1
  public void set_comm_1(uint commu_1){
    dpSet(get_comm_1(), commu_1);
  }

  //Mandar parametro de comunicacion 2
  public void set_comm_2(uint commu_2){
    dpSet(get_comm_2(), commu_2);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(nombre,FALSE),makeDynAnytype(vacia,FALSE),makeDynAnytype(distinto,FALSE),makeDynAnytype(tara,FALSE),makeDynAnytype(ptara,FALSE),
                                             makeDynAnytype(error,FALSE),makeDynAnytype(cmd_code,TRUE),makeDynAnytype(cmd_trigger,TRUE),makeDynAnytype(resolucion,FALSE),
                                             makeDynAnytype(peso_minimo,FALSE),makeDynAnytype(peso_maximo,FALSE),makeDynAnytype(cero_aut,FALSE),makeDynAnytype(rango_cero_neg,FALSE),
                                             makeDynAnytype(rango_cero_pos,FALSE),makeDynAnytype(rango_estabilidad,FALSE),makeDynAnytype(unidad,FALSE),makeDynAnytype(peso_grueso,FALSE),
                                             makeDynAnytype(redondeo,FALSE),makeDynAnytype(tara_maxima,FALSE),makeDynAnytype(frec_filtro_1,FALSE),makeDynAnytype(frec_filtro_2,FALSE),
                                             makeDynAnytype(orden_filtro_1,FALSE),makeDynAnytype(orden_filtro_2,FALSE),makeDynAnytype(tiempo_filtro_medio,FALSE),makeDynAnytype(frec_muestreo,FALSE),
                                             makeDynAnytype(comm_1,FALSE),makeDynAnytype(comm_2,FALSE),makeDynAnytype(dzero,FALSE),makeDynAnytype(max_9e,FALSE),makeDynAnytype(wait_standstill,FALSE),
                                             makeDynAnytype(below_min_weight,FALSE),makeDynAnytype(calibrated,FALSE),makeDynAnytype(service,FALSE),makeDynAnytype(start_up,FALSE),
                                             makeDynAnytype(CPU_error,FALSE),makeDynAnytype(tara_actual_preset,FALSE),makeDynAnytype(tara_actual_sem_aut,FALSE),makeDynAnytype(peso_cero_actual,FALSE),
                                             makeDynAnytype(peso_seg_cero_actual,FALSE),makeDynAnytype(peso_muerto_calculado,FALSE),makeDynAnytype(digitos_adc,FALSE),makeDynAnytype(digitos_adc_filtrados,FALSE),
                                             makeDynAnytype(sen_celula_carga,FALSE),makeDynAnytype(tiempo_estabilidad,FALSE),makeDynAnytype(tiempo_ret_estabilidad,FALSE),makeDynAnytype(grueso_proc,FALSE),
                                             makeDynAnytype(neto_proc,FALSE),makeDynAnytype(tara_proc,FALSE),makeDynAnytype(gru_net_peso,FALSE),makeDynAnytype(gru_net_peso_x10,FALSE),
                                             makeDynAnytype(refresco_contador,FALSE),makeDynAnytype(horas_funcionamiento,FALSE),makeDynAnytype(minutos_funcionamiento,FALSE),makeDynAnytype(valor,TRUE),
                                             makeDynAnytype(peso_calib_0,FALSE),makeDynAnytype(peso_calib_1,FALSE),makeDynAnytype(peso_calib_2,FALSE));

//         variable_estado_address = makeDynAnytype(makeDynAnytype(nombre,FALSE),makeDynAnytype(vacia,FALSE),makeDynAnytype(distinto,FALSE),makeDynAnytype(tara,FALSE),makeDynAnytype(ptara,FALSE),
//                                                  makeDynAnytype(error,FALSE),makeDynAnytype(cmd_code,FALSE),makeDynAnytype(cmd_trigger,FALSE),makeDynAnytype(resolucion,FALSE),
//                                                  makeDynAnytype(peso_minimo,FALSE),makeDynAnytype(peso_maximo,FALSE),makeDynAnytype(cero_aut,FALSE),makeDynAnytype(rango_cero_neg,FALSE),
//                                                  makeDynAnytype(rango_cero_pos,FALSE),makeDynAnytype(rango_estabilidad,FALSE),makeDynAnytype(unidad,FALSE),makeDynAnytype(peso_grueso,FALSE),
//                                                  makeDynAnytype(redondeo,FALSE),makeDynAnytype(tara_maxima,FALSE),makeDynAnytype(frec_filtro_1,FALSE),makeDynAnytype(frec_filtro_2,FALSE),
//                                                  makeDynAnytype(orden_filtro_1,FALSE),makeDynAnytype(orden_filtro_2,FALSE),makeDynAnytype(tiempo_filtro_medio,FALSE),makeDynAnytype(frec_muestreo,FALSE),
//                                                  makeDynAnytype(comm_1,FALSE),makeDynAnytype(comm_2,FALSE),makeDynAnytype(dzero,FALSE),makeDynAnytype(max_9e,FALSE),makeDynAnytype(wait_standstill,FALSE),
//                                                  makeDynAnytype(below_min_weight,FALSE),makeDynAnytype(calibrated,FALSE),makeDynAnytype(service,FALSE),makeDynAnytype(start_up,FALSE),
//                                                  makeDynAnytype(CPU_error,FALSE),makeDynAnytype(tara_actual_preset,FALSE),makeDynAnytype(tara_actual_sem_aut,FALSE),makeDynAnytype(peso_cero_actual,FALSE),
//                                                  makeDynAnytype(peso_seg_cero_actual,FALSE),makeDynAnytype(peso_muerto_calculado,FALSE),makeDynAnytype(digitos_adc,FALSE),makeDynAnytype(digitos_adc_filtrados,FALSE),
//                                                  makeDynAnytype(sen_celula_carga,FALSE),makeDynAnytype(tiempo_estabilidad,FALSE),makeDynAnytype(tiempo_ret_estabilidad,FALSE),makeDynAnytype(grueso_proc,FALSE),
//                                                  makeDynAnytype(neto_proc,FALSE),makeDynAnytype(tara_proc,FALSE),makeDynAnytype(gru_net_peso,FALSE),makeDynAnytype(gru_net_peso_x10,FALSE),
//                                                  makeDynAnytype(refresco_contador,FALSE),makeDynAnytype(horas_funcionamiento,FALSE),makeDynAnytype(minutos_funcionamiento,FALSE),makeDynAnytype(valor,FALSE),
//                                                  makeDynAnytype(peso_calib_0,FALSE),makeDynAnytype(peso_calib_1,FALSE),makeDynAnytype(peso_calib_2,FALSE));
    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(vacia,""),makeDynAnytype(distinto,""),makeDynAnytype(tara,""),makeDynAnytype(ptara,""),
                                        makeDynAnytype(error,""),makeDynAnytype(dzero,""),makeDynAnytype(max_9e,""),makeDynAnytype(wait_standstill,""),
                                        makeDynAnytype(below_min_weight,""),makeDynAnytype(calibrated,""),makeDynAnytype(service,""),makeDynAnytype(start_up,""),
                                        makeDynAnytype(CPU_error,""),makeDynAnytype(tara_actual_preset,""),makeDynAnytype(tara_actual_sem_aut,""),makeDynAnytype(peso_cero_actual,""),
                                        makeDynAnytype(peso_seg_cero_actual,""),makeDynAnytype(peso_muerto_calculado,""),makeDynAnytype(digitos_adc,""),makeDynAnytype(digitos_adc_filtrados,""),
                                        makeDynAnytype(sen_celula_carga,""),makeDynAnytype(grueso_proc,""),makeDynAnytype(neto_proc,""),makeDynAnytype(tara_proc,""),
                                        makeDynAnytype(gru_net_peso,""),makeDynAnytype(gru_net_peso_x10,""),makeDynAnytype(refresco_contador,""),makeDynAnytype(horas_funcionamiento,""),
                                        makeDynAnytype(minutos_funcionamiento,""),makeDynAnytype(valor,""),makeDynAnytype(cmd_code,""),makeDynAnytype(cmd_trigger,""),
                                        makeDynAnytype(nombre,""),makeDynAnytype(unidad,""),makeDynAnytype(peso_grueso,""),makeDynAnytype(resolucion,""),
                                        makeDynAnytype(peso_minimo,""),makeDynAnytype(peso_maximo,""),makeDynAnytype(cero_aut,""),makeDynAnytype(rango_cero_neg,""),
                                        makeDynAnytype(rango_cero_pos,""),makeDynAnytype(rango_estabilidad,""),makeDynAnytype(tiempo_estabilidad,""),makeDynAnytype(tiempo_ret_estabilidad,""),
                                        makeDynAnytype(redondeo,""),makeDynAnytype(tara_maxima,""),makeDynAnytype(frec_filtro_1,""),makeDynAnytype(frec_filtro_2,""),
                                        makeDynAnytype(orden_filtro_1,""),makeDynAnytype(orden_filtro_2,""),makeDynAnytype(tiempo_filtro_medio,""),makeDynAnytype(frec_muestreo,""),
                                        makeDynAnytype(peso_calib_0,""),makeDynAnytype(peso_calib_1,""),makeDynAnytype(peso_calib_2,""),makeDynAnytype(comm_1,""),
                                        makeDynAnytype(comm_2,""));

     return (variable_unidad_dp);
  }
};
