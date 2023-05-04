//-----------------CLASES ESENCIALES----------------------
class lib_siwarex_500 // CLASE PARA MODELO SW 521/522
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Estado
  private static string vacia = "s_IO_DATA.SCALE_STATUS.LIMIT_3_EMPTY";
  private static string distinto = "s_IO_DATA.SCALE_STATUS.STANDSTILL";
  private static string tara = "s_IO_DATA.SCALE_STATUS.TARED";
  private static string ptara = "s_IO_DATA.PRESET_TARE_VALUE";
  private static string error = "s_IO_DATA.SCALE_STATUS.CHANNEL_DISTURBED";
  private static string dzero = "s_IO_DATA.SCALE_STATUS.D_ZERO";
  private static string max_9e = "s_IO_DATA.SCALE_STATUS.MAX_9E";
  private static string wait_standstill = "s_IO_DATA.SCALE_STATUS.WAITING_FOR_STANDSTILL";
  private static string below_min_weight = "s_IO_DATA.SCALE_STATUS.BELOW_MIN_WEIGHT";
  private static string calibrated = "s_IO_DATA.SCALE_STATUS.CALIBRATION_CURVE_NOT_PLAUSIBLE";
  private static string service = "s_IO_DATA.SCALE_STATUS.SERVICE_MODE";
  private static string start_up = "s_IO_DATA.SCALE_STATUS.START_UP";
  private static string tara_actual_preset = "DR05.PRESET_TARE";
  private static string tara_actual_sem_aut = "DR05.SEMI_AUTOMATIC_TARE";
  private static string peso_cero_actual = "DR05.SEMI_AUTOMATIC_ZERO_WEIGHT";
  private static string peso_seg_cero_actual = "DR05.ZERO_TRACKING_WEIGHT";
  private static string peso_muerto_calculado = "DR05.DEAD_LOAD";
  private static string digitos_adc = "DR31.ADC_DIGITS_UNFILTERED";
  private static string digitos_adc_filtrados = "DR31.ADC_DIGITS_FILTERED";
  private static string sen_celula_carga = "DR31.LOAD_CELL_SIGNAL";
  private static string grueso_proc = "DR30.GROSS_PROCESS_WEIGHT_F1";
  private static string neto_proc = "DR30.GROSS_NET_PROCESS_WEIGHT_F1";
  private static string tara_proc = "DR30.TARE_PROCESS_WEIGHT";
  private static string gru_net_peso = "DR30.GROSS_NET_WEIGHT";
  private static string gru_net_peso_x10 = "DR30.GROSS_NET_WEIGHT_X10";
  private static string refresco_contador = "DR30.REFRESH_COUNTER";
  private static string horas_funcionamiento = "DR30.HOUR";
  private static string minutos_funcionamiento = "DR30.MINUTE";

  //Valor
  private static string valor = "DR34.ASCII_DISPLAY";

  //Codigos
  private static string cmd_code = "s_CMD2.i_CMD_CODE";
  private static string cmd_trigger = "s_CMD2.bo_CMD_TRIGGER";

  //Configuracion
  private static string nombre = "DR03.SCALE_NAME";
  private static string unidad = "DR03.WEIGHT_UNIT";
  private static string peso_grueso = "DR03.GROSS_INDICATOR";
  private static string resolucion = "DR03.RESOLUTION_D";
  private static string peso_minimo = "DR03.MIN_WEIGHT_D";
  private static string peso_maximo = "DR03.MAX_WEIGHT";
  private static string cero_aut = "DR03.AUTOMATIC_ZERO_TRACKING";
  private static string rango_cero_neg = "DR03.SEMI_AUTO_ZERO_LIMIT_NEGATIVE";
  private static string rango_cero_pos = "DR03.SEMI_AUTO_ZERO_LIMIT_POSITIVE";
  private static string rango_estabilidad = "DR03.STANDSTILL_RANGE_D";
  private static string tiempo_estabilidad = "DR03.STANDSTILL_TIME";
  private static string tiempo_ret_estabilidad = "DR03.MAX_WAITING_TIME_FOR_STANDSTILL";
  private static string tara_maxima = "DR03.MAXIMUM_TARE_WEIGHT";
  private static string frec_filtro_1 = "DR03.FREQUENCY_LOW_PASS_1";
  private static string orden_filtro_1 = "DR03.ORDER_NO_LOW_PASS_1";
  private static string tiempo_filtro_medio = "DR03.PERIOD_OF_AVERAGE_FILTER";
  private static string peso_calib_0 = "DR03.CALIBRATION_WEIGHT_0";
  private static string peso_calib_1 = "DR03.CALIBRATION_WEIGHT_1";
  private static string peso_calib_2 = "DR03.CALIBRATION_WEIGHT_2";

  //Configuracion
  private static string comm_1 = "DR14.PROCESS_VALUE_1_SELECTION";
  private static string comm_2 = "DR14.PROCESS_VALUE_2_SELECTION";

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
  public lib_siwarex_500(string instancia, string tipo){
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

  public string get_tara_maxima(){
    return this.instancia + "." + this.tara_maxima;
  }

  public string get_frec_filtro_1(){
    return this.instancia + "." + this.frec_filtro_1;
  }

  public string get_orden_filtro_1(){
    return this.instancia + "." + this.orden_filtro_1;
  }

  public string get_tiempo_filtro_medio(){
    return this.instancia + "." + this.tiempo_filtro_medio;
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
  public void set_tiempo_ret_estabilidad(int t_ret_estabilidad){
    dpSet(get_tiempo_ret_estabilidad(), t_ret_estabilidad);
  }

  //Mandar tara maxima
  public void set_tara_maxima(float t_max){
    dpSet(get_tara_maxima(), t_max);
  }

  //Mandar frecuencia filtro paso bajo 1
  public void set_frec_filtro_1(float f_filtro_1){
    dpSet(get_frec_filtro_1(), f_filtro_1);
  }

  //Mandar orden filtro paso bajo 1
  public void set_orden_filtro_1(uint o_filtro_1){
    dpSet(get_orden_filtro_1(), o_filtro_1);
  }

  //Mandar tiempo filtro medio
  public void set_tiempo_filtro_medio(uint t_filtro_medio){
    dpSet(get_tiempo_filtro_medio(), t_filtro_medio);
  }

  //Mandar peso calibracion 0
  public void set_peso_calib_0(float p_calib_0){
    dpSet(get_peso_calib_0(), p_calib_0);
  }

  //Mandar peso calibracion 1
  public void set_peso_calib_1(float p_calib_1){
    dpSet(get_peso_calib_1(), p_calib_1);
  }

  //Mandar peso calibracion 2
  public void set_peso_calib_2(float p_calib_2){
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

    variable_estado_address = makeDynAnytype(makeDynAnytype(nombre,FALSE),makeDynAnytype(vacia,FALSE),makeDynAnytype(distinto,FALSE),makeDynAnytype(tara,FALSE),
                                             makeDynAnytype(error,FALSE),makeDynAnytype(cmd_code,TRUE),makeDynAnytype(cmd_trigger,TRUE),makeDynAnytype(resolucion,FALSE),
                                             makeDynAnytype(peso_minimo,FALSE),makeDynAnytype(peso_maximo,FALSE),makeDynAnytype(cero_aut,FALSE),makeDynAnytype(rango_cero_neg,FALSE),
                                             makeDynAnytype(rango_cero_pos,FALSE),makeDynAnytype(rango_estabilidad,FALSE),makeDynAnytype(peso_grueso,FALSE),
                                             makeDynAnytype(tara_maxima,FALSE),makeDynAnytype(frec_filtro_1,FALSE),
                                             makeDynAnytype(orden_filtro_1,FALSE),makeDynAnytype(comm_1,FALSE),makeDynAnytype(comm_2,FALSE),makeDynAnytype(dzero,FALSE),makeDynAnytype(max_9e,FALSE),makeDynAnytype(wait_standstill,FALSE),
                                             makeDynAnytype(below_min_weight,FALSE),makeDynAnytype(calibrated,FALSE),makeDynAnytype(service,FALSE),makeDynAnytype(start_up,FALSE),
                                             makeDynAnytype(tara_actual_preset,FALSE),makeDynAnytype(tara_actual_sem_aut,FALSE),makeDynAnytype(peso_cero_actual,FALSE),
                                             makeDynAnytype(peso_seg_cero_actual,FALSE),makeDynAnytype(peso_muerto_calculado,FALSE),makeDynAnytype(digitos_adc,FALSE),makeDynAnytype(digitos_adc_filtrados,FALSE),
                                             makeDynAnytype(sen_celula_carga,FALSE),makeDynAnytype(tiempo_estabilidad,FALSE),makeDynAnytype(tiempo_ret_estabilidad,FALSE),makeDynAnytype(grueso_proc,FALSE),
                                             makeDynAnytype(neto_proc,FALSE),makeDynAnytype(tara_proc,FALSE),makeDynAnytype(gru_net_peso,FALSE),makeDynAnytype(gru_net_peso_x10,FALSE),
                                             makeDynAnytype(refresco_contador,FALSE),makeDynAnytype(horas_funcionamiento,FALSE),makeDynAnytype(minutos_funcionamiento,FALSE),makeDynAnytype(valor,TRUE),
                                             makeDynAnytype(peso_calib_0,FALSE),makeDynAnytype(peso_calib_1,FALSE),makeDynAnytype(peso_calib_2,FALSE),makeDynAnytype(ptara,FALSE),makeDynAnytype(unidad,FALSE),makeDynAnytype(tiempo_filtro_medio,FALSE));

//         variable_estado_address = makeDynAnytype(makeDynAnytype(nombre,TRUE),makeDynAnytype(vacia,TRUE),makeDynAnytype(distinto,TRUE),makeDynAnytype(tara,TRUE),
//                                                  makeDynAnytype(error,TRUE),makeDynAnytype(cmd_code,TRUE),makeDynAnytype(cmd_trigger,TRUE),makeDynAnytype(resolucion,TRUE),
//                                                  makeDynAnytype(peso_minimo,TRUE),makeDynAnytype(peso_maximo,TRUE),makeDynAnytype(cero_aut,TRUE),makeDynAnytype(rango_cero_neg,TRUE),
//                                                  makeDynAnytype(rango_cero_pos,TRUE),makeDynAnytype(rango_estabilidad,TRUE),makeDynAnytype(peso_grueso,TRUE),
//                                                  makeDynAnytype(tara_maxima,TRUE),makeDynAnytype(frec_filtro_1,TRUE),
//                                                  makeDynAnytype(orden_filtro_1,TRUE),makeDynAnytype(comm_1,TRUE),makeDynAnytype(comm_2,TRUE),makeDynAnytype(dzero,TRUE),makeDynAnytype(max_9e,TRUE),makeDynAnytype(wait_standstill,TRUE),
//                                                  makeDynAnytype(below_min_weight,TRUE),makeDynAnytype(calibrated,TRUE),makeDynAnytype(service,TRUE),makeDynAnytype(start_up,TRUE),
//                                                  makeDynAnytype(tara_actual_preset,TRUE),makeDynAnytype(tara_actual_sem_aut,TRUE),makeDynAnytype(peso_cero_actual,TRUE),
//                                                  makeDynAnytype(peso_seg_cero_actual,TRUE),makeDynAnytype(peso_muerto_calculado,TRUE),makeDynAnytype(digitos_adc,TRUE),makeDynAnytype(digitos_adc_filtrados,TRUE),
//                                                  makeDynAnytype(sen_celula_carga,TRUE),makeDynAnytype(tiempo_estabilidad,TRUE),makeDynAnytype(tiempo_ret_estabilidad,TRUE),makeDynAnytype(grueso_proc,TRUE),
//                                                  makeDynAnytype(neto_proc,TRUE),makeDynAnytype(tara_proc,TRUE),makeDynAnytype(gru_net_peso,TRUE),makeDynAnytype(gru_net_peso_x10,TRUE),
//                                                  makeDynAnytype(refresco_contador,TRUE),makeDynAnytype(horas_funcionamiento,TRUE),makeDynAnytype(minutos_funcionamiento,TRUE),makeDynAnytype(valor,TRUE),
//                                                  makeDynAnytype(peso_calib_0,TRUE),makeDynAnytype(peso_calib_1,TRUE),makeDynAnytype(peso_calib_2,TRUE),makeDynAnytype(ptara,TRUE),makeDynAnytype(unidad,TRUE),makeDynAnytype(tiempo_filtro_medio,TRUE));
     return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(nombre,""),makeDynAnytype(vacia,""),makeDynAnytype(distinto,""),makeDynAnytype(tara,""),
                                        makeDynAnytype(error,""),makeDynAnytype(cmd_code,""),makeDynAnytype(cmd_trigger,""),makeDynAnytype(resolucion,""),
                                        makeDynAnytype(peso_minimo,""),makeDynAnytype(peso_maximo,""),makeDynAnytype(cero_aut,""),makeDynAnytype(rango_cero_neg,""),
                                        makeDynAnytype(rango_cero_pos,""),makeDynAnytype(rango_estabilidad,""),makeDynAnytype(peso_grueso,""),
                                        makeDynAnytype(tara_maxima,""),makeDynAnytype(frec_filtro_1,""),
                                        makeDynAnytype(orden_filtro_1,""),makeDynAnytype(comm_1,""),makeDynAnytype(comm_2,""),makeDynAnytype(dzero,""),makeDynAnytype(max_9e,""),makeDynAnytype(wait_standstill,""),
                                        makeDynAnytype(below_min_weight,""),makeDynAnytype(calibrated,""),makeDynAnytype(service,""),makeDynAnytype(start_up,""),
                                        makeDynAnytype(tara_actual_preset,""),makeDynAnytype(tara_actual_sem_aut,""),makeDynAnytype(peso_cero_actual,""),
                                        makeDynAnytype(peso_seg_cero_actual,""),makeDynAnytype(peso_muerto_calculado,""),makeDynAnytype(digitos_adc,""),makeDynAnytype(digitos_adc_filtrados,""),
                                        makeDynAnytype(sen_celula_carga,""),makeDynAnytype(tiempo_estabilidad,""),makeDynAnytype(tiempo_ret_estabilidad,""),makeDynAnytype(grueso_proc,""),
                                        makeDynAnytype(neto_proc,""),makeDynAnytype(tara_proc,""),makeDynAnytype(gru_net_peso,""),makeDynAnytype(gru_net_peso_x10,""),
                                        makeDynAnytype(refresco_contador,""),makeDynAnytype(horas_funcionamiento,""),makeDynAnytype(minutos_funcionamiento,""),makeDynAnytype(valor,""),
                                        makeDynAnytype(peso_calib_0,""),makeDynAnytype(peso_calib_1,""),makeDynAnytype(peso_calib_2,""),makeDynAnytype(ptara,""),makeDynAnytype(unidad,""),makeDynAnytype(tiempo_filtro_medio,""));

     return (variable_unidad_dp);
  }
};
