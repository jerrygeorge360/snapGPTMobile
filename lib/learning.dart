import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_gpt/screens/picture_page/components.dart';
import 'package:snap_gpt/services/camera.dart';
import 'dart:io';

import 'package:snap_gpt/services/constantvalues.dart';
class LearningImagePicker extends StatefulWidget {
  const LearningImagePicker({super.key});

  @override
  State<LearningImagePicker> createState() => _LearningImagePickerState();
}

class _LearningImagePickerState extends State<LearningImagePicker> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: [
       ElevatedButton(onPressed: ()async{
         final pickedImage=await pickImage();
        setState((){
          image=pickedImage;
          print(image);
        });

       }, child: Text('pick image')),

       ElevatedButton(onPressed: ()async{
         final pickedCamera=await pickCamera();
         setState(() {
           image=pickedCamera;
         });

   }, child: Text('camera')
       ),
        image!=null?Image.file(image!,width: 160,height: 160,fit: BoxFit.cover,):Text('please select image')

      ],
     ),
    );
  }
}

// class CropMe extends StatefulWidget {
//   const CropMe({super.key});
//
//   @override
//   State<CropMe> createState() => _CropMeState();
// }
//
// class _CropMeState extends State<CropMe> {
//   final _controller = CropController();
//   Uint8List? _myData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//           _myData!=null?
//
//           Center(
//             child: SizedBox(
//               width:MediaQuery.of(context).size.width,
//               height: 400,
//               child: Crop(
//
//
//                   image: _myData!,
//                   controller: _controller,
//                   onCropped: (image) {
//                     print('yes completed');
//                     setState(() {
//                       _myData=image;
//                     });
//                     // do something with image data
//
//
//                   }
//               ),
//             ),
//           ):Text('my data empty'),
//
//           ElevatedButton(onPressed: ()async{
//             var data=await pickCamera();
//             setState(() {
//               _myData=data;
//             });
//           }, child: Text('snap me')),
//           ElevatedButton(onPressed: (){
//             _controller.crop();
//           }, child: Text('crop me')),
//           ElevatedButton(onPressed: (){
//             if(_myData!=null){
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return PicProcessing(picList: PicCam(_myData!),);
//                 }));
//             }
//
//           }, child: Text('done')),
//         ],
//       )
//
//     );
//   }
// }

class ImageProcess extends StatelessWidget {
  final PicCam data;
  const ImageProcess({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 600,
                child: Image.memory(data.uint8ListImage),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width-200,
              height: 70,
              child: TextFormField(

              ),
            ),
              ElevatedButton(onPressed: (){

              }, child: const Icon(Icons.send))
            ],
          ),

        ],
      ),
    );
  }
}

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future<Uint8List> pickImageAndConvertToBytes() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//   if (pickedFile != null) {
//     List<int> imageBytes = await pickedFile.readAsBytes();
//     Uint8List uint8List = Uint8List.fromList(imageBytes);
//     return uint8List;
//   } else {
//     throw Exception('Failed to pick an image');
//   }
// }
//
// // Example usage:
// void main() async {
//   try {
//     Uint8List imageBytes = await pickImageAndConvertToBytes();
//     print('Image Bytes Length: ${imageBytes.length}');
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// import 'package:snap_gpt/services/hex_converter.dart';
//
// class Weka extends StatefulWidget {
//   @override
//   State<Weka> createState() => _WekaState();
// }
//
// class _WekaState extends State<Weka> with SingleTickerProviderStateMixin {
//   bool _isTrue=false;
//   late AnimationController _controller;
//   late Animation _colorTween;
//   late Animation _textTween;
//   late Animation _widthTween;
//   late Animation _color1Tween;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller=AnimationController(vsync: this,duration: const Duration(seconds:2));
//     _colorTween=ColorTween(begin: convert_hex('#A5D1C6'),end: Colors.grey).animate(_controller);
//     _textTween=IntTween(begin:16,end: 20 ).animate(_controller);
//     _widthTween=IntTween(begin:377 ,end:480 ).animate(_controller);
//     _color1Tween=ColorTween(begin: Colors.white,end: Colors.blueAccent).animate(_controller);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (BuildContext context, Widget? _) {
//           return Container(
//           width: _widthTween.value.toDouble(),
//           height: 61,
//           margin: EdgeInsets.all(53),
//           decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           // color: convert_hex('#A5D1C6'),
//             color: _colorTween.value
//           ),
//
//           child: Row(
//           children: [
//           Draggable(
//             // onDragUpdate: (a)=>{
//             //   setState((){})
//             // },
//           onDragStarted: ()=>_controller.repeat(),
//           onDragEnd: (d)=>{
//             _controller.reverse(),
//             // _controller.stop(),
//
//
//           },
//
//           onDragCompleted: (){
//           print('completed');
//           },
//
//           data: true,
//           axis: Axis.horizontal,
//           feedback:
//           Container(width: 55,height:55,decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),color: Colors.white
//           ),
//             child:
//           Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
//           child:
//           Container(width: 55,height: 55,decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),color: Colors.white
//           ),child:Icon(Icons.arrow_forward_ios_rounded,color: _colorTween.value,) ,),
//           onDraggableCanceled: (velocity,offset){
//           // print(velocity);
//           // print(offset);
//           },
//           ),
//
//
//           SizedBox(width: 50,),
//           Text('Swipe left to get started' ,style: TextStyle(
//
//             fontFamily: 'Lato',
//             fontWeight: FontWeight.w400,
//             fontSize: _textTween.value.toDouble(),
//           ),),
//           SizedBox(width: 30,),
//           DragTarget(
//
//           onAccept: (data) {
//           },
//           onLeave: (boo){
//
//
//           },
//           onWillAccept: (data){
//             Navigator.pushNamed(context, '/login');
//             return true;
//           }
//               ,
//           builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
//           return Container(width: 50,height: 50,);
//           })
//           ],
//           ),
//           );
//         },
//
//       ),
//     );
//   }
// }

//crop library

