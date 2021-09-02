import 'package:flutter/material.dart';
import 'package:learning_project1/post.dart';
import 'post_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Post> posts =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [ Column(children: [
            Column(
              children: posts
                  .map((post) => PostCard(
                        post: post,
                        delete: (){
                          setState(() {
                            posts.remove(post);
                          });
                        },
                        index: posts.indexOf(post),
                        edit: () async {
                          dynamic result= await Navigator.pushNamed(context, '/addpost');
                          setState(() {
                            posts[posts.indexOf(post)]=
                                Post(title: result['title'], description: result['description'],imgUrl: result['imgUrl'],);
                          });
                        },
                      ))
                  .toList(),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result= await Navigator.pushNamed(context, '/addpost');
                      setState(() {
                        posts.add(
                          Post(title: result['title'], description: result['description'],imgUrl: result['imgUrl'],)
                          );
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text('add a new post')),
              ],
            )
          ]),
          ],
        ),
      ),
    );
  }
}
