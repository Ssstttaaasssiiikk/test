import 'dart:convert';
import 'package:http/http.dart';
import 'package:testovoe/entity/comments.dart';

class CommentService{
  Future<List<Comment>> getComments(postId) async {
    String apiUrl = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    try{
      final url = Uri.parse(apiUrl);
      final response = await get(url);
      if(response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map((data) => Comment.fromJson(data)).toList();
      } else {
        throw Exception('Коммент не загрузился');
      }
    } catch (e) {
      print('Код говна, прогер даун. Ошибка: $e');
      return [];
    }
  }
}