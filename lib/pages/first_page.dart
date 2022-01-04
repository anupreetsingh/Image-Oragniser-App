import 'package:flutter/material.dart';
import 'package:image_organizer/main.dart';
import 'package:image_organizer/pages/Flower.dart';
import 'package:image_organizer/pages/image_class.dart';
import 'package:image_organizer/pages/static.dart';

import '../face.dart';
// ignore_for_file: prefer_const_constructors

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("ABC")
        ),
      ),
      body: Stack(
        children: [
        GridView.count(
          physics: ScrollPhysics(),
            crossAxisCount: 2,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StaticImage(),
                          ),
                        );
                      },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Object Detection",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
                          ),
                        ),

                    ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Face Recognition",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
                    ),
                  ),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Caption Generator",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
                    ),
                  ),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlowerApp(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Flower Detection",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,)

                    ),
                  ),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orangeAccent
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Imageorganizer(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Image Compression",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
                    ),
                  ),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.green
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }
}
