import 'dart:io';

import 'package:exam_app/controllers/AssessorLoginController.dart';
import 'package:exam_app/controllers/AssessorPageController.dart';
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:exam_app/screens/TakeStudentPic.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/PreferenceManager.dart';
import 'package:exam_app/model/LocalStorageData.dart';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';


class Student extends StatefulWidget {
  Student({Key key}) : super(key: key);

  @override
  _StudentState createState() {
    return _StudentState();
  }

}

class _StudentState extends State<Student> implements AssessorPageListener , AssessorLoginListener{
  AssessorPageController controller;
  AssessorLoginController loginController;
  bool apiCalled = false;
  GetAssessorModel apiModel;
  List<UserId> id= new List();
  List<GetAssessorLoginModel> student_response= new List();
  List<String> instruction_lang=new List();
  int _id,_lang_id;
  String dropdownValue = 'English';
  String pin;
  BuildContext _scaffoldContext;
  Scaffold scaffold;
  var dir,knockDir;
  PreferenceManager preferenceManager=new PreferenceManager();



  _StudentState()  {
   // controller = AssessorPageController(listener: this);
    //loginController = AssessorLoginController(listener: this);
   // controller.callAPI();
    instruction_lang.add("English");
    instruction_lang.add("hindi");
    instruction_lang.add("bengali");
    instruction_lang.add("tamil");
    instruction_lang.add("telugu");
    instruction_lang.add("gujarati");
    instruction_lang.add("kannada");
    instruction_lang.add("malayalam");
    instruction_lang.add("marathi");
    instruction_lang.add("nepali");

    for (int i=0; i< GetAssessorLoginModel.response.eventData.students.length ;i++){
      if(GetAssessorLoginModel.response.eventData.students[i].deviceId!="") {
        if(GetAssessorLoginModel.response.eventData.students[i].examStatus!="Over") {
          id.add(UserId(GetAssessorLoginModel.response.eventData.students[i].id,
              GetAssessorLoginModel.response.eventData.students[i].name));
        }
        }
    }
    apiCalled = true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = 0;
    _lang_id=0;
  }
  

  Widget dropDown() {
    return Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: DropdownButtonHideUnderline(
            child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
                child: DropdownButton<String>(
                  style: TextStyle(color: Colors.black),
                  value: id[_id].name,
                  isExpanded: true,
                  items: id.map((UserId value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child:
                           Center(
                          child: Text(
                        value.name,
                        style: TextStyle(color: Colors.black),
                      )),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    int position = 0;
                    for ( int i =0 ; i< id.length; i++){
                      if(id[i].name == newValue){
                        position = i;
                      }
                    }
                    setState(() {
                      _id = position;
                    });
                  },
                ))));
  }


  Widget langdropDown() {
    return Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: DropdownButtonHideUnderline(
            child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    LocalStorageData.selected_lang=dropdownValue;
                  });
                },
                items: <String>['English','hindi', 'bengali', 'tamil','telugu','gujarati',
                'kannada','malayalam','marathi','nepali']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:
                    Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        )),
                  );
                })
                    .toList(),
              )
            )
            ));
  }








  Widget inputField() {
    return Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: DropdownButtonHideUnderline(
            child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter Pin",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value){
                      setState(() {
                        pin = value;
                      });
                  },
                ))));
  }


  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0), child: Text("Student Login", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 30.0),)),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: apiCalled ? dropDown() : Container()),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: apiCalled ? inputField() : Container()),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: apiCalled ? langdropDown() : Container()),
          Padding(padding: EdgeInsets.all(10.0),
              child: apiCalled? MaterialButton(
                minWidth: 100,
                height: 50,
                color: Colors.blue,
                onPressed: (){
                //loginController.callAPI(id[_id].id, pin);
                loginApiCall(_id, pin,id[_id].name);
              },child: Text("Login",style: TextStyle(fontSize: 20.0,color: Colors.white),),) : Container())
        ],
      ),
    );
    scaffold = new Scaffold(
      appBar: AppBar(
        title:Text("Student Login"),
      ),
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext _context) {
        _scaffoldContext = _context;
        return body;
      }),
    );

    return scaffold;
  }

  @override
  void onAPIFailure({String message}) {
  }

  @override
  void onAPISuccess({GetAssessorModel model}) {
    setState(() async {
     // dir = await getExternalStorageDirectory();
      //knockDir = await new Directory('${dir.path}/ExamApp/my_file.txt').create(recursive: true);
      print("path== ");
      //_write("hiii");
      apiModel = model;
      for (int i=0; i< model.response.length ;i++){
        id.add(UserId(model.response[i].id, model.response[i].username));
      }
      apiCalled = true;
    });
  }
  _write(String text) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${knockDir.path}/my_file.txt');
    await file.writeAsString(text);
  }
  Future<String> _read() async {
    String text;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${knockDir.path}/my_file.txt');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }

  @override
  void onLoginFailure({String message}) {
  }

  @override
  Future onLoginSuccess({GetAssessorLoginModel model}) async {
   // _read();
    Navigator.push(context, new MaterialPageRoute(builder: (c)=> new TakeStudentPic()));
    Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
        content:  Text(GetAssessorLoginModel.responseMessage)
    ));
  }

  Future loginApiCall(int position,String pin,String name) async {
   /* for(int i=0;i<GetAssessorLoginModel.response.eventData.students.length;i++){
      if(GetAssessorLoginModel.response.eventData.students[i].id==std_id){
        print("value of i=="+GetAssessorLoginModel.response.eventData.students[i].id);
        if(GetAssessorLoginModel.response.eventData.students[i].password==pin){
          print("Login sucess");
          Navigator.push(context, new MaterialPageRoute(builder: (c)=> new TakeStudentPic()));
          Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
              content:  Text(GetAssessorLoginModel.responseMessage)
          ));
        }else{
          print("Login not sucess");
          Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
              content:  Text("Login not sucess")
          ));
        }
      }else{
        print("not match studnet pin");
      }
    }*/

//    dir = await getExternalStorageDirectory();
//    knockDir = await new Directory('${dir.path}/ExamApp/').create(recursive: true);
//    print("path== "+dir.path);
//
//    _write(student_response.toString());
//    String jsonread=_read() as String;
//    print("json read=="+jsonread.toString());
   int selected_position;
    for(int i=0;i<GetAssessorLoginModel.response.eventData.students.length;i++){
      if(GetAssessorLoginModel.response.eventData.students[i].name==name){
        selected_position=i;
        print("slected position"+selected_position.toString());
      }
    }

    preferenceManager.setStdPostionPrefs(selected_position.toString());
    LocalStorageData.std_position=selected_position;
    print("selected positon set="+LocalStorageData.std_position.toString());
    print("Login pas"+GetAssessorLoginModel.response.eventData.students[selected_position].password.toString());
    if(GetAssessorLoginModel.response.eventData.students[selected_position].password.toString()==pin.toString()){
      print("Login sucess");
      Navigator.push(context, new MaterialPageRoute(builder: (c)=> new TakeStudentPic()));
      Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
          content:  Text(GetAssessorLoginModel.responseMessage)
      ));
    }else{
      print("Login not sucess");
      Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
          content:  Text("Login not sucess")
      ));
    }
  }
}

class UserId{
  String id;
  String name;
  UserId(this.id, this.name);
}
