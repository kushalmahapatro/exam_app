import 'package:exam_app/screens/Assessor.dart';
import 'package:exam_app/screens/VivaAndTheoryManagement.dart';
import 'package:exam_app/screens/Student.dart';
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 100,
                height: 50,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (c) => new Assessor()));
                },
                child: Text("Assessor Login"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 100,
                height: 50,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (c) => new Student()));
                },
                child: Text("Student Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
