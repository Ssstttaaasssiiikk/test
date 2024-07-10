part of 'first_page_bloc.dart';

class FirstPageState {}

class FirstPageInitial extends FirstPageState {}

class DataLoaded extends FirstPageState{
  final List<Post> postsList;
  final List<Album> albumList;
  final List<Photo> photoList;

  DataLoaded({
    required this.postsList, 
    required this.albumList, 
    required this.photoList
  });
}