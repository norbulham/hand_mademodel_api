class WallpaperModel{
  String imgURL;
  String photographar;
  String avaColor;
  String alt;

  WallpaperModel({
   required this.imgURL,
   required this.photographar,
   required this.avaColor,
   required this.alt,

 });
  
  factory WallpaperModel.fromMap(Map<String, dynamic>map) {
    return WallpaperModel(
        imgURL: map["src"]["portrait"],
        photographar: map["photographer"],
      avaColor: map["avg_color"],
      alt: map["alt"],
    );
  }
}