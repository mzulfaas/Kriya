import 'package:easy_alert/easy_alert.dart';
import 'package:flutter/material.dart';
import 'package:kriyaflutter/feature/dashboard/dashboard-page.dart';

import 'feature/launch/launch-page.dart';

void main() {

  runApp(
      AlertProvider(
        child: MyApp(),
        config: AlertConfig(ok: "Ok",cancel: "Cancel"),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kriya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
//      home: DashboardPage(),
       home: LaunchPage(),
      routes: <String, WidgetBuilder>{
//        'main': (context) => DashboardPage(),
         'main': (context) => LaunchPage(),
//        'launcher': (context) => new DashboardPage(),
         'launcher': (context) => new LaunchPage(),
      },
    );
  }
}