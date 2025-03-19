import 'package:flutter/material.dart';

class Threat extends StatefulWidget {
  const Threat({super.key});

  @override
  State<Threat> createState() => _ThreatState();
}

class _ThreatState extends State<Threat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ingreso Amenaza'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcomr Amenaza'),
      ),
    );
  }
}