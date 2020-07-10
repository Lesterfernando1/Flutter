import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),

      ),
      body:Center(
        child: RaisedButton( //se crea un botton

          child: Text('Mostrar Alerta'),//texto del boton
          color: Colors.blue, //color
          textColor: Colors.white,//color de la letra
          shape: StadiumBorder(),// bordes circulares a todo
          onPressed: ()=> _mostrarAlert(context),// mostrar la funcion

        ),

      ) ,

      floatingActionButton: FloatingActionButton( //boton de abajo 
        child: Icon(Icons.keyboard_backspace), // se le agrega el icono
        onPressed: (){ //si se apreta, vuelve a la pagina anterior.
          Navigator.pop(context);

        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){// estructura de la funcion

    showDialog(//mostrar algo.
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(  //mostrar la alerta
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),//bordes redondos dentro del rectangulo de la alerta
          title: Text('Titulo'),   //titulo
          content: Column(  // se crea una columna para poder colocar widget
            mainAxisSize: MainAxisSize.min,  // para la alerta sea minmima

            children: <Widget>[   //toda columna tiene un childen.
              Text('Este es el contenido de la caja de la alerta'),//contenido
              FlutterLogo(size: 75.0,)//logo
            ],

          ),

          actions: <Widget>[

            FlatButton( //boton
              child: Text('Cancelar'),//texto
              onPressed: ()=> Navigator.of(context).pop(),//accion de volver
            ),

            FlatButton( 
              child: Text('Ok'),//texto
              onPressed: ()=> Navigator.of(context).pop(),//accion de volver
            ),


          ],
        );

      }, 
    );

  }


}