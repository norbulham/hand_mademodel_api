import 'dart:convert';

import 'package:hand_mademodel_api/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class WallpaperService{
  final _baseUrl = "https://api.pexels.com/v1/";
  final _key ="Dai0suHZjyVGDG2X3xQ3qyCoqIP4oP8udRDLxsos9NnGUL3tWzrfPJlJ";

  Future<List<WallpaperModel>> fetchWallpaperData(String category) async {
    try{
      final url = "${_baseUrl}search?query=${category}&per_page=21";
      final response = await http.get(
          Uri.parse(url),
          headers: {
            "Authorization": _key,
          }
      );
      final allData = jsonDecode(response.body);
      final List data = allData["photos"];
      return data.map((photo) => WallpaperModel.fromMap(photo)).toList();
    }catch(e){
      print(e);
      return [];
    }
  }
  Future<void> openUrl(String imgUrl) async {
    final Uri _url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}
class SearchService {
  Future<List<WallpaperModel>> fetchWallpapersByQuery(String query) async {
    return await WallpaperService().fetchWallpaperData(query);
  }}
