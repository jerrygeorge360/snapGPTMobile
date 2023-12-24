

import 'package:snap_gpt/learning.dart';
import 'package:snap_gpt/screens/history_page/history_page.dart';
import 'package:snap_gpt/screens/home_page/chats.dart';
import 'package:snap_gpt/screens/home_page/homepage.dart';
import 'package:snap_gpt/screens/home_page/typingWid.dart';
import 'package:snap_gpt/screens/login_signup/LoginPage.dart';
import 'package:snap_gpt/screens/picture_page/components.dart';
import 'package:snap_gpt/screens/settings/setting_page.dart';
import 'package:snap_gpt/screens/welcome_page/welcome_page.dart';

getRoutes(){
  return{
    '/welcomeScreen':(context)=>const WelcomePage(),
    '/settings':(context)=>const SettingsPage(),
    '/home':(context)=>const HomePage(),
    '/history':(context)=>HistoryPage(),
    '/test':(context)=>MyApp(),
    '/login':(context)=>const Login(),
    // '/modal':(context)=>const ProfileModal
  };

}