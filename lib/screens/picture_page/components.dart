import 'package:flutter/material.dart';
import 'package:snap_gpt/screens/home_page/chats.dart';
import 'package:snap_gpt/services/camera.dart';
import 'dart:convert';
import '../../services/constantvalues.dart';
import '../../services/hex_converter.dart';

class PicProcessing extends StatefulWidget {
  final PicCam picList;
  const PicProcessing({super.key,required this.picList});

  @override
  State<PicProcessing> createState() => _PicProcessingState();
}

class _PicProcessingState extends State<PicProcessing> {

  final _formkey = GlobalKey<FormState>();
  late final PicCam _picList;
  late String _additionalPrompt='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picList=widget.picList;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (){
            setState(() {
              Form.of(primaryFocus!.context!)!.save();
            });
          },
          child: SingleChildScrollView(
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width-20,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  border:Border.all(width: 4,style: BorderStyle.solid,color: Colors.greenAccent) ,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    image: Image.memory(_picList.uint8ListImage).image,
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 270,
              height: 70,
              child:TextFormField(

                onSaved: (value){
                  if(value != null){
                    _additionalPrompt=value;
                  }
                  if(value==null){
                    _additionalPrompt='answer this';
                  }

                },



                decoration: InputDecoration(
                    filled: true,
                    fillColor: convert_hex('#FFFFFF'),
                    hintText: 'additional prompt',
                    labelText: 'additional prompt',
                    border: InputBorder.none
                ),
              ) ,
            ),
            const SizedBox(height: 20,),
            Container(
              width: 270,
              height: 43,
              child:
              ElevatedButton(style:ElevatedButton.styleFrom(
                  primary: convert_hex('#369478')
              ),
                onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ChatScreen(picList: _picList, additionalPrompt: _additionalPrompt);
                }));

              },
                child:
                const Icon(Icons.send),
              ),
            )

        ],
      ),
          )),
    ) ;
  }
}
