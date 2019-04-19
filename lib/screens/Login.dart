import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() {
    return _LoginState();
  }
//  _LoginState createState() => return _LoginState();

}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryColor,
      body: new Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),
            child: RaisedButton(onPressed: (){},child: Text("Assessor Login"),), ),
            Padding(padding: EdgeInsets.all(10.0),
            child: RaisedButton(onPressed: (){},child: Text("Student Login"),), )
          ],
        ),
      ),
    );
  }
}
