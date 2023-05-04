/***************************************************************************************
  @date 05/11/2018.
  @brief Establecemos el formato de una tabla, el alineado de la cabecera y el tipo de alineado.
****************************************************************************************/
void formatear_estilo_tabla(string nom_tabla, string tipo_alig, string col_rgb_tabla_1, string col_rgb_tabla_2)
{
  int num_colum;
  string nom_colum;
  shape shape_tabla;

  shape_tabla = getShape(nom_tabla);
  num_colum = shape_tabla.columnCount();
  //shape_tabla.deleteAllLines();
  shape_tabla.tableMode(1);
  shape_tabla.selectByClick(1);
  shape_tabla.enableRowResize(FALSE);
  shape_tabla.enableColumnResize(FALSE);
  shape_tabla.alternatingRowColors(makeDynString(col_rgb_tabla_1, col_rgb_tabla_2));
  for(int t = 0; t < num_colum; t++){
    nom_colum = shape_tabla.columnToName(t);
    shape_tabla.columnHeaderAlignment(shape_tabla.nameToColumn(nom_colum), tipo_alig);
  }
}
/******* Fin de la función formatear_estilo_tabla() *********/
