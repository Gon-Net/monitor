class Observer{
  late String nombre_observador;
  late String numero_documento_identidad;
  late int tipo_observador_id;
  late String fecha_nacimiento;
  late String numero_celular;


  Observer(String name, String documentNumber, int tipo_observador_id, String fecha_nacimiento, String numero_celular){
    nombre_observador = name;
    numero_documento_identidad = documentNumber;
    tipo_observador_id = tipo_observador_id;
    fecha_nacimiento = fecha_nacimiento;
    numero_celular = numero_celular;
  }
}