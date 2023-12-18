import 'package:flutter/material.dart';
Color convert_hex(String hex){
  String hexColor=hex;
  Color color =Color(int.parse(hexColor.substring(1,7),radix:16 )+0xFF000000);
  return color;
}