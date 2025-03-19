import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class LocalObserverOp extends StatefulWidget {
  const LocalObserverOp({super.key});

  @override
  State<LocalObserverOp> createState() => _LocalObserverOpState();
}

class _LocalObserverOpState extends State<LocalObserverOp> {
  TextEditingController nameObserver = TextEditingController();
  TextEditingController numberDocumentIdentity = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController numberCellphon = TextEditingController();
  TextEditingController nameUser = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  File? _documentIdentityImage;
  File? _certificateImage;
  String? _selectedObserverType;

  List<Map<String, dynamic>> _observerTypes = [
    {'index': 0, 'value': 'TITULAR'},
    {'index': 1, 'value': 'SUPLENTE 1'},
    {'index': 2, 'value': 'SUPLENTE 2'},
    {'index': 3, 'value': 'COMUNAL'},
  ];

  int? _selectedObserverIndex;

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Imagen cargada correctamente.')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se seleccionó ninguna imagen.')),
      );
    }
  }

  Future<void> _sendDataToServer() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('TU_URL_DEL_SERVIDOR')); // Reemplaza con tu URL

      request.fields['observerTypeIndex'] = _selectedObserverIndex.toString();
      request.fields['nameObserver'] = nameObserver.text;
      request.fields['numberDocumentIdentity'] = numberDocumentIdentity.text;
      request.fields['dateBirth'] = _startDateController.text;
      request.fields['numberCellphon'] = numberCellphon.text;
      request.fields['nameUser'] = nameUser.text;
      request.fields['email'] = email.text;

      if (_documentIdentityImage != null) {
        final mimeType = lookupMimeType(_documentIdentityImage!.path);
        request.files.add(
          await http.MultipartFile.fromPath(
            'documentIdentityImage',
            _documentIdentityImage!.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      }
      if (_certificateImage != null) {
        final mimeType = lookupMimeType(_certificateImage!.path);
        request.files.add(
          await http.MultipartFile.fromPath(
            'certificateImage',
            _certificateImage!.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Datos enviados correctamente.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar los datos.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registro Observador Local'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<int>(
                value: _selectedObserverIndex,
                items: _observerTypes.map((type) {
                  return DropdownMenuItem<int>(
                    value: type['index'],
                    child: Text(type['value']),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedObserverIndex = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Tipo de Observador'),
              ),
              TextField(
                controller: nameObserver,
                decoration: const InputDecoration(labelText: 'Nombre Completo'),
              ),
              TextField(
                controller: numberDocumentIdentity,
                decoration: const InputDecoration(
                    labelText: 'Número Documento Identidad'),
              ),
              TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(labelText: 'Fecha Nacimiento'),
                readOnly: true,
                onTap: () => _selectDate(_startDateController),
              ),
              TextField(
                controller: numberCellphon,
                decoration: const InputDecoration(labelText: 'Número Celular'),
              ),
              TextField(
                controller: nameUser,
                decoration: const InputDecoration(labelText: 'Nombre Usuario'),
              ),
              TextField(
                controller: email,
                decoration:
                    const InputDecoration(labelText: 'Correo Electrónico'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue[100]),
                  onPressed: () => _pickImage('identity'),
                  child: const Text('Subir Documento de Identidad'),
                ),
              ),
              if (_documentIdentityImage != null)
                Image.file(
                  _documentIdentityImage!,
                  height: 100,
                ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue[100]),
                  onPressed: () => _pickImage('certificate'),
                  child: const Text('Subir Certificado de Aprobación'),
                ),
              ),
              if (_certificateImage != null)
                Image.file(
                  _certificateImage!,
                  height: 100,
                ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                    print('Tipo de observador: $_selectedObserverIndex');
                    print('Nombre completo: ${nameObserver.text}');
                    print('Número de documento: ${numberDocumentIdentity.text}');
                    print('Fecha de nacimiento: ${_startDateController.text}');
                    print('Número de celular: ${numberCellphon.text}');
                    print('Nombre de usuario: ${nameUser.text}');
                    print('Correo electrónico: ${email.text}');
                    //_sendDataToServer();
                  },
                  child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}