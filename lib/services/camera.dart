import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> pickImage() async{
  try{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemporary = File(image.path);

    return imageTemporary;
  }
  on PlatformException catch(e){
    print('Failed to pick image: $e');
  }

}

Future<dynamic> pickCamera() async{
  try{
    final image=await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;
    final imageTemporary = File(image.path);

    return imageTemporary;
  }
  on PlatformException catch(e){
    print('Failed to pick image: $e');
  }

}
