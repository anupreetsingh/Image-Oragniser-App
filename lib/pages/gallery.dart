import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_organizer/pages/asset_class.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tflite/tflite.dart';
class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<AssetEntity> assets = [];
  List _recognitions=[];
  List<File> _image=[] ;

  bool _busy=true;
  double _imageWidth=100, _imageHeight=100;
  @override
  void initState() {
    _fetchAssets();
    super.initState();
    _busy = true;
    loadTfModel().then((val) {
      {
        setState(() {
          _busy = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 4
    ),
    itemCount: assets.length,
    itemBuilder: (_,index){
      return AssetThumbnail(asset: assets[index],

      );
    }
    ),
    );
  }

  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
  }

   detection(File image) async
  {
    String s="";
      await  detection(image);
    _recognitions.map((e) {
      s+="${e["detectedClass"]} ${(e["confidenceInClass"] * 100).toStringAsFixed(0)}%" ;
      print("${e["detectedClass"]} ${(e["confidenceInClass"] * 100).toStringAsFixed(0)}%");


    });
    return s;

  }
  detectObject(File image) async {
    print('shiva detect start');
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path,
        // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4,
        // defaults to 0.1
        numResultsPerClass: 10,
        // defaults to 5
        asynch: true // defaults to true
    );
    print('shiva model loads');
    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageWidth = info.image.width.toDouble();
        _imageHeight = info.image.height.toDouble();
      });
    })));
    print('shiva 2');
    setState(() {
      print('shiva3');
      _recognitions = recognitions!;
      print('shiva4');
    });
  }
  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;
    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );
    // Update the state and notify UI
    setState(() {
      assets = recentAssets;
      forAll(assets);
    });
  }
  forAll(List<AssetEntity> assets_list ) async
  { print('shiva, ${assets_list.length}');
    assets_list.forEach((e)  async {
      print('gg');
      if(e.type==AssetType.image)
        {

        File? file=await e.file;
         print(  await detection(file!));

        }

    });
    print('gupta');
  }

}

