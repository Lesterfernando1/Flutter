import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            // ignore: deprecated_member_use
            child: Text('Populares', style: Theme.of(context).textTheme.subhead,)
          ),
          SizedBox(height: 10.0,),

          FutureBuilder(
            
            future: peliculasProvider.getPolulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if(snapshot.hasData){
                return MovieHorizontal(peliculas: snapshot.data);
              } else{
                return Center(child: CircularProgressIndicator()); 
              }
      
            },
          ),


        ],
      ),
    );
  }
}