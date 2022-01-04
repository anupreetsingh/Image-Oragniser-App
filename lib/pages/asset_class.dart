import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
// ignore_for_file: prefer_const_constructors
import 'dart:io';
class AssetPathEntity {
  // The albums' ID
  late String id;
  // The albums name
  late String name;
  // How many assets the album holds
  late int assetCount;
  // The album's type
  late int albumType;
}
class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({Key? key,required this.asset}) : super(key: key);
  final AssetEntity asset;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
            if (asset.type == AssetType.image){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageScreen(imageFile: asset.file),
                ),
              );
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
            ],
          ),
        );
      },
    );
  }
}
class ImageScreen extends StatelessWidget{
  const ImageScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);
  final Future<File?> imageFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: FutureBuilder<File?>(
        future: imageFile,
        builder: (_, snapshot) {
          final file = snapshot.data;
//          print(File(file!.path));
          if (file == null) {
            return Container();
          }
            else {
             String paths= file.path;
             print(paths);
             print("Pulkit");
            return Image.file(file);
          }
        },
      ),
    );
  }
}