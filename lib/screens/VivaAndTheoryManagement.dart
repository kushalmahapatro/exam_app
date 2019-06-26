import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:exam_app/screens/AddDevice.dart';
import 'package:exam_app/screens/ConductViva.dart';
import 'dart:convert';
import 'package:exam_app/model/LocalStorageData.dart';


class VivaAndTheoryManagement extends StatefulWidget {

  @override
  _VivaAndTheoryManagementState createState() => _VivaAndTheoryManagementState();
}

class _VivaAndTheoryManagementState extends State<VivaAndTheoryManagement> {


  @override
  Widget build(BuildContext context) {
    //var instructionLanguage=GetAssessorLoginModel.response.eventData.instructionLanguage;
    //print("instuction"+GetAssessorLoginModel.response.eventData.instructionLanguage['hindi']);
    LocalStorageData.instructionLanguage= jsonDecode(GetAssessorLoginModel.response.eventData.instructionLanguage);
    String hindi = LocalStorageData.instructionLanguage['hindi'];
    print("hindi language"+hindi);
    return Scaffold(
      appBar: AppBar(
        title: Text("Viva and Theory Management"),
      ),
      backgroundColor: Colors.white,
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
                    fontSize:30.0,
                    color:Colors.black45
              ),
              ),

            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 150,
                  height: 50,
                  color: Colors.blue,
                onPressed: (){
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (c) => new AddDevice()));
                },
                child: Text("Student",
                  style: TextStyle(
                      color: Colors.white,
                       fontSize: 20.0
                  )
                  ),

              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                color: Colors.blue,
                onPressed:null,
                child: Text("Sync Data",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 20.0
                    )
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Viva Management",
                style: TextStyle(
                fontSize: 30.0,
                color:Colors.black45
              ),
              ),

            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                color: Colors.blue,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (c)=>ConductViva()));
                },
                child: Text("Start Viva",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                color: Colors.blue,
                onPressed: null,
                child: Text("Sync Data",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 20.0
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
