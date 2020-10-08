import 'package:paracelsos/src/models/image_model.dart';

class Asesorias {

  List<Asesoria> items = new List();

  Asesorias();

  Asesorias.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final asesoria = new Asesoria.fromJsonMap(item);
      items.add( asesoria );
    }

  }

}

class Asesoria {
  String  status;
  String  asesoria;
  String  descripcion;
  String  alias;
  Image   imagen;

  Asesoria({
    this.status,
    this.asesoria,
    this.alias,
    this.descripcion,
    this.imagen,
  });

  Asesoria.fromJsonMap( Map<String, dynamic> json ) {

    status        = json['status'];
    alias         = json['alias'];
    asesoria      = json['asesoria'];
    descripcion   = json['descripcion'];
    imagen        = Image.fromJsonMap(json['imagen']['data']);

  }
}
