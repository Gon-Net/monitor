import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_monitor/pages/observer_creation/local_observer_op.dart';
import 'package:app_monitor/models/observer.dart';

class LocalObserver extends StatefulWidget {
  const LocalObserver({super.key});

  @override
  State<LocalObserver> createState() => _LocalObserverState();
}

class _LocalObserverState extends State<LocalObserver> {  
  
  List _observers = [];

  @override
  void initState() {
    super.initState();    
    _getObservers();

  }

  _getObservers()async{
    var url = Uri.parse("http://192.168.56.1:8000/observadores");
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      setState(() {
        _observers = jsonResponse;
      });
    }
    else{
      throw Exception("Falló en la conexión...!!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Observador Local'),
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
          const SizedBox(height: 10),
          Expanded(

          child: ListView.builder(
              itemCount: _observers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    color: index.isEven ? Colors.grey[200]: Colors.white,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Text(
                            _observers[index]["nombre_observador"].toString(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _observers[index]["tipo_observador_id"].toString(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
                        children: [
                          Text("F. Nacimiento: " +" "+_observers[index]["fecha_nacimiento"].toString()),                      
                          Text("Nro. Celular: " +" "+ _observers[index]["numero_celular"].toString()),                     
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(_observers[index]["nombre_observador"].substring(0,1)),
                      ),                      
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: (){
                              print('===>>> FloatingActionButton pressed');
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context)=>const LocalObserverOp()));
                            },                             
                          ),
                          IconButton(                            
                            icon: const Icon(Icons.delete),
                            onPressed: ()async{
                              print("Aqui--->>> Delete");
                              showDialog(
                                context: context, // Usa el contexto del widget actual
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Eliminar observador"),
                                    content: const Text("Esta seguro de eliminar este Observador?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancelar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Aquí puedes agregar la lógica para eliminar el observador
                                          print("Eliminar Observador");
                                        },
                                        child: const Text("Eliminar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }, 
                          ),
                        ],
                      ),
                    ),
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
            MaterialPageRoute(builder: (context)=>const LocalObserverOp()));
        },
        child: const Icon(Icons.add), 
        backgroundColor: Colors.blue, 
      ),
    );
  }

}