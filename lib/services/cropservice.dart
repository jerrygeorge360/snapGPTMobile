import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

import '../screens/picture_page/components.dart';
import 'constantvalues.dart';

class CropMe extends StatefulWidget {
  final PicCam picList;
  const CropMe({super.key,required this.picList});

  @override
  State<CropMe> createState() => _CropMeState();
}

class _CropMeState extends State<CropMe> {
  final _controller = CropController();
  late PicCam _picList;
  late Uint8List _myImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picList=widget.picList;
    _myImage=_picList.uint8ListImage;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width:MediaQuery.of(context).size.width,
                height: 400,
                child: Crop(


                    image: _myImage,
                    controller: _controller,
                    onCropped: (image) {
                      print('yes completed');
                      setState(() {
                        _myImage=image;
                      });
                      // do something with image data


                    }
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
              _controller.crop();
            }, child: const Text('preview')),
            ElevatedButton(onPressed: (){
              if(_myImage!=null){

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PicProcessing(picList: PicCam(_myImage!),);
                }));
              }

            }, child: const Text('done')),
          ],
        )

    );
  }
}
