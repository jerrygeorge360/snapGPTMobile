import 'dart:convert';
import 'dart:typed_data';

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:snap_gpt/screens/home_page/typingWid.dart';

import '../../services/camera.dart';
import '../../services/chatClass.dart';
import '../../services/constantvalues.dart';
import '../../services/cropservice.dart';


class ChatScreen extends StatefulWidget {
  final PicCam picList;
  final String additionalPrompt;
  const ChatScreen({super.key,required this.picList,required this.additionalPrompt});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin{
  late ChatClass _chat;
  late ResponseClass _ai;
  late PicCam _piclist;
  late String _additionalPrompt;
  final List<dynamic>_chats=[];
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Uint8List _myData;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeData();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
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

      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
          title:"Camera",
          iconColor :Colors.white,
          bubbleColor : Colors.blue,
          icon:Icons.camera_enhance_rounded,
          titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
          onPress: () async{
            _animationController.reverse();
            if(_chats.isNotEmpty){
              var data=await pickCamera();
              setState(() {
                _myData=data;
              });
              if(_myData!=null){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return CropMe(picList: PicCam(_myData!),);
                }));
                initializeData();
              }

            }

          },
        ),
          Bubble(
            title:"Gallery",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.browse_gallery,
            titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () async{
              _animationController.reverse();

              if(_chats.isNotEmpty){
                var data=await pickImage();
                setState(() {
                  _myData=data;
                });
                if(_myData!=null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return CropMe(picList: PicCam(_myData!),);
                  }));
                }


              }

            },
          )],animation: _animation, onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),iconColor: Colors.blue,iconData: Icons.ac_unit, backGroundColor: Colors.white,),

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
            Row(
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
                const CircleAvatar(radius: 20,)
              ],
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(radius: 20,),
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
              ],
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

class CamGa extends StatelessWidget {
  const CamGa({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
        height: 40,
        child: CircleAvatar(radius: 30,),
      ),
        Container(
          width: 40,
          height: 40,
          child: CircleAvatar(radius: 30,),
        ),
      ],
    );
  }
}



