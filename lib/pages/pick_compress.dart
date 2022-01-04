import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

// ignore_for_file: prefer_const_constructors

class Compress extends StatefulWidget {
  const Compress({Key? key}) : super(key: key);

  @override
  _CompressState createState() => _CompressState();
}

class _CompressState extends State<Compress> {
  File? fileImage;
  File? image;
  final picker = ImagePicker();

  Future<File> compressFile(File file) async {
    final filePath = file.absolute.path;
    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, outPath,
      quality: 70,
    );
    print(file.lengthSync());
    print(result!.lengthSync());
    return result;
  }
  pickImage() async {

      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      final size = temp.lengthSync() / 1024;
//      print("Before $size");
      File Compressed=await compressFile(temp);
    String path = Compressed.path;
    _saveNetworkImage(path);
    final sizeinkb=Compressed.lengthSync()/1024;
      print("After $sizeinkb");
 print(Compressed.absolute.path);
      setState(() {
        this.image = temp;
        fileImage=Compressed;
      });
  }
  void _saveNetworkImage(String paths) async {
    GallerySaver.saveImage(paths).then((bool? success) {
      setState(() {
        print('Image is saved');
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image has been saved. Check in your gallery")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            fileImage!=null?
            Center(
              child: Image.file(
                fileImage!,
              ),
            )
                :Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Text("Pick Image First")
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async{
          pickImage();
        },
        child: Text(
          "+",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/*
File? image;
  final picker=ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image!=null?
            Container(
              child: Image.file(
                image!,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
                :Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Text("Pick Image First")
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async{
          pickImage();
        },
        child: Text(
          "+",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Future pickImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        this.image = temp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
*/