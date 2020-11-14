import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kriyaflutter/feature/dashboard/dashboard-page.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ini launchpage");
    startLaunchPageScreen();
  }

  startLaunchPageScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer (duration,(){
      print("Ini timer");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            print("Ini material page route");
            return DashboardPage();
          })
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/kriya-icon.png",
              ),
            ],
          )
      ),
    );
  }
}
