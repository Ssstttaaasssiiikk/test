import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/navigation/main_navigation.dart';
import 'package:testovoe/pages/first_page/bloc/first_page_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _firstPageBloc = FirstPageBloc();

  @override
  void initState() {
    _firstPageBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Посты')),
      body: BlocBuilder<FirstPageBloc, FirstPageState>(
        bloc: _firstPageBloc,
        builder: (context, state) {
          if (state is DataLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  final post = state.postsList[i];
                  final album = state.albumList[i];
                  final albumId = album.id;
                  final photo = state.photoList.firstWhere((photo) => photo.albumId == albumId);
                  return PostWidget(
                    title: post.title, 
                    image: photo.url,
                    description: post.body,
                    postId: post.id,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.postsList.length,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final int postId;

  const PostWidget({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.secondPage,
          arguments: [postId, title, image, description],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(title),
              Image.network(image),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
