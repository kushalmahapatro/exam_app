import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 70.0),
          height: 70.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                 decoration: BoxDecoration(
                 color: const Color(0xff7c94b6),
                 border: Border.all(
                 color: Colors.black,
                 width: 30.0,
                   //style:
          ),
        ),

              )
            /*  Container(
                padding: EdgeInsets.all(40),
                color: Colors.black,
                child: Text("1"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.black,
                child: Text("1"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.black,
                child: Text("1"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.black,
                child: Text("1"),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

}
