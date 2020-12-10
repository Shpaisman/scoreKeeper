import 'package:flutter/material.dart';
import 'package:scoreKeeper/modules/home/home.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        
      },
    ),
  );
}
