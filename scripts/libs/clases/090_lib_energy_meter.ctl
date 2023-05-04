//-----------------CLASES ESENCIALES----------------------
class lib_energy_meter
{
  //Configuración de la instancia del energy meter
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------
  //ST_Datos_DS_142
  private static string tension_l1_n = "ST_Datos_DS_142.Tension_L1-N";
  private static string tension_l2_n = "ST_Datos_DS_142.Tension_L2-N";
  private static string tension_l3_n = "ST_Datos_DS_142.Tension_L3-N";
  private static string tension_l1_l2 = "ST_Datos_DS_142.Tension_L1-L2";
  private static string tension_l2_l3 = "ST_Datos_DS_142.Tension_L2-L3";
  private static string tension_l3_l1 = "ST_Datos_DS_142.Tension_L3-L1";
  private static string intensidad_l1 = "ST_Datos_DS_142.Intensidad_L1";
  private static string intensidad_l2 = "ST_Datos_DS_142.Intensidad_L2";
  private static string intensidad_l3 = "ST_Datos_DS_142.Intensidad_L3";
  private static string factor_potencia_l1 = "ST_Datos_DS_142.Factor_Potencia_L1";
  private static string factor_potencia_l2 = "ST_Datos_DS_142.Factor_Potencia_L2";
  private static string factor_potencia_l3 = "ST_Datos_DS_142.Factor_Potencia_L3";
  private static string factor_potencia_total = "ST_Datos_DS_142.Factor_Potencia_Total";
  private static string frecuencia = "ST_Datos_DS_142.Frecuencia";
  private static string potencia_aparente_l1 = "ST_Datos_DS_142.Potencia_Aparente_L1";
  private static string potencia_aparente_l2 = "ST_Datos_DS_142.Potencia_Aparente_L2";
  private static string potencia_aparente_l3 = "ST_Datos_DS_142.Potencia_Aparente_L3";
  private static string potencia_aparente_total = "ST_Datos_DS_142.Potencia_Aparente_Total";
  private static string potencia_reactiva_l1 = "ST_Datos_DS_142.Potencia_Reactiva_L1";
  private static string potencia_reactiva_l2 = "ST_Datos_DS_142.Potencia_Reactiva_L2";
  private static string potencia_reactiva_l3 = "ST_Datos_DS_142.Potencia_Reactiva_L3";
  private static string potencia_reactiva_total = "ST_Datos_DS_142.Potencia_Reactiva_Total";
  private static string potencia_activa_l1 = "ST_Datos_DS_142.Potencia_Activa_L1";
  private static string potencia_activa_l2 = "ST_Datos_DS_142.Potencia_Activa_L2";
  private static string potencia_activa_l3 = "ST_Datos_DS_142.Potencia_Activa_L3";
  private static string potencia_activa_total = "ST_Datos_DS_142.Potencia_Activa_Total";
  private static string angulo_fase_l1 = "ST_Datos_DS_142.Angulo_Fase_L1";
  private static string angulo_fase_l2 = "ST_Datos_DS_142.Angulo_Fase_L2";
  private static string angulo_fase_l3 = "ST_Datos_DS_142.Angulo_Fase_L3";
  private static string energia_aparente_total = "ST_Datos_DS_142.Energia_Aparente_Total";
  private static string energia_reactiva_total = "ST_Datos_DS_142.Energia_Reactiva_Total";
  private static string energia_activa_total = "ST_Datos_DS_142.Energia_Activa_Total";

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //CONSTRUCTOR de la clase lib_energy_meter
  public lib_energy_meter(string instancia, string tipo)
  {
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia()
  {
    return this.instancia;
  }

  //--FORMACIÓN DE CADENAS CON LOS NOMBRES DE LOS DP--
  public string get_instancia_tension_l1_n()
  {
    return this.instancia + "." + this.tension_l1_n;
  }
  public string get_instancia_tension_l2_n()
  {
    return this.instancia + "." + this.tension_l2_n;
  }
  public string get_instancia_tension_l3_n()
  {
    return this.instancia + "." + this.tension_l3_n;
  }
  public string get_instancia_tension_l1_l2()
  {
    return this.instancia + "." + this.tension_l1_l2;
  }
  public string get_instancia_tension_l2_l3()
  {
    return this.instancia + "." + this.tension_l2_l3;
  }
  public string get_instancia_tension_l3_l1()
  {
    return this.instancia + "." + this.tension_l3_l1;
  }
  public string get_instancia_intensidad_l1()
  {
    return this.instancia + "." + this.intensidad_l1;
  }
  public string get_instancia_intensidad_l2()
  {
    return this.instancia + "." + this.intensidad_l2;
  }
  public string get_instancia_intensidad_l3()
  {
    return this.instancia + "." + this.intensidad_l3;
  }
  public string get_instancia_factor_potencia_l1()
  {
    return this.instancia + "." + this.factor_potencia_l1;
  }
  public string get_instancia_factor_potencia_l2()
  {
    return this.instancia + "." + this.factor_potencia_l2;
  }
  public string get_instancia_factor_potencia_l3()
  {
    return this.instancia + "." + this.factor_potencia_l3;
  }
  public string get_instancia_factor_potencia_total()
  {
    return this.instancia + "." + this.factor_potencia_total;
  }
  public string get_instancia_frecuencia()
  {
    return this.instancia + "." + this.frecuencia;
  }
  public string get_instancia_potencia_aparente_l1()
  {
    return this.instancia + "." + this.potencia_aparente_l1;
  }
  public string get_instancia_potencia_aparente_l2()
  {
    return this.instancia + "." + this.potencia_aparente_l2;
  }
  public string get_instancia_potencia_aparente_l3()
  {
    return this.instancia + "." + this.potencia_aparente_l3;
  }
  public string get_instancia_potencia_aparente_total()
  {
    return this.instancia + "." + this.potencia_aparente_total;
  }
  public string get_instancia_potencia_reactiva_l1()
  {
    return this.instancia + "." + this.potencia_reactiva_l1;
  }
  public string get_instancia_potencia_reactiva_l2()
  {
    return this.instancia + "." + this.potencia_reactiva_l2;
  }
  public string get_instancia_potencia_reactiva_l3()
  {
    return this.instancia + "." + this.potencia_reactiva_l3;
  }
  public string get_instancia_potencia_reactiva_total()
  {
    return this.instancia + "." + this.potencia_reactiva_total;
  }
  public string get_instancia_potencia_activa_l1()
  {
    return this.instancia + "." + this.potencia_activa_l1;
  }
  public string get_instancia_potencia_activa_l2()
  {
    return this.instancia + "." + this.potencia_activa_l2;
  }
  public string get_instancia_potencia_activa_l3()
  {
    return this.instancia + "." + this.potencia_activa_l3;
  }
  public string get_instancia_potencia_activa_total()
  {
    return this.instancia + "." + this.potencia_activa_total;
  }
  public string get_instancia_angulo_fase_l1()
  {
    return this.instancia + "." + this.angulo_fase_l1;
  }
  public string get_instancia_angulo_fase_l2()
  {
    return this.instancia + "." + this.angulo_fase_l2;
  }
  public string get_instancia_angulo_fase_l3()
  {
    return this.instancia + "." + this.angulo_fase_l3;
  }
  public string get_instancia_energia_aparente_total()
  {
    return this.instancia + "." + this.energia_aparente_total;
  }
  public string get_instancia_energia_reactiva_total()
  {
    return this.instancia + "." + this.energia_reactiva_total;
  }
  public string get_instancia_energia_activa_total()
  {
    return this.instancia + "." + this.energia_activa_total;
  }

  //--Valores de los DP--
  public string get_valor_tension_l1_n()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l1_n, valor);
    return valor;
  }
  public string get_valor_tension_l2_n()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l2_n, valor);
    return valor;
  }
  public string get_valor_tension_l3_n()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l3_n, valor);
    return valor;
  }
  public string get_valor_tension_l1_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l1_l2, valor);
    return valor;
  }
  public string get_valor_tension_l2_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l2_l3, valor);
    return valor;
  }
  public string get_valor_tension_l3_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.tension_l3_l1, valor);
    return valor;
  }
  public string get_valor_intensidad_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.intensidad_l1, valor);
    return valor;
  }
  public string get_valor_intensidad_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.intensidad_l2, valor);
    return valor;
  }
  public string get_valor_intensidad_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.intensidad_l3, valor);
    return valor;
  }
  public string get_valor_factor_potencia_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.factor_potencia_l1, valor);
    return valor;
  }
  public string get_valor_factor_potencia_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.factor_potencia_l2, valor);
    return valor;
  }
  public string get_valor_factor_potencia_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.factor_potencia_l3, valor);
    return valor;
  }
  public string get_valor_factor_potencia_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.factor_potencia_total, valor);
    return valor;
  }
  public string get_valor_frecuencia()
  {
    float valor;
    dpGet(this.instancia + "." + this.frecuencia, valor);
    return valor;
  }
  public string get_valor_potencia_aparente_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_aparente_l1, valor);
    return valor;
  }
  public string get_valor_potencia_aparente_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_aparente_l2, valor);
    return valor;
  }
  public string get_valor_potencia_aparente_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_aparente_l3, valor);
    return valor;
  }
  public string get_valor_potencia_aparente_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_aparente_total, valor);
    return valor;
  }
  public string get_valor_potencia_reactiva_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_reactiva_l1, valor);
    return valor;
  }
  public string get_valor_potencia_reactiva_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_reactiva_l2, valor);
    return valor;
  }
  public string get_valor_potencia_reactiva_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_reactiva_l3, valor);
    return valor;
  }
  public string get_valor_potencia_reactiva_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_reactiva_total, valor);
    return valor;
  }
  public string get_valor_potencia_activa_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_activa_l1, valor);
    return valor;
  }
  public string get_valor_potencia_activa_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_activa_l2, valor);
    return valor;
  }
  public string get_valor_potencia_activa_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_activa_l3, valor);
    return valor;
  }
  public string get_valor_potencia_activa_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.potencia_activa_total, valor);
    return valor;
  }
  public string get_valor_angulo_fase_l1()
  {
    float valor;
    dpGet(this.instancia + "." + this.angulo_fase_l1, valor);
    return valor;
  }
  public string get_valor_angulo_fase_l2()
  {
    float valor;
    dpGet(this.instancia + "." + this.angulo_fase_l2, valor);
    return valor;
  }
  public string get_valor_angulo_fase_l3()
  {
    float valor;
    dpGet(this.instancia + "." + this.angulo_fase_l3, valor);
    return valor;
  }
  public string get_valor_energia_aparente_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.energia_aparente_total, valor);
    return valor;
  }
  public string get_valor_energia_reactiva_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.energia_reactiva_total, valor);
    return valor;
  }
  public string get_valor_energia_activa_total()
  {
    float valor;
    dpGet(this.instancia + "." + this.energia_activa_total, valor);
    return valor;
  }

  //Activar o desactivar address por defecto.
  public dyn_anytype rellenar_array_address()
  {
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(tension_l1_n, TRUE), makeDynAnytype(tension_l2_n, TRUE),
                              makeDynAnytype(tension_l3_n, TRUE), makeDynAnytype(tension_l1_l2, TRUE), makeDynAnytype(tension_l2_l3, TRUE),
                              makeDynAnytype(tension_l3_l1, TRUE), makeDynAnytype(intensidad_l1, TRUE), makeDynAnytype(intensidad_l2, TRUE),
                              makeDynAnytype(intensidad_l3, TRUE), makeDynAnytype(factor_potencia_l1, FALSE), makeDynAnytype(factor_potencia_l2, TRUE),
                              makeDynAnytype(factor_potencia_l3, TRUE), makeDynAnytype(factor_potencia_total, FALSE), makeDynAnytype(frecuencia, TRUE),
                              makeDynAnytype(potencia_aparente_l1, FALSE), makeDynAnytype(potencia_aparente_l2, FALSE), makeDynAnytype(potencia_aparente_l3, FALSE),
                              makeDynAnytype(potencia_aparente_total, FALSE), makeDynAnytype(potencia_reactiva_l1, TRUE), makeDynAnytype(potencia_reactiva_l2, TRUE),
                              makeDynAnytype(potencia_reactiva_l3, TRUE), makeDynAnytype(potencia_reactiva_total, TRUE), makeDynAnytype(potencia_activa_l1, TRUE),
                              makeDynAnytype(potencia_activa_l2, TRUE), makeDynAnytype(potencia_activa_l3, TRUE), makeDynAnytype(potencia_activa_total, TRUE),
                              makeDynAnytype(angulo_fase_l1, FALSE), makeDynAnytype(angulo_fase_l2, FALSE), makeDynAnytype(angulo_fase_l3, FALSE),
                              makeDynAnytype(energia_aparente_total, TRUE), makeDynAnytype(energia_reactiva_total, TRUE), makeDynAnytype(energia_activa_total, TRUE),
                              makeDynAnytype(archivado_bbdd, TRUE));

    return (variable_estado_address);
  }

  //Unidades de las variables.
  public dyn_anytype rellenar_unidades_dp()
  {
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(tension_l1_n, "V"), makeDynAnytype(tension_l2_n, "V"),
                                        makeDynAnytype(tension_l3_n, "V"), makeDynAnytype(tension_l1_l2, "V"), makeDynAnytype(tension_l2_l3, "V"),
                                        makeDynAnytype(tension_l3_l1, "V"), makeDynAnytype(intensidad_l1, "A"), makeDynAnytype(intensidad_l2, "A"),
                                        makeDynAnytype(intensidad_l3, "A"), makeDynAnytype(factor_potencia_l1, ""), makeDynAnytype(factor_potencia_l2, ""),
                                        makeDynAnytype(factor_potencia_l3, ""), makeDynAnytype(factor_potencia_total, ""), makeDynAnytype(frecuencia, "Hz"),
                                        makeDynAnytype(potencia_aparente_l1, "VA"), makeDynAnytype(potencia_aparente_l2, "VA"), makeDynAnytype(potencia_aparente_l3, "VA"),
                                        makeDynAnytype(potencia_aparente_total, "VA"), makeDynAnytype(potencia_reactiva_l1, "VAr"), makeDynAnytype(potencia_reactiva_l2, "VAr"),
                                        makeDynAnytype(potencia_reactiva_l3, "VAr"), makeDynAnytype(potencia_reactiva_total, "VAr"), makeDynAnytype(potencia_activa_l1, "W"),
                                        makeDynAnytype(potencia_activa_l2, "W"), makeDynAnytype(potencia_activa_l3, "W"), makeDynAnytype(potencia_activa_total, "W"),
                                        makeDynAnytype(angulo_fase_l1, "º"), makeDynAnytype(angulo_fase_l2, "º"), makeDynAnytype(angulo_fase_l3, "º"),
                                        makeDynAnytype(energia_aparente_total, "VAh"), makeDynAnytype(energia_reactiva_total, "VAh"), makeDynAnytype(energia_activa_total, "Wh"),
                                        makeDynAnytype(archivado_bbdd, ""));
    return (variable_unidad_dp);
  }
};
