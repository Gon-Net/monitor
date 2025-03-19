import 'package:flutter/material.dart';

class ForecastDataClimate extends StatefulWidget {
  const ForecastDataClimate({super.key});

  @override
  State<ForecastDataClimate> createState() => _ForecastDataClimateState();
}

class _ForecastDataClimateState extends State<ForecastDataClimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pronóstico Dato Climático'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcome Pronóstico Dato Climático'),
      ),
    );
  }
}