import 'package:flutter/material.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/screens/QuestionScreen.dart';
//import 'package:flutter_html_view/flutter_html_view.dart';

class InstuctionScreen extends StatefulWidget {
  InstuctionScreen({Key key}) : super(key: key);
  @override
  _InstuctionScreenState createState() => _InstuctionScreenState();
}


class _InstuctionScreenState extends State<InstuctionScreen> {

  Map<String, String> instructions = AssessorLoginModel.getInstance(Map()).eventData.instructionLanguage;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Instuction Screen"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        //verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text(instructions["hindi"]),
        ],
      )

      //Text(model.response.eventData.instructionLanguage),
    );
  }
}
