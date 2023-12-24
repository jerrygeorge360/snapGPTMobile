import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:snap_gpt/screens/home_page/typingWid.dart';

import '../../services/camera.dart';
import '../../services/chatClass.dart';
import '../../services/constantvalues.dart';


class ChatScreen extends StatefulWidget {
  final PicCam picList;
  late String additionalPrompt;
  ChatScreen({super.key,required this.picList,required this.additionalPrompt});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  late ChatClass _chat;
  late ResponseClass _ai;
  late PicCam _piclist;
  late String _additionalPrompt;
  final List<dynamic>_chats=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeData();
  }
  Future<void> initializeData() async {
    _piclist=widget.picList;
    _additionalPrompt=widget.additionalPrompt;
    String resultString=base64.encode(_piclist.uint8ListImage);
    _chat=ChatClass(additionalPrompt: _additionalPrompt, date:DateTime.now(), picList: _piclist);
    _chats.add(_chat);
    try{
      Map<String,dynamic>response=await sendImageData('${urll}pic', {'uintList':resultString,'additionalPrompt':_additionalPrompt});

      _ai=ResponseClass(message: response['data'], date: DateTime.now());
      _chats.add(_ai);

    }
    catch(e){
      print(e);

      setState(() {
        _ai=ResponseClass(message: e.toString(), date: DateTime.now());
        _chats.add(_ai);
      });
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(

        children: [

          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {


                return _chats[index].sender?SenderUi(additionalTest: _chats[index].additionalPrompt!,date: _chats[index].date!, picList:_chats[index].picList,):AiUi(response:_chats[index].message! ,date: _chats[index].date!,);
                //   ListTile(
                //   title: Text(_messages[index]),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }


}

class SenderUi extends StatelessWidget {
  final String additionalTest;
  final DateTime date;
  final PicCam picList;
  const SenderUi({super.key,required this.additionalTest,required this.date,required this.picList});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child:FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              // color: Colors.white,
              width: 160,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey)
              ),

              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.memory(picList.uint8ListImage).image,
                        fit: BoxFit.fill
                      ),
                      // border: Border.all(color: Colors.black),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),
                  ),SizedBox(height: 5,),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(4),

                    width: 150,
                      child: Text(additionalTest,style: TextStyle(
                        color: Colors.black54
                      ),))
                ],
              ),
            ),
            Text(date.toString(),style: TextStyle(
                fontSize: 10
            ),)
          ],
        ),

      )
    

    );
  }
}
class AiUi extends StatelessWidget {
  final String response;
  final DateTime date;
  const AiUi({super.key,required this.response,required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 160,
              padding: const EdgeInsets.all(10),
              // color: Colors.yellow,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: TypingTextAnimation(text: response, duration: const Duration(seconds: 3),)

            ),
            Text(date.toString(),style: TextStyle(
              fontSize: 10
            ),)
          ],
        ),
      ),
    ) ;
  }
}


