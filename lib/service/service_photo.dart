import 'dart:convert';
import 'package:http/http.dart';
import 'package:testovoe/entity/photo.dart';

class PhotoService{
  Future<List<Photo>> getAllPhotos() async{
    const String apiUrl = 'https://jsonplaceholder.typicode.com/photos';
    try{
      final url = Uri.parse(apiUrl);
      final response = await get(url);
      if(response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map((data) => Photo.fromJson(data)).toList();
      } else {
        throw Exception('фото не загрузятся');
      }
    } catch (e) {
      print('Код говна, прогер даун. Ошибка: $e');
      return [];
    }
  }
}