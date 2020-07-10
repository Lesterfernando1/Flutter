import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper ({ @required this.peliculas });



  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
  

    return Container(
      padding: EdgeInsets.only(top:10.0), //padding para que no esten pegadas.
      //width: double.infinity, //esta define toooodo el ancho.
      child: Swiper(
          layout: SwiperLayout.STACK,// se crea el efecto hacia al lado.
          itemWidth: _screenSize.width * 0.7, //ancho
          itemHeight: _screenSize.height *0.5,//alto.
          itemBuilder: (BuildContext context,int index){
            return ClipRRect( // para poder hacer puntas redondas.
              borderRadius: BorderRadius.circular(20.0), //bordes
              child:FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()  ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            );

          },
          itemCount: peliculas.length, //cuantas paginas
          //pagination: new SwiperPagination(), //para saber en que pagina vas
          //control: new SwiperControl(), //para poder moverlas 
        ),
    );
  }
}