import 'package:flutter/material.dart';

class ReportForecast extends StatefulWidget {
  const ReportForecast({super.key});

  @override
  State<ReportForecast> createState() => _ReportForecastState();
}

class _ReportForecastState extends State<ReportForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reporte Pronóstico'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Reporte Pronóstico'),
      ),
    );
  }
}