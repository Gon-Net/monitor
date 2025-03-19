import 'package:flutter/material.dart';

class ReportOne extends StatefulWidget {
  const ReportOne({super.key});

  @override
  State<ReportOne> createState() => _ReportOneState();
}

class _ReportOneState extends State<ReportOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Report One'),
      ),
      body: Center(
        child: Text('Welcomr Reporte One'),
      ),
    );
  }
}