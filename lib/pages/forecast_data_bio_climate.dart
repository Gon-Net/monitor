import 'package:flutter/material.dart';

class ForecastDataBioClimate extends StatefulWidget {
  const ForecastDataBioClimate({super.key});

  @override
  State<ForecastDataBioClimate> createState() => _ForecastDataBioClimateState();
}

class _ForecastDataBioClimateState extends State<ForecastDataBioClimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pronóstico Dato Bio Climático'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Pronóstico Dato Bio Climático'),
      ),
    );
  }
}