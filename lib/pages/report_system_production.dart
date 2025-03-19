import 'package:flutter/material.dart';

class ReportSystemProduction extends StatefulWidget {
  const ReportSystemProduction({super.key});

  @override
  State<ReportSystemProduction> createState() => _ReportSystemProductionState();
}

class _ReportSystemProductionState extends State<ReportSystemProduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ingreso Reporte Sistema Productivo'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcomr Reporte Sistema Productivo'),
      ),
    );
  }
}