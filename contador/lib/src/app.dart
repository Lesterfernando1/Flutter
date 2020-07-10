import 'package:contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';
//import 'package:contador/src/pages/home_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build( context ){ //de AQUI HACIA ARRIBA ES COMO CREAR LA APP 
    return MaterialApp( //PARA INICIAR LA APP, RETURN
    debugShowCheckedModeBanner: false,
      home:Center( // PARA POSICIONARMIENTO 
        child: ContadorPage(), // QUE QUIERES POSICIONAR 
      ), 
    );
  }
}