import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/pages/second_pade/bloc/second_page_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _secondPageBloc = SecondPageBloc();

  late final int postId;
  late final String title;
  late final String image;
  late final String description;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as List;
    postId = args[0] as int;
    title = args[1] as String;
    image = args[2] as String;
    description = args[3] as String;
    _secondPageBloc.add(GetComments(postId: postId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondPageBloc, SecondPageState>(
      bloc: _secondPageBloc,
      builder: (context, state) {
        if (state is CommentsLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text('Пост номер $postId')),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Image.network(image),
                    Text(description),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        final comment = state.commentsList[i];
                        return CommentWidget(name: comment.name, commentBody: comment.body);
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.commentsList.length,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String name;
  final String commentBody;

  const CommentWidget({super.key, required this.name, required this.commentBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Text(commentBody),
          ],
        ),
      ),
    );
  }
}
