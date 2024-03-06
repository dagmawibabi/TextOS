// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
      },
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStatePropertyAll(
            Colors.black,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          height: 80.0,
          color: Colors.black,
          surfaceTintColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
