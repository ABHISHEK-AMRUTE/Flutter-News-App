import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Home(),
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primaryColor: Colors.white
       ),
    );
  }
}