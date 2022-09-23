// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/copyright.dart';
import 'components/head_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(),
      bottomNavigationBar: Copyright(),
    );
  }
}
