import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/entity/album.dart';
import 'package:testovoe/entity/photo.dart';
import 'package:testovoe/entity/post.dart';
import 'package:testovoe/service/service_album.dart';
import 'package:testovoe/service/service_photo.dart';
import 'package:testovoe/service/service_post.dart';

part 'first_page_event.dart';
part 'first_page_state.dart';

class FirstPageBloc extends Bloc<FirstPageEvent, FirstPageState> {
  FirstPageBloc() : super(FirstPageInitial()) {

    final postService = PostService();
    final albumService = AlbumService();
    final photoService = PhotoService();

    on<GetData>((event, emit) async {
      List<Post> postsList = await postService.getAllPosts();
      List<Album> albumList = await albumService.getAllAlbums();
      List<Photo> photoList = await photoService.getAllPhotos();

      emit(
        DataLoaded(
          postsList: postsList, 
          albumList: albumList, 
          photoList: photoList
        )
      );
    });
  }
}
