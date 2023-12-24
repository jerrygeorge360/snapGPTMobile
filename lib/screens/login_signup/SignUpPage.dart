import 'package:flutter/material.dart';

import '../../services/constantvalues.dart';
import '../../services/hex_converter.dart';
import '../../services/login_signup/login_signup.dart';

class SignUp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Column(
          children: [
            Row(mainAxisAlignment:MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () { Navigator.of(context).pushNamed('/login'); },
                child: Text('Sign In',style: TextStyle(color:convert_hex('#369478'),fontSize: 20,fontFamily: 'Lato',fontWeight: FontWeight.w600),),
                  )
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


            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SignUpForm()


              ],
            ),

            // ElevatedButton(onPressed:(), child: Text())
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey=GlobalKey<FormState>();
  late String _email;
  late String _username;
  late String _password;
  late Map<String,dynamic> _data;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (){
          setState(() {
            Form.of(primaryFocus!.context!)!.save();
          });
        },
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 270,
              height: 70,
              child:TextFormField(
                onSaved: (value){
                      if(value !=null){
                        _email=value;
                      }
                },
                validator: (value){
                  validateForm(value);
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
                onSaved: (value){
                  if(value != null){
                          _username=value;
                  }
                },
                validator: (value){
                  validateForm(value);
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
                onSaved: (value){
                  if(value !=null){
                    _password=value;
                  }

                },
                validator: (value){
                  validateForm(value);
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
              child:  ElevatedButton(

               child: Text('Sign Up'),style:ElevatedButton.styleFrom(
                  primary: convert_hex('#369478')
              ), onPressed: () {

                if(_formkey.currentState!.validate()){
                  //write to send to server.
                  _data={'user_name':_username,'password':_password,'email':_email};
                  dynamic res=sendFormData('{$urll}signup', _data);
                  _username='';
                  _password='';
                  _email='';
                  if(res['success']==true){
                    Navigator.of(context).pushNamed('/home');
                  }
                  else{
                    String error=res['message'];
                    //do an error widget here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error))
                    );


                  }
                  //TODO: navigate
                }
              },),
            )

          ],
        )

    );
  }
}

