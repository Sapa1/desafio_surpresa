import 'package:api/api.dart';
import 'package:api/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = List.empty();
  test() async {
    posts = await getPosts();
    print(posts);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('API request'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(posts[index].id.toString()),
                title: Text(posts[index].title ?? ''),
                subtitle: Text(posts[index].body ?? ''),
                trailing: Text(posts[index].userId.toString()),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            test();
          },
        ),
      ),
    );
  }
}
