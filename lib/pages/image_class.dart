import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'gallery.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
class Imageorganizer extends StatefulWidget {
  const Imageorganizer({Key? key}) : super(key: key);

  @override
  _ImageorganizerState createState() => _ImageorganizerState();
}

class _ImageorganizerState extends State<Imageorganizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Image Organizer")
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()async{
    final permitted = await PhotoManager.requestPermission();
    if (!permitted) return;
     Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => Gallery()),
   );
    },
      ),
    );
  }
}
