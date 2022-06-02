// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/login_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
