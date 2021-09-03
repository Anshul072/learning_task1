import 'package:flutter/material.dart';
import 'post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function delete;
  final Function edit;
  final num index;
  PostCard({required this.post,required this.delete,required this.index,required this.edit});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
            child: Text(
              post.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
            child: Text(
                post.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.network(post.imgUrl,height: 250.0),
          SizedBox(height: 10.0,),
          ButtonBar(
           alignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {edit();},
                  icon: Icon(Icons.edit),
                  label:Text(
                      'edit post',
                  )
              ),
              SizedBox(width: 10.0),
              TextButton.icon(
                  onPressed: (){delete();},
                  icon: Icon(Icons.delete),
                  label:Text('delete post')
              ),
            ],
          ),
        ],
      ),
    );
  }
}
