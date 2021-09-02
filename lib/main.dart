import 'package:flutter/material.dart';
import 'package:learning_project1/addpost.dart';
import 'package:learning_project1/home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
      '/addpost': (context) => AddPost(),
    },
  ));
}
