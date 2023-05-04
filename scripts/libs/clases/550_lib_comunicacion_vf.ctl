class lib_comunicacion_vf
{
  //Configuración de la instancia del motor
  private string instancia;
  private string tipo;

  //--------------Data Point Connection---------------


  //Output
  private static string yd_fallo_com = "Yd_FALLO_COM";

  //CONSTRUCTOR
  public lib_comunicacion_vf(string instancia, string tipo){
    this.instancia = instancia;
    this.tipo = tipo;
  }

  public string get_instancia(){
    return this.instancia;
  }

  public dyn_anytype rellenar_array_address(){
    dyn_anytype variable_estado_address;

//    variable_estado_address = makeDynAnytype(makeDynAnytype(archivado_bbdd, FALSE),makeDynAnytype(sd_salida, FALSE));

    variable_estado_address = makeDynAnytype(makeDynAnytype(yd_fallo_com, TRUE));

    return (variable_estado_address);
  }

  public dyn_anytype rellenar_unidades_dp(){
    dyn_anytype variable_unidad_dp;

    variable_unidad_dp = makeDynAnytype(makeDynAnytype(yd_fallo_com, ""));

    return (variable_unidad_dp);
  }
};
