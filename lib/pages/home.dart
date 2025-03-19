import 'package:app_monitor/pages/registry_data/registry_extrem.dart';
import 'package:app_monitor/pages/registry_data/registry_period.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:app_monitor/pages/report_one.dart';
// import 'package:app_monitor/pages/user.dart';
// import 'package:app_monitor/pages/parameter.dart';
import 'package:app_monitor/pages/input_data.dart';
// import 'package:app_monitor/pages/report_observator_local.dart';
// import 'package:app_monitor/pages/report_system_production.dart';
// import 'package:app_monitor/pages/risk.dart';
// import 'package:app_monitor/pages/threat.dart';
// import 'package:app_monitor/pages/vulnerability.dart';
// import 'package:app_monitor/pages/monitor_data_bio_climate.dart';
// import 'package:app_monitor/pages/monitor_data_climate.dart';
// import 'package:app_monitor/pages/report_monitor.dart';
// import 'package:app_monitor/pages/forecast_Data_climate.dart';
// import 'package:app_monitor/pages/forecast_data_bio_climate.dart';
// import 'package:app_monitor/pages/report_forecast.dart';
// import 'package:app_monitor/pages/notification.dart';
// import 'package:app_monitor/pages/alert.dart';

import 'package:app_monitor/pages/observer_creation/local_observer.dart';
import 'package:app_monitor/pages/observer_creation/communal_observer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   permission();
  // }

  permission()async{
    // var status = await Permission.location.status;
    // if(!status.isGranted){
    //   await Permission.location.request();
    // }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ver Municipios'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Municipio 01'),
                  onTap: () {
                    print('Municipio 1 seleccionado');
                    Navigator.of(context).pop(); // Cierra el diálogo si es necesario
                  },
                ),
                ListTile(
                  title: const Text('Municipio 02'),
                  onTap: () {
                    print('Municipio 2 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 03'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 04'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 05'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 06'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 07'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 08'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 09'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Municipio 10'),
                  onTap: () {
                    print('Municipio 3 seleccionado');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text('OK'),
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Monitor Climas'),
        backgroundColor: Colors.blue, 
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // Text('MENÚ',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              DrawerHeader(
                child: Text('MENÚ',
                  style: TextStyle(
                      //color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                  ),
                )
              ),

              // Text('Configuración Administrador',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.account_circle),
              //   title: Text('Usuarios'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => User()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: Text('Parámetros'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Parameter()
              //       )
              //     );
              //   },
              // ),

              Text('Creación Observadores',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text('Observador Local'),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => LocalObserver()
                    )
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text('Observador Comunal'),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => CommunalObserver()
                    )
                  );
                },
              ),

              Text('Registro Observador Local',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.edit_rounded),
                title: Text('Formulario registro y reporte periódico'),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => RegistryPeriod()
                    )
                  );
                },
              ),

              Text('Registro Observador Comunal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.edit_rounded),
                title: Text('Formulario registro y reporte extremo'),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => RegistryExtrem()
                    )
                  );
                },
              ),
              
              // Text('Información Sistema Productivo',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.sensors),
              //   title: Text('Amenaza'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Threat()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings_input_antenna),
              //   title: Text('Vulnerabilidad'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Vulnerability()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.sensors_off),
              //   title: Text('Riesgo'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Risk()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.score_outlined),
              //   title: Text('Reporte Sistema Productivo'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ReportSystemProduction()
              //       )
              //     );
              //   },
              // ),
              // Text('Monitoreo',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.spoke_outlined),
              //   title: Text('Datos Climáticos'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => MonitorDataClimate()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings_system_daydream_outlined),
              //   title: Text('Datos Bio Climáticos'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => MonitorDataBioClimate()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.score_outlined),
              //   title: Text('Reportes Monitoreo'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ReportMonitor()
              //       )
              //     );
              //   },
              // ),
              // Text('Pronóstico',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.spoke_outlined),
              //   title: Text('Datos Climáticos'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ForecastDataClimate()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings_system_daydream_outlined),
              //   title: Text('Datos Bio Climáticos'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ForecastDataBioClimate()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.score_outlined),
              //   title: Text('Reportes Pronóstico'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ReportForecast()
              //       )
              //     );
              //   },
              // ),
              // Text('Reportes Generales',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.sms_outlined),
              //   title: Text('Notificaciones'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Alert()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.speed ),
              //   title: Text('Alertas'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => Alert()
              //       )
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.score_outlined),
              //   title: Text('Reportes Generales'),
              //   onTap: () {
              //     Navigator.push(
              //       context, 
              //       MaterialPageRoute(
              //         builder: (context) => ReportOne()
              //       )
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-17.430397, -63.693940), // Center the map over London
          initialZoom: 5.6,
        ),
        children: [
          TileLayer( // Display map tiles from any source
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.example.app',
            // And many more recommended properties!
          ),
          RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
              ),
              // Also add images...
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialog(context);
        },
        backgroundColor: Colors.blue, 
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}