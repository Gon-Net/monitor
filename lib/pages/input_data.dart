import 'package:flutter/material.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ingreso Datos'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Ingreso Datos'),
      ),
    );
  }
}