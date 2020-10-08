import 'package:paracelsos/src/models/image_model.dart';

class Banners {

  List<BannerPpal> items = new List();

  Banners();

  Banners.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final banner = new BannerPpal.fromJsonMap(item);
      items.add( banner );
    }

  }

}

class BannerPpal {
  String status;
  String titulo;
  String descripcion;
  Image imagen;

  BannerPpal({
    this.status,
    this.titulo,
    this.descripcion,
    this.imagen,
  });

  BannerPpal.fromJsonMap( Map<String, dynamic> json ) {

    status        = json['status'];
    titulo        = json['titulo'];
    descripcion   = json['descripcion'];
    imagen        = Image.fromJsonMap(json['imagen']['data']);

  }
}