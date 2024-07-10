import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/entity/comments.dart';
import 'package:testovoe/service/service_comment.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'second_page_event.dart';
part 'second_page_state.dart';

class SecondPageBloc extends Bloc<SecondPageEvent, SecondPageState> {
  SecondPageBloc() : super(SecondPageInitial()) {
    on<GetComments>(_onGetComments);
  }

  Future<void> _onGetComments(GetComments event, Emitter<SecondPageState> emit) async {

    final comments = await _getCommentsFromCache(event.postId) ?? await _fetchCommentsFromApi(event.postId);
    emit(CommentsLoaded(commentsList: comments));
  }

  Future<List<Comment>?> _getCommentsFromCache(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedComments = prefs.getStringList('comments_$postId');
    if (cachedComments != null) {
      return cachedComments.map((e) => Comment.fromJson(jsonDecode(e) as Map<String, dynamic>)).toList();
    }
    return null;
  }

  Future<void> _saveCommentsToCache(int postId, List<Comment> comments) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedComments = comments.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('comments_$postId', cachedComments);
  }

  Future<List<Comment>> _fetchCommentsFromApi(int postId) async {
    final commentService = CommentService();
    final comments = await commentService.getComments(postId);
    await _saveCommentsToCache(postId, comments);
    return comments;
  }
}
