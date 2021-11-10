import 'package:flutter/material.dart';
import 'package:mobile_desa/UI/widget/buttomBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Welcome to Home"),
      ),
       bottomNavigationBar: buildBottomBar(0, context),
    );
  }
}