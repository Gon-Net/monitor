import 'package:flutter/material.dart';

class Risk extends StatefulWidget {
  const Risk({super.key});

  @override
  State<Risk> createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ingreso Riesgo'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcomr Riesgo'),
      ),
    );
  }
}