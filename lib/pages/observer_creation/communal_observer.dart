import 'package:app_monitor/pages/observer_creation/communal_observer_op.dart';
import 'package:flutter/material.dart';

class CommunalObserver extends StatefulWidget {
  const CommunalObserver({super.key});

  @override
  State<CommunalObserver> createState() => _CommunalObserverState();
}

class _CommunalObserverState extends State<CommunalObserver> {

  final String texto1='Comarapa';

  // _CommunalObserverState({
  //   required this.texto1,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Observador Comunal'),
        backgroundColor: Colors.blue,         
      ),      
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          const Padding( 
            padding: EdgeInsets.all(16.0),
            child: Text('COMUNIDAD HUAYANCA', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 2), 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  children: [
                    Text('Departamento : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 1'),
                  ],
                ),
                Row(
                  children: [
                    Text('Provincia : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 2'),
                  ],
                ),
                Row(
                  children: [
                    Text('Municipio : ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valor 3'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Expanded(

            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    color: Colors.grey[300],
                  ),
                );
              },
            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: () {
          // Aquí puedes agregar la lógica para el botón
          print('===>>> FloatingActionButton pressed');
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>const CommunalObserverOp()));
        },
        child: const Icon(Icons.add), 
        backgroundColor: Colors.blue, 
      ),
    );
  }

}