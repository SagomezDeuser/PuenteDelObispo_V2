#uses "clases/531_lib_accionamiento_valvula_doble"

// Listado de variables const a utilizar  en el ctc
const dyn_string colores_estado = makeDynString("*gris*", "*rojo*", "*verde*");
const mapping estados_colores = makeMapping(0, "gris",
                                1, "gris",
                                3, "gris",
                                10, "gris",
                                11, "gris",
                                13, "gris",
                                20, "gris",
                                21, "gris",
                                22, "verde",
                                23, "verde",
                                255, "gris",
                                2, "verde",
                                4, "verde",
                                12, "verde",
                                14, "verde",
                                100, "rojo",
                                101, "rojo",
                                102, "rojo",
                                110, "rojo",
                                111, "rojo",
                                112, "rojo",
                                113, "rojo",
                                114, "rojo",
                                115, "rojo");
const mapping estados_colores_valvula = makeMapping(0, "gris",
                                        3, "gris",
                                        4, "gris",
                                        10, "gris",
                                        11, "gris",
                                        13, "gris",
                                        14, "gris",
                                        20, "gris",
                                        21, "gris",
                                        22, "verde",
                                        23, "verde",
                                        255, "gris",
                                        1, "verde",
                                        2, "verde",
                                        12, "verde",
                                        100, "rojo",
                                        101, "rojo",
                                        102, "rojo",
                                        110, "rojo",
                                        111, "rojo",
                                        112, "rojo",
                                        113, "rojo",
                                        114, "rojo",
                                        115, "rojo");

