import 'package:flutter/material.dart';
import 'package:reciapp/pages/bookmark_page.dart';
import 'package:reciapp/pages/login_page.dart';
import 'package:reciapp/pages/recipes_result_page.dart';
import 'package:reciapp/pages/today_special_page.dart';
import 'pages/home_page.dart';
import 'pages/collection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Inter',
      ),
      home: const MyHomePage(title: 'Reci App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
