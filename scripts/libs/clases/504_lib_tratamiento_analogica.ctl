class lib_tratamiento_analogica
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------
  //Input
  private static string xd_habilitar_al = "Input.Xd_Habilitar_AL";
  private static string xd_habilitar_all = "Input.Xd_Habilitar_ALL";
  private static string xd_habilitar_ah = "Input.Xd_Habilitar_AH";
  private static string xd_habilitar_ahh = "Input.Xd_Habilitar_AHH";
  private static string xr_sp_al = "Input.Xr_SP_AL";
  private static string xr_sp_all = "Input.Xr_SP_ALL";
  private static string xr_sp_ah = "Input.Xr_SP_AH";
  private static string xr_sp_ahh = "Input.Xr_SP_AHH";
  private static string xd_habilitar_bocina_al = "Input.Xd_Habilitar_Bocina_AL";
  private static string xd_habilitar_bocina_all = "Input.Xd_Habilitar_Bocina_ALL";
  private static string xd_habilitar_bocina_ah = "Input.Xd_Habilitar_Bocina_AH";
  private static string xd_habilitar_bocina_ahh = "Input.Xd_Habilitar_Bocina_AHH";

  //Output
  private static string yr_valorescalado = "Output.Yr_ValorEscalado";
  private static string yd_al = "Output.Yd_AL";
  private static string yd_all = "Output.Yd_ALL";
  private static string yd_ah = "Output.Yd_AH";
  private static string yd_ahh = "Output.Yd_AHH";
  private static string yd_fondoescala = "Output.Yd_FondoEscala";

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";
  private static string cfg_tiempovigilancia_all = "Static.CFG_TiempoVigilancia_ALL";
  private static string cfg_tiempovigilancia_ahh = "Static.CFG_TiempoVigilancia_AHH";

  //CONSTRUCTOR
  public lib_tratamiento_analogica(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

    variable_estado_address = makeDynAnytype(makeDynAnytype(yr_valorescalado, TRUE),makeDynAnytype(yd_al, TRUE),makeDynAnytype(yd_all, TRUE),
                                             makeDynAnytype(yd_ah, TRUE),makeDynAnytype(yd_ahh, TRUE),makeDynAnytype(xd_habilitar_al, FALSE),
                                             makeDynAnytype(xd_habilitar_all, FALSE),makeDynAnytype(xd_habilitar_ah, FALSE),
                                             makeDynAnytype(xd_habilitar_ahh, FALSE),makeDynAnytype(xr_sp_al, FALSE),makeDynAnytype(xr_sp_all, FALSE),
                                             makeDynAnytype(xr_sp_ah, FALSE),makeDynAnytype(xr_sp_ahh, FALSE),
                                             makeDynAnytype(yd_fondoescala, FALSE),makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(xd_habilitar_bocina_al, FALSE),
                                             makeDynAnytype(xd_habilitar_bocina_all, FALSE),makeDynAnytype(xd_habilitar_bocina_ah, FALSE),
                                             makeDynAnytype(xd_habilitar_bocina_ahh, FALSE),makeDynAnytype(cfg_tiempovigilancia_all, TRUE),
                                             makeDynAnytype(cfg_tiempovigilancia_ahh, TRUE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(yr_valorescalado, ""), makeDynAnytype(yd_al, ""), makeDynAnytype(yd_all, ""),
                                        makeDynAnytype(yd_ah, ""), makeDynAnytype(yd_ahh, ""), makeDynAnytype(xd_habilitar_al, ""),
                                        makeDynAnytype(xd_habilitar_all, ""), makeDynAnytype(xd_habilitar_ah, ""),
                                        makeDynAnytype(xd_habilitar_ahh, ""), makeDynAnytype(xr_sp_al, ""), makeDynAnytype(xr_sp_all, ""),
                                        makeDynAnytype(xr_sp_ah, ""), makeDynAnytype(xr_sp_ahh, ""),
                                        makeDynAnytype(yd_fondoescala, ""),makeDynAnytype(archivado_bbdd, ""), makeDynAnytype(xd_habilitar_bocina_al, ""),
                                        makeDynAnytype(xd_habilitar_bocina_all, ""), makeDynAnytype(xd_habilitar_bocina_ah, ""),
                                        makeDynAnytype(xd_habilitar_bocina_ahh, ""),makeDynAnytype(cfg_tiempovigilancia_all, "s"),
                                        makeDynAnytype(cfg_tiempovigilancia_ahh, "s"));

      return (variable_unidad_dp);
    }
};
