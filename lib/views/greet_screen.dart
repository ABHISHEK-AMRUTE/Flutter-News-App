import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GreetScreen extends StatefulWidget {
  @override
  _GreetScreenState createState() => _GreetScreenState();
}

class _GreetScreenState extends State<GreetScreen> {
  String city = "";
  bool emptyCity = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Hello!",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To Fast",
                    style: TextStyle(fontSize: 30),
                  ),
                  Flexible(
                    child: Text(
                      "News",
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 70,
                  child: TextField(
                    onChanged: (value) {
                      city = value;
                    },
                    cursorColor: Colors.blue,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "Enter your city",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.blue,
                  onPressed: () async {
                    if (city == "") {
                      setState(() {
                        emptyCity = true;
                      });
                    } else {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      setState(() {
                        pref.setBool("cityCaptured", true);
                        emptyCity = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                emptyCity
                    ? Text(
                        "City should not be empty",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
