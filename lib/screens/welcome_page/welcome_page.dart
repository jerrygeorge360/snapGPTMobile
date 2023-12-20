import 'package:flutter/material.dart';
import 'package:snap_gpt/services/animations/slider.dart';
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
//slider
        const WelcomeSlider()
        ],
      ),

    );
  }
}
