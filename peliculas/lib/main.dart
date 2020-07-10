import 'package:flutter/material.dart';

import 'package:peliculas/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, //para sacar el baner,
      title: 'Peliculas', //el titulo
      initialRoute: '/', //ruta inicial
      routes: { //rutas
        '/' : ( BuildContext context ) => HomePage(), //asi se va a la primera ruta
      },
    );
  }
}