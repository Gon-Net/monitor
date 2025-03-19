import 'package:flutter/material.dart';

class MonitorDataBioClimate extends StatefulWidget {
  const MonitorDataBioClimate({super.key});

  @override
  State<MonitorDataBioClimate> createState() => _MonitorDataBioClimateState();
}

class _MonitorDataBioClimateState extends State<MonitorDataBioClimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Datos Bio Climáticos'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Datos Bio Climáticos'),
      ),
    );
  }
}