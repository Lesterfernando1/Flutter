import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{

  String _apikey   ='c6acdb8db4e4a5f941071c6c68a64be2';
  String _url      ='api.themoviedb.org';
  String _lenguage ='es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;

  }


  Future<List<Pelicula>>  getEnCines() async {

    final url =Uri.https(_url, '3/movie/now_playing',{
      'api_key'  : _apikey,
      'language' : _lenguage,
    });

    return await _procesarRespuesta(url);


  }

  Future<List<Pelicula>>  getPolulares() async {

     final url =Uri.https(_url, '3/movie/popular',{
      'api_key'  : _apikey,
      'language' : _lenguage,
    });

    return await _procesarRespuesta(url);
  }


}