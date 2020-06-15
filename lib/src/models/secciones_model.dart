class Secciones {
  Seccion data;

  Secciones({this.data});

  Secciones.fromJson(Map<String, dynamic> json) {
    data = json != null ? new Seccion.fromJson(json) : null;
  }

}

class Seccion {
  int       id;
  String    status;
  Null      sort;
  int       owner;
  String    createdOn;
  int       modifiedBy;
  String    modifiedOn;
  String    seccion;
  String    contenido;

  Seccion(
      {this.id,
      this.status,
      this.sort,
      this.owner,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.seccion,
      this.contenido});

  Seccion.fromJson(Map<String, dynamic> json) {
    id              = json['id'];
    status          = json['status'];
    sort            = json['sort'];
    owner           = json['owner'];
    createdOn       = json['created_on'];
    modifiedBy      = json['modified_by'];
    modifiedOn      = json['modified_on'];
    seccion         = json['seccion'];
    contenido       = json['contenido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']            = this.id;
    data['status']        = this.status;
    data['sort']          = this.sort;
    data['owner']         = this.owner;
    data['created_on']    = this.createdOn;
    data['modified_by']   = this.modifiedBy;
    data['modified_on']   = this.modifiedOn;
    data['seccion']       = this.seccion;
    data['contenido']     = this.contenido;
    return data;
  }
}