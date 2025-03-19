import 'package:flutter/material.dart';

class MonitorDataClimate extends StatefulWidget {
  const MonitorDataClimate({super.key});

  @override
  State<MonitorDataClimate> createState() => _MonitorDataClimateState();
}

class _MonitorDataClimateState extends State<MonitorDataClimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Datos Climáticos'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Datos Climáticos'),
      ),
    );
  }
}