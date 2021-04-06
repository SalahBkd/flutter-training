import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo A"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Image(
            image: AssetImage(
                'images/bird.jpg'),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
    ),
  );
}
