import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,//CREAR SOMBRAS.
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0) ),//´PARA CREAR BORDES.

      child: Column(

        children: <Widget>[

          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Aqui estamos en la descripcion de la tarjeta'),
          ),


          Row(
            mainAxisAlignment:

              MainAxisAlignment.end, // colocar botones al final.

            children: <Widget>[// se cran varios widgets
              
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),

              FlatButton(
                child: Text('Acepto'),
                onPressed: () {},
              ),

            ],

          ),


        ],
      ),
    );
  }

  Widget _cardTipo2() {

    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(

        children: <Widget>[

          FadeInImage( // SE CREA PARA COLOCAR UN GIFT PARA ESPERAR.
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'), //AQUI LA IMAGEN
            placeholder: AssetImage('assets/jar-loading.gif'), //AQUI EL GIFT HASTA QUE SE CARGUE LA IMAGEN
            fadeInDuration: Duration( milliseconds: 100) ,// ANIMACION CUANTOS SEC DURE LA IMAGENN
            height: 300.0,//ALTURA DE LA IMAGEN
            fit: BoxFit.cover, //ESPACIO A OCUPAR.
          ),

          Container(
            padding: EdgeInsets.all(10.0),//PADDING EN LOS LADOS.
            child: Text('No tengo idea de que poner')
          )


        ],
      ),
    );

    return Container(


      child: ClipRRect(

        borderRadius:BorderRadius.circular(30.0),
        child: card, 
      ),


      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          ),

        ]
      ),


    );

  }
}
