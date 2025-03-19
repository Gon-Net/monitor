import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegistryPeriod extends StatefulWidget {
  const RegistryPeriod({super.key});

  @override
  State<RegistryPeriod> createState() => _RegistryPeriodState();

}

class _RegistryPeriodState extends State<RegistryPeriod> {
  
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
        String? _selectedOption; // Variable para almacenar la opción seleccionada
        TextEditingController _textField1Controller = TextEditingController();
        TextEditingController _textField2Controller = TextEditingController();
        TextEditingController _textField3Controller = TextEditingController();
        TextEditingController _startDateController = TextEditingController();
        TextEditingController _endDateController = TextEditingController();

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
          title: const Text('Registro Precipitación'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'diario',
                          groupValue: _selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                        ),
                        const Text('Diario'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'multidiario',
                          groupValue: _selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                        ),
                        const Text('Multidiario'),
                      ],
                    ),
                    if (_selectedOption == 'diario')
                      TextField(
                        controller: _textField1Controller,
                        decoration: const InputDecoration(labelText: 'Valor Precipitación (mm)'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [DecimalTextInputFormatter()],
                      ),
                    if (_selectedOption == 'multidiario')
                      Column(
                        children: [
                          TextFormField(
                            controller: _startDateController,
                            decoration: const InputDecoration(labelText: 'Fecha Desde'),
                            readOnly: true,
                            onTap: () => _selectDate(_startDateController),
                          ),
                          TextField(
                            controller: _textField2Controller,
                            decoration: const InputDecoration(labelText: 'Valor Precipitación (mm)'),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [DecimalTextInputFormatter()], 
                          ),
                          TextFormField(
                            controller: _endDateController,
                            decoration: const InputDecoration(labelText: 'Fecha Hasta'),
                            readOnly: true,
                            onTap: () => _selectDate(_endDateController),
                          ),
                          TextField(
                            controller: _textField3Controller,
                            decoration: const InputDecoration(labelText: 'Valor Precipitación (mm)'),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [DecimalTextInputFormatter()], 
                          ),                          
                          
                        ],
                      )
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
                print('Opción seleccionada: $_selectedOption');
                print('Campo 1: ${_textField1Controller.text}');
                print('Fecha Inicio: ${_startDateController.text}');
                print('Campo 2: ${_textField2Controller.text}');
                print('Fecha Fin: ${_endDateController.text}');
                print('Campo 3: ${_textField3Controller.text}');
                          
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
        title: const Text('Registro Periódico'),
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
                  child: const Icon(Icons.search,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),

          Expanded(

            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.delete),
                      ),
                    ],
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