class lib_filtro_digital
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------

  //Static
  private static string archivado_bbdd = "Static.archivado_bbdd";

  //Output
  private static string yd_salida = "Output.Yd_Salida";

  //CONSTRUCTOR
  public lib_filtro_digital(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

//    variable_estado_address = makeDynAnytype(makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(sd_salida, FALSE));

    variable_estado_address = makeDynAnytype(makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(yd_salida, TRUE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(archivado_bbdd, ""),makeDynAnytype(yd_salida, ""));

    return (variable_unidad_dp);
  }
};
