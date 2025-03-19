import 'package:flutter/material.dart';

class ReportMonitor extends StatefulWidget {
  const ReportMonitor({super.key});

  @override
  State<ReportMonitor> createState() => _ReportMonitorState();
}

class _ReportMonitorState extends State<ReportMonitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reporte Monitoreo'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Reporte Monitoreo'),
      ),
    );
  }
}