import 'package:flutter/material.dart';
import 'package:town_simulator/screens/debug_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: homepage(),
      home: DebugScreen(), // use this for debugging
    );
  }
}



//  todo 
// 1. design basic card and widgets to show basic info  ☑️
// 2. then create functions which call the api 
// 3. give the widgets the info which was retirved 