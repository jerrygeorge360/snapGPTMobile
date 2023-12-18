import 'package:flutter/material.dart';
import 'package:snap_gpt/services/hex_converter.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(

            width:523 ,
            height: 116,
            // color: Colors.red,

            child: const Text('SnapGPT your personal AI',textAlign: TextAlign.center,style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              fontSize: 48.0,
              letterSpacing: 1.00,


            ),),
          ),
          Center(child: Container(
            width: 430,
            height: 450,
            // color: Colors.orange,
           child: Image.asset('assets/images/welcomescreen.png',fit: BoxFit.cover),
          ),),
          Container(
            width: 377,
            height: 61,
            margin: EdgeInsets.all(53),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: convert_hex('#A5D1C6'),
            ),
            child: Row(
              children: [
                Container(width: 55,height: 55,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),color: Colors.white
              ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
                SizedBox(width: 50,),
                const Text('Swipe left to get started' ,style: TextStyle(

                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0
                ),)
              ],
            ),
          )
        ],
      ),

    );
  }
}
