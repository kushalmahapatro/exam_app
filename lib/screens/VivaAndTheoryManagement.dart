import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:exam_app/screens/AddDevice.dart';
import 'package:exam_app/screens/InstuctionScreen.dart';


class VivaAndTheoryManagement extends StatefulWidget {
  VivaAndTheoryManagement({Key key}) : super(key: key);

  @override
  _VivaAndTheoryManagementState createState() => _VivaAndTheoryManagementState();
}

class _VivaAndTheoryManagementState extends State<VivaAndTheoryManagement> {

  @override
  Widget build(BuildContext context) {
//    print("valeue of the modle=="+model.responseMessage);
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
              child: Text("Theory Management",
                style: TextStyle(
                    fontSize:35.0,
                    color:Colors.white
              ),
              ),

            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (c) => new AddDevice()));
                },
                child: Text("Student",
                  style: TextStyle(
                      color: Colors.black
                  )
                  ),

              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed:null,
                child: Text("Sync Data",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Viva Management",
                style: TextStyle(
                fontSize: 35.0,
                color:Colors.white
              ),
              ),

            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: null,
                color:Colors.blue ,
                child: Text("Start Viva",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: null,
                child: Text("Sync Data",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
