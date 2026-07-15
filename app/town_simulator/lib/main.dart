// import 'package:flutter/material.dart';
// import 'package:town_simulator/screens/home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       // home: homepage(),
//       home: homepage(), // use this for debugging
//     );
//   }
// }

// //  todo
// // 1. design basic card and widgets to show basic info  ☑️
// // 2. then create functions which call the api
// // 3. give the widgets the info which was retirved

// Caution AI genrated code ahead ⚠️⚠️

import 'package:flutter/material.dart';
import 'package:town_simulator/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulation Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Dark slate blue
        cardColor: const Color(0xFF1E293B),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      home: const homepage(),
    );
  }
}
