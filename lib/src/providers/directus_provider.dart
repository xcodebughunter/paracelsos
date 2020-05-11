
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:paracelos/src/models/banner_model.dart';
import 'package:paracelos/src/models/noticia_model.dart';

class DirectusProvider {
  
  String _url = 'admin.paracelsos.com';


  bool _cargandoBanner     = false;
  Future<List<BannerPpal>> obtenerBanners() async {

    if ( _cargandoBanner ) return [];

    _cargandoBanner = true;

    final url = Uri.https(_url, 'paracelsos/items/banner', {
      'fields'  : 'status,titulo,descripcion,imagen.data'
    });

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    
    final banners = new Banners.fromJsonList(decodedData['data']);

    _cargandoBanner = false;

    return banners.items;

  }


  bool _cargandoNoticia     = false;
  Future<List<Noticia>> obtenerUltimaNoticia() async {

    if ( _cargandoNoticia ) return [];

    _cargandoNoticia = true;

    final url = Uri.https(_url, 'paracelsos/items/noticias', {
      'fields'  : 'status,titulo,contenido,imagen.data,alias,fecha',
      'limit': '1',
      'sort': 'fecha',
      'filter[fecha][lte]': new DateTime.now().toString()
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final noticias = new Noticias.fromJsonList(decodedData['data']);

    _cargandoNoticia = false;
    return noticias.items;

  }
}