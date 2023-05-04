class lib_componente_simple
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------
  //Input
  private static string xd_inha = "Input.Xd_INHA";
  private static string ed_auto = "Input.Ed_AUTO";
  private static string ed_man = "Input.Ed_MAN";
  private static string ed_a_om = "Input.Ed_A_OM";
  private static string ed_alm_1 = "Input.Ed_ALM_1";

  //Output
  private static string sd_om = "Output.Sd_OM";
  private static string sd_auto = "Output.Sd_AUTO";
  private static string sd_man = "Output.Sd_MAN";
  private static string sd_alm = "Output.Sd_ALM";

  //InOut
  private static string ed_m_om = "InOut.Ed_M_OM";

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //CONSTRUCTOR
  public lib_componente_simple(string instancia, string tipo){
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

  public string get_automatico(){
    return this.instancia + "." + this.ed_auto;
  }

  public string get_manual(){
    return this.instancia + "." + this.ed_man;
  }

  public string get_m_om(){
    return this.instancia + "." + this.ed_m_om;
  }

  public string get_modo_auto(){
    return this.instancia + "." + this.sd_auto;
  }

  public string get_modo_manual(){
    return this.instancia + "." + this.sd_man;
  }
  public string get_marcha(){
    return this.instancia + "." + this.sd_om;
  }

  public string get_alm(){
    return this.instancia + "." + this.sd_alm;
  }

  //--Acciones--

  public void set_automatico(){
    dpSet(get_manual(), 0,  //Poner Ed_Manual a 0
          get_automatico(), 1);  //Poner Ed_Auto a 1
  }

  //Cambia a modo manual
  public void set_manual(){
    dpSet(get_automatico(), 0,   //Poner Ed_Auto a 1
          get_manual(), 1);  //Poner Ed_Manual a 0
  }

 //Para de forma manual
  public void parar_manual(){
    dpSet(get_m_om(), 0);
  }

  //Arranca de forma manual
  public void arrancar_manual(){
    dpSet(get_m_om(), 1);
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(ed_auto, TRUE), makeDynAnytype(ed_man, TRUE),
                                             makeDynAnytype(ed_a_om, FALSE),
                                             makeDynAnytype(ed_alm_1, FALSE), makeDynAnytype(sd_om, TRUE),
                                             makeDynAnytype(sd_auto, TRUE), makeDynAnytype(sd_man, TRUE), makeDynAnytype(ed_m_om, FALSE),
                                             makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(sd_alm, TRUE));

//     variable_estado_address = makeDynAnytype(makeDynAnytype(xd_inha, FALSE), makeDynAnytype(ed_auto, FALSE), makeDynAnytype(ed_man, FALSE),
//                                              makeDynAnytype(ed_a_om, FALSE),
//                                              makeDynAnytype(ed_alm_1, FALSE), makeDynAnytype(sd_om, FALSE),
//                                              makeDynAnytype(sd_auto, FALSE), makeDynAnytype(sd_man, FALSE), makeDynAnytype(ed_m_om, FALSE),
//                                              makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(sd_alm, FALSE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(xd_inha, ""), makeDynAnytype(ed_auto, ""), makeDynAnytype(ed_man, ""),
                                        makeDynAnytype(ed_a_om, ""),
                                        makeDynAnytype(ed_alm_1, ""), makeDynAnytype(sd_om, ""),
                                        makeDynAnytype(sd_auto, ""), makeDynAnytype(sd_man, ""), makeDynAnytype(ed_m_om, ""),
                                        makeDynAnytype(archivado_bbdd, ""),makeDynAnytype(sd_alm, ""));

      return (variable_unidad_dp);
    }
};
