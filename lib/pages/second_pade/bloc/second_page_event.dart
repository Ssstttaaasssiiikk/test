part of 'second_page_bloc.dart';

class SecondPageEvent extends Equatable {
  const SecondPageEvent();

  @override
  List<Object> get props => [];
}

class GetComments extends SecondPageEvent {
  final int postId;

  const GetComments({required this.postId});

  @override
  List<Object> get props => [postId];
}