/***************************************************************************************
  @brief Función para recuperar un array con las variables de cada clase y el estado del
  address de las mismas.
  @return estados_address es un array de dos dimensiones con las variables y el estado.
****************************************************************************************/
dyn_anytype recuperarEstadoAddressClase(string dpt)
{
  dyn_anytype estadosAddress;

  switch (dpt)
  {
    case ("504_LIB_TRATAMIENTO_ANALOGICA"):   //Comprobamos si el DPT es del tipo TRATAMIENTO_ANALOGICA
    {
      lib_tratamiento_analogica analogica = lib_tratamiento_analogica("", "");  //Creamos una instancia de la clase lib_tratamiento_analogica
      estadosAddress = analogica.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_tratamiento_analogica
      break;
    }

    case ("505_LIB_FILTRO_DIGITAL"):   //Comprobamos si el DPT es del tipo FILTRO_DIGITAL
    {
      lib_filtro_digital filtro_digital = lib_filtro_digital("", "");  //Creamos una instancia de la clase lib_filtro_digital
      estadosAddress = filtro_digital.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_filtro_digital
      break;
    }

    case ("512_LIB_COMPONENTE_SIMPLE"):   //Comprobamos si el DPT es del tipo componente_simple
    {
      lib_componente_simple componente_simple = lib_componente_simple("", "");  //Creamos una instancia de la clase lib_componente_simple
      estadosAddress = componente_simple.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_componente_simple
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_D
    {
      lib_accionamiento_motor_d accionamiento_motor_d = lib_accionamiento_motor_d("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_d
      estadosAddress = accionamiento_motor_d.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_d
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_S
    {
      lib_accionamiento_motor_s accionamiento_motor_s = lib_accionamiento_motor_s("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_s
      estadosAddress = accionamiento_motor_s.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_s
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_D_VARIADOR
    {
      lib_accionamiento_motor_d_var accionamiento_motor_d_var = lib_accionamiento_motor_d_var("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_d_var
      estadosAddress = accionamiento_motor_d_var.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_d
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_S_VARIADOR
    {
      lib_accionamiento_motor_s_var accionamiento_motor_s_var = lib_accionamiento_motor_s_var("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_s_var
      estadosAddress = accionamiento_motor_s_var.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_s
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA
    {
      lib_accionamiento_valvula accionamiento_valvula = lib_accionamiento_valvula("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula
      estadosAddress = accionamiento_valvula.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_valvula
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_MOTOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA_MOTOR
    {
      lib_accionamiento_valvula_motor accionamiento_valvula_motor = lib_accionamiento_valvula_motor("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula_motor
      estadosAddress = accionamiento_valvula_motor.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_valvula_motor
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_DOBLE"):    //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA_DOBLE
    {
      lib_accionamiento_valvula_doble accionamiento_valvula_doble = lib_accionamiento_valvula_doble("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula_motor
      estadosAddress = accionamiento_valvula_doble.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_valvula_motor
      break;
    }

    case ("800_LIB_SERVO"):   //Comprobamos si el DPT es del tipo SERVO
    {
      lib_servo servo = lib_servo("", "");  //Creamos una instancia de la clase lib_servo
      estadosAddress = servo.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase lib_servo
      break;
    }

    case ("998_LIB_SIWAREX_200"):   //Comprobamos si el DPT es del tipo SIWAREX
    {
      lib_siwarex_200 celula = lib_siwarex_200("", "");  //Creamos una instancia de la clase celula
      estadosAddress = celula.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase celula
      break;
    }

    case ("999_LIB_SIWAREX_500"):   //Comprobamos si el DPT es del tipo SIWAREX
    {
      lib_siwarex_500 celula_500 = lib_siwarex_500("", "");  //Creamos una instancia de la clase celula_500
      estadosAddress = celula_500.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase celula_500
      break;
    }

    case ("010_LIB_PID"):   //Comprobamos si el DPT es del tipo PID
    {
      lib_pid pid = lib_pid("", "");  //Creamos una instancia de la clase PID
      estadosAddress = pid.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase PID
      break;
    }

    case ("090_LIB_ENERGY_METER"):   //Comprobamos si el DPT es del tipo ENERGY_METER
    {
      lib_energy_meter energy_meter = lib_energy_meter("", "");  //Creamos una instancia de la clase ENERGY_METER
      estadosAddress = energy_meter.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase ENERGY_METER
      break;
    }

    case ("550_LIB_VF_COMUNICACION"):   //Comprobamos si el DPT es del tipo ENERGY_METER
    {
      lib_comunicacion_vf com = lib_comunicacion_vf("", "");  //Creamos una instancia de la clase ENERGY_METER
      estadosAddress = com.rellenar_array_address();  //Recuperamos el array con el estado de las address de la clase ENERGY_METER
      break;
    }
  }

  return (estadosAddress);
}
/******* Fin de la función recuperarEstadoAddressClase() *********/

/***************************************************************************************
  @brief Función para recuperar un array con las variables de cada clase y las unidades
  de las mismas.
  @return unidades_clase es un array de dos dimensiones con las variables y sus unidades.
****************************************************************************************/
dyn_anytype recuperar_unidades_clase(string dpt)
{
  dyn_anytype unidades_clase;

  switch (dpt)
  {
    case ("504_LIB_TRATAMIENTO_ANALOGICA"):   //Comprobamos si el DPT es del tipo TRATAMIENTO_ANALOGICA
    {
      lib_tratamiento_analogica analogica = lib_tratamiento_analogica("", "");  //Creamos una instancia de la clase lib_tratamiento_analogica
      unidades_clase = analogica.rellenar_unidades_dp();  //Recuperamos el array con las unidades de la clase lib_tratamiento_analogica
      break;
    }

    case ("505_LIB_FILTRO_DIGITAL"):   //Comprobamos si el DPT es del tipo FILTRO_DIGITAL
    {
      lib_filtro_digital filtro_digital = lib_filtro_digital("", "");  //Creamos una instancia de la clase lib_filtro_digital
      unidades_clase = filtro_digital.rellenar_unidades_dp();  //Recuperamos el array con las unidades de la clase lib_filtro_digital
      break;
    }

    case ("512_LIB_COMPONENTE_SIMPLE"):   //Comprobamos si el DPT es del tipo componente_simple
    {
      lib_componente_simple componente_simple = lib_componente_simple("", "");  //Creamos una instancia de la clase lib_componente_simple
      unidades_clase = componente_simple.rellenar_unidades_dp();  //Recuperamos el array con las unidades de la clase lib_componente_simple
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_D
    {
      lib_accionamiento_motor_d accionamiento_motor_d = lib_accionamiento_motor_d("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_d
      unidades_clase = accionamiento_motor_d.rellenar_unidades_dp();  //Recuperamos el array con el estado de unidades de la clase lib_accionamiento_motor_d
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_S
    {
      lib_accionamiento_motor_s accionamiento_motor_s = lib_accionamiento_motor_s("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_s
      unidades_clase = accionamiento_motor_s.rellenar_unidades_dp();  //Recuperamos el array con el unidades de la clase lib_accionamiento_motor_s
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_D_VARIADOR
    {
      lib_accionamiento_motor_d_var accionamiento_motor_d_var = lib_accionamiento_motor_d_var("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_d_var
      unidades_clase = accionamiento_motor_d_var.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_d
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_MOTOR_S_VARIADOR
    {
      lib_accionamiento_motor_s_var accionamiento_motor_s_var = lib_accionamiento_motor_s_var("", "");  //Creamos una instancia de la clase lib_accionamiento_motor_s_var
      unidades_clase = accionamiento_motor_s_var.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_motor_s
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA
    {
      lib_accionamiento_valvula accionamiento_valvula = lib_accionamiento_valvula("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula
      unidades_clase = accionamiento_valvula.rellenar_unidades_dp();  //Recuperamos el array con unidades de la clase lib_accionamiento_valvula
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_MOTOR"):   //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA_MOTOR
    {
      lib_accionamiento_valvula_motor accionamiento_valvula_motor = lib_accionamiento_valvula_motor("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula_motor
      unidades_clase = accionamiento_valvula_motor.rellenar_unidades_dp();  //Recuperamos el array con el unidades de la clase lib_accionamiento_valvula_motor
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_DOBLE"):    //Comprobamos si el DPT es del tipo ACCIONAMIENTO_VALVULA_DOBLE
    {
      lib_accionamiento_valvula_doble accionamiento_valvula_doble = lib_accionamiento_valvula_doble("", "");  //Creamos una instancia de la clase lib_accionamiento_valvula_motor
      unidades_clase = accionamiento_valvula_doble.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase lib_accionamiento_valvula_motor
      break;
    }

    case ("800_LIB_SERVO"):   //Comprobamos si el DPT es del tipo SERVO
    {
      lib_servo servo = lib_servo("", "");  //Creamos una instancia de la clase lib_servo
      unidades_clase = servo.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase lib_servo
      break;
    }

    case ("998_LIB_SIWAREX_200"):   //Comprobamos si el DPT es del tipo SIWAREX
    {
      lib_siwarex_200 celula = lib_siwarex_200("", "");  //Creamos una instancia de la clase celula
      unidades_clase = celula.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase celula
      break;
    }

    case ("999_LIB_SIWAREX_500"):   //Comprobamos si el DPT es del tipo SIWAREX
    {
      lib_siwarex_500 celula = lib_siwarex_500("", "");  //Creamos una instancia de la clase celula_500
      unidades_clase = celula.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase celula_500
      break;
    }

    case ("010_LIB_PID"):   //Comprobamos si el DPT es del tipo PID
    {
      lib_pid pid = lib_pid("", "");  //Creamos una instancia de la clase PID
      unidades_clase = pid.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase PID
      break;
    }

    case ("090_LIB_ENERGY_METER"):   //Comprobamos si el DPT es del tipo ENERGY_METER
    {
      lib_energy_meter energy_meter = lib_energy_meter("", "");  //Creamos una instancia de la clase ENERGY_METER
      unidades_clase = energy_meter.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase ENERGY_METER
      break;
    }

    case ("550_LIB_VF_COMUNICACION"):   //Comprobamos si el DPT es del tipo ENERGY_METER
    {
      lib_comunicacion_vf com = lib_comunicacion_vf("", "");  //Creamos una instancia de la clase ENERGY_METER
      unidades_clase = com.rellenar_unidades_dp();  //Recuperamos el array con el estado de las address de la clase ENERGY_METER
      break;
    }
  }

  return (unidades_clase);
}
/******* Fin de la función recuperar_unidades_clase() *********/

/***************************************************************************************
  @brief Función para recuperar un array con las variables de cada clase y el estado del
  address de las mismas.
****************************************************************************************/
void cambiar_estado_clase(string inst, string tipo_inst, string nom_obj_graf)
{
  switch (tipo_inst)
  {

    case ("505_LIB_FILTRO_DIGITAL"):   //Comprobamos si es del tipo FILTRO_DIGITAL
    {
      lib_filtro_digital filtro_digital = lib_filtro_digital(inst, tipo_inst);  //Creamos una instancia de la clase lib_filtro_digital

      if (dpExists(filtro_digital.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, filtro_digital.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("512_LIB_COMPONENTE_SIMPLE"):   //Comprobamos si es del tipo componente_simple
    {
      lib_componente_simple componente_simple = lib_componente_simple(inst, tipo_inst);  //Creamos una instancia de la clase lib_componente simple

      if (dpExists(componente_simple.get_marcha()))  dpConnectUserData("cambiar_estado_com_simple", nom_obj_graf, componente_simple.get_marcha(), componente_simple.get_alm());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_D
    {
      lib_accionamiento_motor_d accionamiento_motor_d = lib_accionamiento_motor_d(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_d

      if (dpExists(accionamiento_motor_d.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, accionamiento_motor_d.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_S
    {
      lib_accionamiento_motor_s accionamiento_motor_s = lib_accionamiento_motor_s(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_s

      if (dpExists(accionamiento_motor_s.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, accionamiento_motor_s.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_D_VARIADOR
    {
      lib_accionamiento_motor_d_var accionamiento_motor_d_var = lib_accionamiento_motor_d_var(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_d_var

      if (dpExists(accionamiento_motor_d_var.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, accionamiento_motor_d_var.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_S_VARIADOR
    {
      lib_accionamiento_motor_s_var accionamiento_motor_s_var = lib_accionamiento_motor_s_var(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_s_var

      if (dpExists(accionamiento_motor_s_var.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, accionamiento_motor_s_var.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA
    {
      lib_accionamiento_valvula accionamiento_valvula = lib_accionamiento_valvula(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula

      if (dpExists(accionamiento_valvula.get_estado()))  dpConnectUserData("cambiar_estado_valvula", nom_obj_graf, accionamiento_valvula.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_MOTOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA_MOTOR
    {
      lib_accionamiento_valvula_motor accionamiento_valvula_motor = lib_accionamiento_valvula_motor(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula_motor

      if (dpExists(accionamiento_valvula_motor.get_estado()))  dpConnectUserData("cambiar_estado_valvula", nom_obj_graf, accionamiento_valvula_motor.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_DOBLE"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA_doble
    {
      lib_accionamiento_valvula_doble accionamiento_valvula_doble = lib_accionamiento_valvula_doble(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula_doble

      if (dpExists(accionamiento_valvula_doble.get_estado()))  dpConnectUserData("cambiar_estado_objeto", nom_obj_graf, accionamiento_valvula_doble.get_estado());
      else color_sombra_maquina_error(nom_obj_graf);

      break;
    }

    case ("550_LIB_VF_COMUNICACION"):   //Comprobamos si es del tipo VF_COMUNICACION
    {
      break;
    }
  }
}
/******* Fin de la función cambiar_estado_clase() *********/

/***************************************************************************************
  @brief Función para crear un mapa que almacena el estado del motor según su tipo de libreria
  @return Mapa con los estados.
****************************************************************************************/
mapping cambiar_estado_clase_gif(string inst, string tipo_inst, string nom_obj_graf)
{
  //Creamos un mapa para almacenar el estado del motor según su tipo de libreria
  mapping estados_motor = makeMapping("505_LIB_FILTRO_DIGITAL", "",
                                      "512_LIB_COMPONENTE_SIMPLE_MARCHA", "",
                                      "512_LIB_COMPONENTE_SIMPLE_ALARMA", "",
                                      "531_LIB_ACCIONAMIENTO_MOTOR_D", "",
                                      "531_LIB_ACCIONAMIENTO_MOTOR_S", "",
                                      "531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR", "",
                                      "531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR", "",
                                      "531_LIB_ACCIONAMIENTO_VALVULA", "",
                                      "531_LIB_ACCIONAMIENTO_VALVULA_MOTOR", "",
                                      "531_LIB_ACCIONAMIENTO_VALVULA_DOBLE", "");

  switch (tipo_inst)
  {
    case ("505_LIB_FILTRO_DIGITAL"):   //Comprobamos si es del tipo FILTRO_DIGITAL
    {
      lib_filtro_digital filtro_digital = lib_filtro_digital(inst, tipo_inst);  //Creamos una instancia de la clase lib_filtro_digital
      estados_motor["505_LIB_FILTRO_DIGITAL"] = filtro_digital.get_estado();
      break;
    }

    case ("512_LIB_COMPONENTE_SIMPLE"):   //Comprobamos si es del tipo componente_simple
    {
      lib_componente_simple componente_simple = lib_componente_simple(inst, tipo_inst);  //Creamos una instancia de la clase lib_componente simple
      estados_motor["512_LIB_COMPONENTE_SIMPLE_MARCHA"] = componente_simple.get_marcha();
      estados_motor["512_LIB_COMPONENTE_SIMPLE_ALARMA"] = componente_simple.get_alm();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_D
    {
      lib_accionamiento_motor_d accionamiento_motor_d = lib_accionamiento_motor_d(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_d
      estados_motor["531_LIB_ACCIONAMIENTO_MOTOR_D"] = accionamiento_motor_d.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_S
    {
      lib_accionamiento_motor_s accionamiento_motor_s = lib_accionamiento_motor_s(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_s
      estados_motor["531_LIB_ACCIONAMIENTO_MOTOR_S"] = accionamiento_motor_s.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_D_VARIADOR
    {
      lib_accionamiento_motor_d_var accionamiento_motor_d_var = lib_accionamiento_motor_d_var(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_d_var
      estados_motor["531_LIB_ACCIONAMIENTO_MOTOR_D_VARIADOR"] = accionamiento_motor_d_var.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_MOTOR_S_VARIADOR
    {
      lib_accionamiento_motor_s_var accionamiento_motor_s_var = lib_accionamiento_motor_s_var(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_motor_s_var
      estados_motor["531_LIB_ACCIONAMIENTO_MOTOR_S_VARIADOR"] = accionamiento_motor_s_var.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA
    {
      lib_accionamiento_valvula accionamiento_valvula = lib_accionamiento_valvula(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula
      estados_motor["531_LIB_ACCIONAMIENTO_VALVULA"] = accionamiento_valvula.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_MOTOR"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA_MOTOR
    {
      lib_accionamiento_valvula_motor accionamiento_valvula_motor = lib_accionamiento_valvula_motor(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula_motor
      estados_motor["531_LIB_ACCIONAMIENTO_VALVULA_MOTOR"] = accionamiento_valvula_motor.get_estado();
      break;
    }

    case ("531_LIB_ACCIONAMIENTO_VALVULA_DOBLE"):   //Comprobamos si es del tipo ACCIONAMIENTO_VALVULA_doble
    {
      lib_accionamiento_valvula_doble accionamiento_valvula_doble = lib_accionamiento_valvula_doble(inst, tipo_inst);  //Creamos una instancia de la clase lib_accionamiento_valvula_doble
      estados_motor["531_LIB_ACCIONAMIENTO_VALVULA_DOBLE"] = accionamiento_valvula_doble.get_estado();
      break;
    }

    case ("550_LIB_VF_COMUNICACION"):   //Comprobamos si es del tipo VF_COMUNICACION
    {
      break;
    }
  }

  return (estados_motor);
}
/******* Fin de la función cambiar_estado_clase_gif() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de un objeto.
****************************************************************************************/
void cambiar_estado_objeto(string nom_obj_graf, string dp1, int estado)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;

  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto
  color_estado_nuevo = get_color_estado_nuevo(estado);  //Recuperamos el nuevo color de estado del objeto

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_objeto() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de una valvula (mapping distinto).
****************************************************************************************/
void cambiar_estado_valvula(string nom_obj_graf, string dp1, int estado)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;

  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto
  color_estado_nuevo = get_color_estado_nuevo_valvula(estado);  //Recuperamos el nuevo color de estado del objeto

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_valvula() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de un componente simple, sin
  Sb_EST
****************************************************************************************/
void cambiar_estado_com_simple(string nom_obj_graf, string dp1, bool marcha, string dp2, bool alm)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;

  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto

  if (alm)  color_estado_nuevo = "rojo"; //El estado nuevo será rojo si está en alarma, esté en marcha o no, verde si está en marcha y no hay alarma, y gris si no hay alarma ni marcha.
  else if (marcha)  color_estado_nuevo = "verde";
  else color_estado_nuevo = "gris";

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_com_simple() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de un componente simple, sin
  Sb_EST
****************************************************************************************/
void cambiar_estado_com_simple_gif(string nom_obj_graf, string dp1, bool marcha, string dp2, bool alm)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;

  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto

  if (alm)  color_estado_nuevo = "rojo"; //El estado nuevo será rojo si está en alarma, esté en marcha o no, verde si está en marcha y no hay alarma, y gris si no hay alarma ni marcha.
  else if (marcha)  color_estado_nuevo = "verde";
  else  color_estado_nuevo = "gris";

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  if (color_estado_actual == "verde") strreplace(fill_objeto, "gif", "svg");

  if (color_estado_nuevo == "verde") strreplace(fill_objeto, "svg", "gif");

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_com_simple() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de un objeto (faceplates con gif).
****************************************************************************************/
void cambiar_estado_objeto_gif(string nom_obj_graf, string dp1, int estado)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;
  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto
  color_estado_nuevo = get_color_estado_nuevo(estado);  //Recuperamos el nuevo color de estado del objeto

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  if (color_estado_actual == "verde") strreplace(fill_objeto, "gif", "svg");

  if (color_estado_nuevo == "verde") strreplace(fill_objeto, "svg", "gif");

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_objeto_gif() *********/

/***************************************************************************************
  @brief Función para modificar el patternfill de estado de una valvula (faceplates con gif).
****************************************************************************************/
void cambiar_estado_valvula_gif(string nom_obj_graf, string dp1, int estado)
{
  shape shape_objeto;
  string fill_objeto, color_estado_nuevo, color_estado_actual;

  shape_objeto = getShape(nom_obj_graf);  //Recuperamos el shape del objeto que se va a cambiar su estado
  fill_objeto = shape_objeto.fill();  //Recuperamos el patternfill de relleno del objeto
  color_estado_actual = get_color_estado_actual(fill_objeto);  //Recuperamos el color de estado actual del objeto
  color_estado_nuevo = get_color_estado_nuevo_valvula(estado);  //Recuperamos el nuevo color de estado del objeto

  strreplace(fill_objeto, color_estado_actual, color_estado_nuevo);  //Remplazamos en el patternfill el color del objeto actual por el color de estado nuevo

  if (color_estado_actual == "verde") strreplace(fill_objeto, "gif", "svg");

  if (color_estado_nuevo == "verde") strreplace(fill_objeto, "svg", "gif");

  setValue(nom_obj_graf, "fill", fill_objeto);  //Seteamos el patternfill con el nuevo estado del objeto
}
/******* Fin de la función cambiar_estado_valvula_gif() *********/

/***************************************************************************************
  @brief Función para recuperar el color de estado actual de un objeto.
  @return color_actual es un string con el color de estado del objeto.
****************************************************************************************/
string get_color_estado_actual(string fill)
{
  string color_actual;
  bool color_encontrado;

  for (int w = 1; w <= dynlen(colores_estado); w++)
  {
    color_encontrado = patternMatch(colores_estado[w], fill);

    if (color_encontrado)  color_actual = colores_estado[w]; strreplace(color_actual, "*", "");
  }

  return (color_actual);
}
/******* Fin de la función get_color_estado_actual() *********/

/***************************************************************************************
  @brief Función para recuperar el color de estado nuevo de un objeto en función de su
  estado.
  @return color_estado es un string con el color de estado nuevo del objeto.
****************************************************************************************/
string get_color_estado_nuevo(int estado)
{
  string color_estado;

  color_estado = estados_colores.value(estado, "");  //Recuperamos el color de estado dependiendo del estado que llega por parámetro

  if (color_estado.isEmpty())  color_estado = "gris"; //Si no se ha recuperado ningún color de estado por defecto se devuelve el estado gris

  return (color_estado);
}
/******* Fin de la función get_color_estado_nuevo() *********/

/***************************************************************************************
  @brief Función para recuperar el color de estado nuevo de una valvula en función de su
  estado.
  @return color_estado es un string con el color de estado nuevo del objeto.
****************************************************************************************/
string get_color_estado_nuevo_valvula(int estado)
{
  string color_estado;

  color_estado = estados_colores_valvula.value(estado, "");  //Recuperamos el color de estado dependiendo del estado que llega por parámetro

  if (color_estado.isEmpty())  color_estado = "gris"; //Si no se ha recuperado ningún color de estado por defecto se devuelve el estado gris

  return (color_estado);
}
/******* Fin de la función get_color_estado_nuevo_valvula() *********/

/***************************************************************************************
  @brief Función para recuperar un array con las variables de cada clase y el estado del
  address de las mismas.


/***************************************************************************************
  @brief Función para recuperar el color de estado nuevo de un objeto en función de su
  estado.
  @return color_estado es un string con el color de estado nuevo del objeto.
****************************************************************************************/
void color_sombra_maquina_error(string nom_obj)
{
  setMultiValue(nom_obj, "shadowColor", "LIB_IRC_ROJO_01",
                nom_obj, "enabled", TRUE,
                nom_obj, "shadowOffset", 5, 5);
}
/******* Fin de la función color_sombra_maquina_error() *********/
