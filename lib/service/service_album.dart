import 'dart:convert';
import 'package:http/http.dart';
import 'package:testovoe/entity/album.dart';

class AlbumService{
  Future<List<Album>> getAllAlbums() async{
    const String apiUrl = 'https://jsonplaceholder.typicode.com/albums';
    try{
      final url = Uri.parse(apiUrl);
      final response = await get(url);
      if(response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map((data) => Album.fromJson(data)).toList();
      } else {
        throw Exception('Альбом не загрузился');
      }
    } catch (e) {
      print('Код говна, прогер даун. Ошибка: $e');
      return [];
    }
  }
}