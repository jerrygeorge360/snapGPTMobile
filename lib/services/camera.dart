import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert' as convert;

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

    return imageTemporary.readAsBytes();
  }
  on PlatformException catch(e){
    print('Failed to pick image: $e');
  }

}

Future<Map<String,dynamic>> sendImageData(String route,Map<String,dynamic>data)async{
  try{
    Map<String,dynamic> requestData=data;
    var request=await post(Uri.parse(route),body: requestData,);
    if(request.statusCode==200){
      Map<String,dynamic> requestDecoded=convert.jsonDecode(request.body) as Map<String,dynamic>;
      return requestDecoded;
    }
    else{
      throw Exception('failed to send request. Status cod: ${request.body}');
    }
  }
  catch(e){
    print('Error');
    rethrow;
  }

}
