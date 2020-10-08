import 'package:paracelsos/src/models/image_model.dart';

class Dispositivos {

  List<Dispositivo> items = new List();

  Dispositivos();

  Dispositivos.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final dispositivo = new Dispositivo.fromJsonMap(item);
      items.add( dispositivo );
    }

  }

}

class Dispositivo {
  String status;
  String dispositivo;
  String alias;
  String descripcion;
  Image imagen;

  Dispositivo({
    this.status,
    this.dispositivo,
    this.alias,
    this.descripcion,
    this.imagen,
  });

  Dispositivo.fromJsonMap( Map<String, dynamic> json ) {

    status        = json['status'];
    alias         = json['alias'];
    dispositivo   = json['dispositivo'];
    descripcion   = json['descripcion'];
    imagen        = Image.fromJsonMap(json['imagen']['data']);

  }
}
