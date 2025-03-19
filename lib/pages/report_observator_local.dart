import 'package:flutter/material.dart';

class ReportObservatorLocal extends StatefulWidget {
  const ReportObservatorLocal({super.key});

  @override
  State<ReportObservatorLocal> createState() => _ReportObservatorLocalState();
}

class _ReportObservatorLocalState extends State<ReportObservatorLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reporte Observador Local'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcomr Reporte Observador Local'),
      ),
    );
  }
}