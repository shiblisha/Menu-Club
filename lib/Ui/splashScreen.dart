import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menu_club/Ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'botton_navigation.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Future<void>checkuserlogin()async
  {
    final preferences=await SharedPreferences.getInstance();

    Future.delayed(const  Duration(seconds: 5),(){
      if(!preferences.containsKey('Token'))
      {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const  LoginPage()));
      }
      else
      {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>const BottomNavigation()));
      }
    });}


  @override
  void initState() {
    checkuserlogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo_red.png',height: mheight * 0.3,
            width: mwidth * 0.52),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}