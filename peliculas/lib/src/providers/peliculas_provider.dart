

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{

  String _apikey   ='c6acdb8db4e4a5f941071c6c68a64be2';
  String _url      ='api.themoviedb.org';
  String _lenguage ='es-ES';

  int _popularesPage = 0;

  List<Pelicula> _populares =new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast(); //con el broad se puese usar de muchos lugares.


  Function(List<Pelicula>) get polularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams(){
    _popularesStreamController?.close(); //si tiene el metodo close, se llama
  }

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

    _popularesPage++;

     final url =Uri.https(_url, '3/movie/popular',{
      'api_key'  : _apikey,
      'language' : _lenguage,
      'page'     : _popularesPage.toString()
    });
    
    final resp =  await _procesarRespuesta(url);

    _populares.addAll(resp);

    polularesSink(_populares);

    return resp;


    
  }


}