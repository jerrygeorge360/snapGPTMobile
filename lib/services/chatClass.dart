import 'dart:typed_data';

import 'constantvalues.dart';
class ChatClass{
  bool sender=true;
  String additionalPrompt;
  DateTime date;
  PicCam picList;
  // Uint8List image;
  ChatClass({required this.additionalPrompt,required this.date,required this.picList});
}

class ResponseClass{
  bool sender=false;
  String message;
  DateTime date;
  ResponseClass({required this.message,required this.date});
}