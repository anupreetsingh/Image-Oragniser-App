import 'package:flutter/material.dart';
import 'package:image_organizer/pages/pick_compress.dart';
// ignore_for_file: prefer_const_constructors
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Compress(),
              ),
            );
          },
          child: Text(
            "PICK IMAGE FROM GALLERY",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
