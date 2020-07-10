import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage  extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[

          IconButton( //crear icono
            icon:Icon( Icons.search), //icono
            onPressed: (){}, //accion
          )

        ],
      ) ,
      body: Container(
        child: Column(// crear una columna
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        )
      )
      
    );
  }


  Widget _swiperTarjetas(){


    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if (snapshot.hasData){
        return  CardSwiper( peliculas: snapshot.data);
        } else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              )
            );
        }
      },
    );

  

  }


  Widget _footer( BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Populares', style: Theme.of(context).textTheme.subhead,),

          FutureBuilder(
            
            future: peliculasProvider.getPolulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

              snapshot.data?.forEach((p)=> print(p.title));
              return Container();
            },
          ),


        ],
      ),
    );
  }
}