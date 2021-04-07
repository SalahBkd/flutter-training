import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo A"),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                width: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 100.0,
                    height: 100.0
                  ),
                  Container(
                      color: Colors.greenAccent,
                      width: 100.0,
                      height: 100.0
                  ),
                ],
              ),
              Container(
                color: Colors.lightBlue,
                width: 100.0,
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

