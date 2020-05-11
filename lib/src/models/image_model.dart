class Image {
  String fullUrl;
  String string;

  Image({
    this.fullUrl,
    this.string,
  });

  Image.fromJsonMap( Map<String, dynamic> json ) {

    fullUrl       = json['full_url'];
    string        = json['string'];

  }
}
