import 'package:flutter/material.dart';

import '../../services/hex_converter.dart';

class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Text('Sign in',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lato'
                ),)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  children: [
                    SizedBox(height: 120,),
                    Container(
                      // color: Colors.red,
                      width: 400,
                      height: 140,
                      decoration: const BoxDecoration(

                          image: DecorationImage(

                              image: AssetImage('assets/images/welcomescreen.png'),fit: BoxFit.cover

                          )
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('SnapGPT',style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Lato'
                      ),)],),
                  ],
                ),
              ],
            ),

            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 270,
                  height: 46,
                  color: Colors.white,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [SizedBox(width: 20,),Icon(Icons.facebook),SizedBox(width: 20,),Text('Continue with Google',style:TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: convert_hex('#6D6A6A')
                    ))],
                  ),
                ),
              ],
            ),
            Divider(height: 30,),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      height: 70,
                      child:TextFormField(
                        onChanged: (value){
                          // provider.getLoginName(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            // return provider.LogMessage;
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: convert_hex('#FFFFFF'),
                            hintText: 'Email Address',
                            labelText: 'Email Address',
                            border:InputBorder.none
                        ),
                      ) ,
                    ),
                    Container(
                      width: 270,
                      height: 70,
                      child:TextFormField(
                        onChanged: (value){
                          // provider.getLoginName(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            // return provider.LogMessage;
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: convert_hex('#FFFFFF'),
                            hintText: 'Username',
                            labelText: 'username',
                            border: InputBorder.none
                        ),
                      ) ,
                    ),
                    Container(
                      width: 270,
                      height: 70,
                      child:TextFormField(
                        onChanged: (value){
                          // provider.getLoginName(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            // return provider.LogMessage;
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: convert_hex('#FFFFFF'),
                            hintText: 'Password',
                            labelText: 'Password',
                            border: InputBorder.none
                        ),
                      ) ,
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 270,
                      height: 43,
                      child:  ElevatedButton(onPressed: ()=>{}, child: Text('Sign Up'),style:ElevatedButton.styleFrom(
                          primary: convert_hex('#369478')
                      ),),
                    )

                  ],
                ),


              ],
            ),

            // ElevatedButton(onPressed:(), child: Text())
          ],
        ),
      ),
    );
  }
}
