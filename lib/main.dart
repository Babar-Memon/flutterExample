// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/Expense_Page.dart';
import 'package:my_app/expense_manag.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/login_Page.dart';
import 'package:my_app/utils/routes.dart';
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
      initialRoute: AppRoutes.loginRoute,
      routes: {
        "/": (context) => HomePage(),
        "/home": (context) => HomePage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.enpensePage: (context) => MyHomePage()
        
      },
    );
  }
}
