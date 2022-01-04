import 'package:flutter/material.dart';
import 'package:image_organizer/pages/first_page.dart';
import 'package:image_organizer/pages/image_class.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
