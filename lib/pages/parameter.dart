import 'package:flutter/material.dart';

class Parameter extends StatefulWidget {
  const Parameter({super.key});

  @override
  State<Parameter> createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Parameter'),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Text('Welcomr Parameter'),
      ),
    );
  }
}