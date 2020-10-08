import 'package:paracelsos/src/models/image_model.dart';

class Suplementos {

  List<Suplemento> items = new List();

  Suplementos();

  Suplementos.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final suplemento = new Suplemento.fromJsonMap(item);
      items.add( suplemento );
    }

  }

}

class Suplemento {
  String status;
  String suplemento;
  String alias;
  String descripcion;
  Image imagen;

  Suplemento({
    this.status,
    this.suplemento,
    this.alias,
    this.descripcion,
    this.imagen,
  });

  Suplemento.fromJsonMap( Map<String, dynamic> json ) {

    status        = json['status'];
    alias         = json['alias'];
    suplemento    = json['suplemento'];
    descripcion   = json['descripcion'];
    imagen        = Image.fromJsonMap(json['imagen']['data']);

  }
}
