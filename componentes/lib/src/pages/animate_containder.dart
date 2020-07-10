import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainderPage extends StatefulWidget { //state ful para poder modificar.
  @override
  _AnimatedContainderPageState createState() => _AnimatedContainderPageState();
}

class _AnimatedContainderPageState extends State<AnimatedContainderPage> {

  double _width  = 50.0; // se crean variables
  double _height = 50.0;
  Color  _color   = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Containder'),
      ),

      body: Center(
        child: AnimatedContainer( // para poder agregarle animaciones
          duration: Duration( milliseconds: 200 ) ,//duracion a la animacion
          curve: Curves.linear , //que animacion
          width: _width,
          height: _height,
          decoration: BoxDecoration(// decoracion.
            borderRadius: _borderRadius, //el borde
            color: _color //el color
          ),

        ),
      ),

      floatingActionButton: FloatingActionButton( //boton de abajo 
        child: Icon(Icons.play_arrow), // se le agrega el icono
        onPressed: _cambiarforma, //si se apreta, se llama a la funcion .
      ),


   );
 }
        
  void _cambiarforma() {

    final random = Random();// se importa para poder dar valores random
    
    setState(() {
      _width = random.nextInt(300).toDouble(); // se modifican los valores.
      _height =random.nextInt(300).toDouble();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

    });
  }
}