import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo A"),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/salah.jpg'),
                  radius: 50.0,
                ),
                Text(
                  'Salah',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'IT Student',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.teal.shade100,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.teal),
                      SizedBox(width: 10.0,),
                      Text(
                        '+212 6 57 86 54 79',
                        style: TextStyle(color: Colors.teal, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.mail, color: Colors.teal),
                      SizedBox(width: 10.0,),
                      Text(
                        'bkdsalah@gmail.com',
                        style: TextStyle(color: Colors.teal, fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
