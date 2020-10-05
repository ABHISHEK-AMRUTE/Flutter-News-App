import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './views/greet_screen.dart';

bool cityCaptured = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance(); // S
  cityCaptured = pref.getBool('cityCaptured');

  print(cityCaptured);
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
      home: cityCaptured == null ? GreetScreen() : Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
