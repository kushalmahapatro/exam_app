import 'package:flutter/material.dart';

class InstuctionScreen extends StatefulWidget {
  @override
  _InstuctionScreenState createState() => _InstuctionScreenState();
}

class _InstuctionScreenState extends State<InstuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Instuction Screen"),
      ),
      body: Center(
        child: Text("Come to Instcurion screen"),
      ),
    );
  }
}
