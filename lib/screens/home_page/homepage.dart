import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_gpt/services/camera.dart';
import 'package:snap_gpt/services/hex_converter.dart';
import '../../services/constantvalues.dart';
import '../../services/cropservice.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: convert_hex('#D7DFD5'),
      elevation: 0,
      leading: const Icon(Icons.menu_outlined,color: Colors.black,),
      title: const Text('SnapGPT'),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Lato',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ),
    ),

    body: Center(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              width: 182,
              height: 182,
              decoration: BoxDecoration(
                border: Border.all(color: convert_hex('#B4B1B1')),
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage('assets/images/welcomescreen.png'),fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 19,),
            Container(
              width: 391,
                height: 72,
                child: Text(textAlign: TextAlign.center,'Welcome to SnapGPT! Share your snapshots, and let us unravel the stories behind your pictures together',style: TextStyle(height: 1,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  wordSpacing: 9


                ),)),
            SizedBox(height: 81,),
            Container(
              padding: EdgeInsets.all(12),
              decoration:  BoxDecoration(
                border:Border.all(color: convert_hex('#434343')),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text('How can I assist you today?',style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                fontSize: 24
              ),),
            ),
SizedBox(height: 15,),
            const Camera()

          ],
        ),
      ),
    ),
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final _controller=CropController();
  Uint8List?_myData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
          var data=await pickCamera();
          BuildContext? localContext = context;
          setState(() {
            _myData=data;
          });


          if(_myData != null && localContext != null){

            Navigator.of(localContext).push(MaterialPageRoute(builder: (context){
              return CropMe(picList: PicCam(_myData!),);
            }));



          }

      },
      child: Container(
        width: 92,
        height: 92,
        decoration: BoxDecoration(
            border: Border.all(width: 2,color: convert_hex('#363636')),
            borderRadius: BorderRadius.circular(100),
            color: convert_hex('#D7DFD5')
        ),
        child: Icon(Icons.camera_enhance_rounded,size: 59,color: Colors.black.withOpacity(0.6),),
      ),
    );
  }
}
