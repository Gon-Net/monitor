import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegistryExtrem extends StatefulWidget {
  const RegistryExtrem({super.key});

  @override
  State<RegistryExtrem> createState() => _RegistryExtremState();
}

class _RegistryExtremState extends State<RegistryExtrem> {

      final String texto1='Comarapa';
    TextEditingController searchController = TextEditingController();

  // _CommunalObserverState({
  //   required this.texto1,
  // });

  void openDialog( BuildContext context ){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        String? _selectedOption1;
        String? _selectedOption2;// Variable para almacenar la opción seleccionada
        TextEditingController _textField1Controller = TextEditingController();
        TextEditingController _textField2Controller = TextEditingController();
        TextEditingController _textField3Controller = TextEditingController();
        TextEditingController _startDateController = TextEditingController();
        TextEditingController _endDateController = TextEditingController();
        bool _papa = false;
        bool _haba = false;
        bool _tomate = false;
        bool _cebolla = false;

        Future<void> _selectDate(TextEditingController controller) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            controller.text = DateFormat('dd/MM/yyyy').format(picked);
          }
        }

        return AlertDialog(
          title: const Text('Registro Eventos Extremos'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedOption1,
                      items: <String>[
                        'Extrema Alta',
                        'Irregular Media',
                        'Normal Baja'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption1 = newValue;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Heladas'),
                    ),
                    // DropdownButtonFormField<String>(
                    //   value: _selectedOption2,
                    //   items: <String>[
                    //     'Extrema Alta',
                    //     'Irregular Media',
                    //     'Normal Baja'
                    //   ].map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       _selectedOption2 = newValue;
                    //     });
                    //   },
                    //   decoration: const InputDecoration(labelText: 'Combo 2'),
                    // ),
                    if (_selectedOption1 == 'Extrema Alta' ||
                        _selectedOption1 == 'Irregular Media')
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text('Papa: '),
                              Radio<bool>(
                                value: true,
                                groupValue: _papa,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _papa = value!;
                                  });
                                },
                              ),
                              const Text('Sí'),
                              Radio<bool>(
                                value: false,
                                groupValue: _papa,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _papa = value!;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Haba: '),
                              Radio<bool>(
                                value: true,
                                groupValue: _haba,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _haba = value!;
                                  });
                                },
                              ),
                              const Text('Sí'),
                              Radio<bool>(
                                value: false,
                                groupValue: _haba,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _haba = value!;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Tomate: '),
                              Radio<bool>(
                                value: true,
                                groupValue: _tomate,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _tomate = value!;
                                  });
                                },
                              ),
                              const Text('Sí'),
                              Radio<bool>(
                                value: false,
                                groupValue: _tomate,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _tomate = value!;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Cebolla: '),
                              Radio<bool>(
                                value: true,
                                groupValue: _cebolla,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _cebolla = value!;
                                  });
                                },
                              ),
                              const Text('Sí'),
                              Radio<bool>(
                                value: false,
                                groupValue: _cebolla,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _cebolla = value!;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                        ],
                      ),
                    
                   
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                print('Opción 1 seleccionada: $_selectedOption1');
                print('Opción 2 seleccionada: $_selectedOption2');
                print('Campo 1: ${_textField1Controller.text}');
                print('Fecha Inicio: ${_startDateController.text}');
                print('Campo 2: ${_textField2Controller.text}');
                print('Fecha Fin: ${_endDateController.text}');
                print('Campo 3: ${_textField3Controller.text}');
                print('Papa: $_papa');
                print('Haba: $_haba');
                print('Tomate: $_tomate');
                print('Cebolla: $_cebolla');

                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registro Eventos Extremos'),
        backgroundColor: Colors.blue,         
      ),      
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          const Padding( 
            padding: EdgeInsets.all(16.0),
            child: Text('COMUNIDAD HUAYANCA', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 2), 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  children: [
                    Text('Departamento : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 1'),
                  ],
                ),
                Row(
                  children: [
                    Text('Provincia : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 2'),
                  ],
                ),
                Row(
                  children: [
                    Text('Municipio : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 3'),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10), // Espacio entre los Rows y el TextField/Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Buscar...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica de búsqueda aquí, usando searchController.text
                    print('Buscando: ${searchController.text}');
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),

          Expanded(

            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    color: Colors.grey[300],
                  ),
                );
              },
            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: () => openDialog(context),
        child: const Icon(Icons.add), 
        backgroundColor: Colors.blue, 
      ),
    );
  }

}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.isEmpty) {
      return newValue;
    }

    RegExp regex = RegExp(r'^\d+\.?\d{0,2}');
    if (regex.hasMatch(newText)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}