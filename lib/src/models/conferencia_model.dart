import 'package:paracelsos/src/models/image_model.dart';

class Conferencias {

  List<Conferencia> items = new List();

  Conferencias();

  Conferencias.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final conferencia = new Conferencia.fromJsonMap(item);
      items.add( conferencia );
    }

  }

}

class Conferencia {
  String status;
  String conferencia;
  String alias;
  String descripcion;
  String video;
  Image imagen;

  Conferencia({
    this.status,
    this.conferencia,
    this.alias,
    this.descripcion,
    this.imagen,
    this.video
  });

  Conferencia.fromJsonMap( Map<String, dynamic> json ) {

    status        = json['status'];
    alias         = json['alias'];
    conferencia   = json['conferencia'];
    descripcion   = json['descripcion'];
    video         = json['video_app'];
    imagen        = Image.fromJsonMap(json['imagen']['data']);

  }
}
