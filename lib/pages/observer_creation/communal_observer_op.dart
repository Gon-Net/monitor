import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CommunalObserverOp extends StatefulWidget {
  const CommunalObserverOp({super.key});

  @override
  State<CommunalObserverOp> createState() => _CommunalObserverOpState();
}

class _CommunalObserverOpState extends State<CommunalObserverOp> {

  TextEditingController nameObserver = TextEditingController();
  TextEditingController numberDocumentIdentity = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController numberCellphon = TextEditingController();
  TextEditingController nameUser = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  // TextEditingController addresDocumentIdentity = TextEditingController();
  // TextEditingController addresCertificateName = TextEditingController();
  File? _documentIdentityImage;
  File? _certificateImage;
  String? _selectedObserverType;

  // Future<void> _selectDate() async{
  //   DateTime? _picked = await showDatePicker(
  //     context: context, 
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1950), 
  //     lastDate: DateTime(2100)
  //   );

  //   if(_picked != null){
  //     setState(() {
  //       dateBirth.text = _picked.toString().split(" ")[0];
  //     });
  //   }
  // }

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

  Future<void> _pickImage(String type) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        if (type == 'identity') {
          _documentIdentityImage = File(image.path);
        } else {
          _certificateImage = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registro Observador Local'),
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // DropdownButtonFormField<String>(
            //   value: _selectedObserverType,
            //   items: <String>['TITULAR', 'SUPLENTE 1', 'SUPLENTE 2'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedObserverType = newValue;
            //     });
            //   },
            //   decoration: const InputDecoration(labelText: 'Tipo de Observador'),
            // ),
            TextField(
              controller: nameObserver,
              decoration: const InputDecoration(
                labelText: 'Nombre Completo'
              ),
            ),
            TextField(
              controller: numberDocumentIdentity,
              decoration: const InputDecoration(
                labelText: 'Número Documento Identidad'
              ),
            ),
            TextFormField(
              controller: _startDateController,
              decoration: const InputDecoration(labelText: 'Fecha Nacimiento'),
              readOnly: true,
              onTap: () => _selectDate(_startDateController),
            ),
            TextField(
              controller: numberCellphon,
              decoration: const InputDecoration(
                labelText: 'Número Celular'
              ),
            ),
            TextField(
              controller: nameUser,
              decoration: const InputDecoration(
                labelText: 'Nombre Usuario'
              ),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico'
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue[100]
                ), 
                onPressed: () => _pickImage('identity'),
                child: const Text('Subir Documento de Identidad'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue[100]
                ), 
                onPressed: () => _pickImage('certificate'),
                child: const Text('Subir Certificado de Aprobación'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue
              ),            
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Guardar')
            ), 
          ],
        ),
      ),
    );
  }

}