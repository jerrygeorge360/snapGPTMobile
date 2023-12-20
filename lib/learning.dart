import 'package:flutter/material.dart';
import 'package:snap_gpt/services/hex_converter.dart';

class Weka extends StatefulWidget {
  @override
  State<Weka> createState() => _WekaState();
}

class _WekaState extends State<Weka> with SingleTickerProviderStateMixin {
  bool _isTrue=false;
  late AnimationController _controller;
  late Animation _colorTween;
  late Animation _textTween;
  late Animation _widthTween;
  late Animation _color1Tween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: const Duration(seconds:2));
    _colorTween=ColorTween(begin: convert_hex('#A5D1C6'),end: Colors.grey).animate(_controller);
    _textTween=IntTween(begin:16,end: 20 ).animate(_controller);
    _widthTween=IntTween(begin:377 ,end:480 ).animate(_controller);
    _color1Tween=ColorTween(begin: Colors.white,end: Colors.blueAccent).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? _) {
          return Container(
          width: _widthTween.value.toDouble(),
          height: 61,
          margin: EdgeInsets.all(53),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: convert_hex('#A5D1C6'),
            color: _colorTween.value
          ),

          child: Row(
          children: [
          Draggable(
            // onDragUpdate: (a)=>{
            //   setState((){})
            // },
          onDragStarted: ()=>_controller.repeat(),
          onDragEnd: (d)=>{
            _controller.reverse(),
            // _controller.stop(),


          },

          onDragCompleted: (){
          print('completed');
          },

          data: true,
          axis: Axis.horizontal,
          feedback:
          Container(width: 55,height:55,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),color: Colors.white
          ),
            child:
          Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
          child:
          Container(width: 55,height: 55,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),color: Colors.white
          ),child:Icon(Icons.arrow_forward_ios_rounded,color: _colorTween.value,) ,),
          onDraggableCanceled: (velocity,offset){
          // print(velocity);
          // print(offset);
          },
          ),


          SizedBox(width: 50,),
          Text('Swipe left to get started' ,style: TextStyle(

            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            fontSize: _textTween.value.toDouble(),
          ),),
          SizedBox(width: 30,),
          DragTarget(

          onAccept: (data) {
          },
          onLeave: (boo){


          },
          onWillAccept: (data){
            Navigator.pushNamed(context, '/login');
            return true;
          }
              ,
          builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
          return Container(width: 50,height: 50,);
          })
          ],
          ),
          );
        },

      ),
    );
  }
}
