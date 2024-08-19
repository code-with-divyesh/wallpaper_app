// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photosmodel {
  String imagsrc;
  String photographername;
  Photosmodel({
    required this.imagsrc,
    required this.photographername,
  });

  static Photosmodel fromApi2App(Map<String, dynamic> photomap) {
    return Photosmodel(
        imagsrc: (photomap["src"])["portrait"],
        photographername: photomap["photographer"]);
  }
}
