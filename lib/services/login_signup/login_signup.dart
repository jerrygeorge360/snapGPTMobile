import 'package:http/http.dart';
import 'dart:convert' as convert;

 dynamic validateForm(value){
    if (value == null || value.isEmpty) {
      return 'Please enter a value.';
    }
    // Additional validation checks can be added here.
    return null; // Return null if the input is valid.
  }

Future<Map<String,dynamic>> sendFormData(String route,Map<String,dynamic>data) async {
  try{
    Map<String,dynamic> requestData=data;
    var request=await post(Uri.parse(route),body: requestData);
    if(request.statusCode==200||request.statusCode==301){
      Map<String,dynamic> requestDecoded=convert.jsonDecode(request.body) as Map<String,dynamic>;
      return requestDecoded;
    }
    else{
      throw Exception('Failed to send request. Status code: ${request.statusCode}');
    }

  }
  catch(e){
    print('Error: $e');
    rethrow;
  }



}



