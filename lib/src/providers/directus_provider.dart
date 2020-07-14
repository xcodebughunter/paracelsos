
import 'package:http/http.dart' as http;
import 'package:paracelos/src/models/asesoria_model.dart';

import 'dart:convert';

import 'package:paracelos/src/models/banner_model.dart';
import 'package:paracelos/src/models/conferencia_model.dart';
import 'package:paracelos/src/models/dispositivo_model.dart';
import 'package:paracelos/src/models/noticia_model.dart';
import 'package:paracelos/src/models/secciones_model.dart';
import 'package:paracelos/src/models/suplemento_model.dart';

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
      'sort': '-fecha',
      'filter[fecha][lte]': new DateTime.now().toString()
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final noticias = new Noticias.fromJsonList(decodedData['data']);

    _cargandoNoticia = false;
    return noticias.items;
  }


  bool _cargandoAutoria     = false;
  Future<Seccion> obtenerAutoria() async {

    if ( _cargandoAutoria ) return null;

    _cargandoAutoria = true;

    final url = Uri.https(_url, 'paracelsos/items/secciones/3', {
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final seccion = new Secciones.fromJson(decodedData['data']);

    _cargandoAutoria = false;
    return seccion.data;
  }


  bool _cargandoTerminos     = false;
  Future<Seccion> obtenerTerminos() async {

    if ( _cargandoTerminos ) return null;

    _cargandoTerminos = true;

    final url = Uri.https(_url, 'paracelsos/items/secciones/2', {
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final seccion = new Secciones.fromJson(decodedData['data']);

    _cargandoTerminos = false;
    return seccion.data;
  }


  bool _cargandoPoliticas     = false;
  Future<Seccion> obtenerPoliticas() async {

    if ( _cargandoPoliticas ) return null;

    _cargandoPoliticas = true;

    final url = Uri.https(_url, 'paracelsos/items/secciones/1', {
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final seccion = new Secciones.fromJson(decodedData['data']);

    _cargandoPoliticas = false;
    return seccion.data;
  }


  bool _cargandoNosotros = false;
  Future<Seccion> obtenerNosotros() async {

    if ( _cargandoNosotros ) return null;

    _cargandoNosotros = true;

    final url = Uri.https(_url, 'paracelsos/items/secciones/4', {
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final seccion = new Secciones.fromJson(decodedData['data']);

    _cargandoNosotros = false;
    return seccion.data;
  }

  bool _cargandoNoticias     = false;
  Future<List<Noticia>> obtenerNoticias() async {

    if ( _cargandoNoticias ) return [];

    _cargandoNoticias = true;

    final url = Uri.https(_url, 'paracelsos/items/noticias', {
      'fields'  : 'status,titulo,contenido,imagen.data,alias,fecha',
      'sort': '-fecha',
      'filter[fecha][lte]': new DateTime.now().toString()
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final noticias = new Noticias.fromJsonList(decodedData['data']);

    _cargandoNoticias = false;
    return noticias.items;
  }

  bool _cargandoNoticiaDetalle     = false;
  Future<Noticia> obtenerNoticiaDetalle(String alias) async {

    if ( _cargandoNoticiaDetalle ) return null;

    _cargandoNoticiaDetalle = true;

    final url = Uri.https(_url, 'paracelsos/items/noticias', {
      'fields'  : 'status,titulo,contenido,imagen.data,alias,fecha',
      'filter[alias][eq]': alias
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final noticias = new Noticia.fromJsonMap(decodedData['data'][0]);

    _cargandoNoticiaDetalle = false;
    return noticias;
  }

  bool _cargandoAsistencia     = false;
  Future<Asesoria> obtenerAsistenciaDetalle() async {

    if ( _cargandoAsistencia ) return null;

    _cargandoAsistencia = true;

    final url = Uri.https(_url, 'paracelsos/items/asesorias/1', {
      'fields'  : 'status,asesoria,descripcion,tag,imagen.data,alias',
      // 'filter[alias][eq]': alias
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final asesoria = new Asesoria.fromJsonMap(decodedData['data']);

    _cargandoAsistencia = false;
    return asesoria;
  }


  bool _cargandoConferencias     = false;
  Future<List<Conferencia>> obtenerConferencias() async {

    if ( _cargandoConferencias ) return [];

    _cargandoConferencias = true;

    final url = Uri.https(_url, 'paracelsos/items/conferencias', {
      'fields'  : 'status,conferencia,descripcion,tag,imagen.data,alias,video'
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final conferencias = new Conferencias.fromJsonList(decodedData['data']);

    _cargandoConferencias = false;
    return conferencias.items;
  }

  bool _cargandoConferenciaDetalle     = false;
  Future<Conferencia> obtenerConferenciaDetalle(String alias) async {

    if ( _cargandoConferenciaDetalle ) return null;

    _cargandoConferenciaDetalle = true;

    final url = Uri.https(_url, 'paracelsos/items/conferencias', {
      'fields'  : 'status,conferencia,descripcion,tag,imagen.data,alias,video_app',
      'filter[alias][eq]': alias
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final conferencia = new Conferencia.fromJsonMap(decodedData['data'][0]);

    _cargandoConferenciaDetalle = false;
    return conferencia;
  }


  bool _cargandoDispositivos     = false;
  Future<List<Dispositivo>> obtenerDispositivos() async {

    if ( _cargandoDispositivos ) return [];

    _cargandoDispositivos = true;

    final url = Uri.https(_url, 'paracelsos/items/dispositivos_medicos', {
      'fields'  : 'status,dispositivo,descripcion,tag,imagen.data,alias'
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final dispositivos = new Dispositivos.fromJsonList(decodedData['data']);

    _cargandoDispositivos = false;
    return dispositivos.items;
  }

  bool _cargandoDispositivoDetalle     = false;
  Future<Dispositivo> obtenerDispositivoDetalle(String alias) async {

    if ( _cargandoDispositivoDetalle ) return null;

    _cargandoDispositivoDetalle = true;

    final url = Uri.https(_url, 'paracelsos/items/dispositivos_medicos', {
      'fields'  : 'status,dispositivo,descripcion,tag,imagen.data,alias',
      'filter[alias][eq]': alias
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final dispositivo = new Dispositivo.fromJsonMap(decodedData['data'][0]);

    _cargandoDispositivoDetalle = false;
    return dispositivo;
  }


  bool _cargandoSuplementos     = false;
  Future<List<Suplemento>> obtenerSuplementos() async {

    if ( _cargandoSuplementos ) return [];

    _cargandoSuplementos = true;

    final url = Uri.https(_url, 'paracelsos/items/suplementos_nutricionales', {
      'fields'  : 'status,suplemento,descripcion,tag,imagen.data,alias'
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final suplementos = new Suplementos.fromJsonList(decodedData['data']);

    _cargandoSuplementos = false;
    return suplementos.items;
  }

  bool _cargandoSuplementoDetalle     = false;
  Future<Suplemento> obtenerSuplementoDetalle(String alias) async {

    if ( _cargandoSuplementoDetalle ) return null;

    _cargandoSuplementoDetalle = true;

    final url = Uri.https(_url, 'paracelsos/items/suplementos_nutricionales', {
      'fields'  : 'status,suplemento,descripcion,tag,imagen.data,alias',
      'filter[alias][eq]': alias
    });

    final resp = await http.get( url, headers: { 'Content-Type': 'application/json', 'charset': 'utf-8' } );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    
    final suplemento = new Suplemento.fromJsonMap(decodedData['data'][0]);

    _cargandoSuplementoDetalle = false;
    return suplemento;
  }
}