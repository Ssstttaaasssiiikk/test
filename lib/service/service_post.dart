import 'dart:convert';
import 'package:http/http.dart';
import 'package:testovoe/entity/post.dart';

class PostService {
  Future<List<Post>> getAllPosts() async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final url = Uri.parse(apiUrl);
      final response = await get(url);
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map((data) => Post.fromJson(data)).toList();
      } else {
        throw Exception('Посты не загрузились');
      }
    } catch (e) {
      print('Код говна, прогер даун. Ошибка: $e');
      return [];
    }
  }
}
