part of 'second_page_bloc.dart';

class SecondPageState extends Equatable {
  const SecondPageState();

  @override
  List<Object> get props => [];
}

class SecondPageInitial extends SecondPageState {}

class SecondPageLoading extends SecondPageState {}

class CommentsLoaded extends SecondPageState {
  final List<Comment> commentsList;

  const CommentsLoaded({
    required this.commentsList, 
  });
}

