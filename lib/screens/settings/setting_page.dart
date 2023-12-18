import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text(
          'Settings'
        ),
        leading: Icon(Icons.arrow_back_ios_new),
        titleTextStyle: TextStyle(
          fontFamily: 'Lato',
          fontSize: 32,
          fontWeight: FontWeight.w700
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(children: [
          Text('General')
        ],),
        Row(children: [
          Text('Theme'),Text('System')
        ],),
        Row(
          children: [Text('More')],
        ),
        // ElevatedButton(onPressed: onPressed, child: child)
        Row(children: [ElevatedButton(onPressed: ()=>{}, child: Text('Log out'))],)
      ],),
    );
  }
}
