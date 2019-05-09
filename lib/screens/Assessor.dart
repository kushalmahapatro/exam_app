import 'package:exam_app/controllers/AssessorLoginController.dart';
import 'package:exam_app/controllers/AssessorPageController.dart';
import 'package:exam_app/screens/VivaAndTheoryManagement.dart';
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:flutter/material.dart';

class Assessor extends StatefulWidget {
  Assessor({Key key}) : super(key: key);

  @override
  _AssessorState createState() {
    return _AssessorState();
  }

}

class _AssessorState extends State<Assessor> implements AssessorPageListener , AssessorLoginListener{
  AssessorPageController controller;
  AssessorLoginController loginController;
  bool apiCalled = false;
  GetAssessorModel apiModel;
  List<UserId> id= new List();
  int _id;
  String pin;
  BuildContext _scaffoldContext;
  Scaffold scaffold;

  _AssessorState(){
    controller = AssessorPageController(listener: this);
    loginController = AssessorLoginController(listener: this);
    controller.callAPI();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = 0;
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
                        color: Colors.black),
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
                        color: Colors.black),
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
              padding: EdgeInsets.all(10.0), child: Text("Assessor Login", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 30.0),)),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: apiCalled ? dropDown() : Container()),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: apiCalled ? inputField() : Container()),
          Padding(padding: EdgeInsets.all(10.0),
              child: apiCalled? MaterialButton(
                height: 50,
                minWidth: 100,
                color:Colors.white ,
                onPressed: (){
                loginController.callAPI(id[_id].id, pin);
              },child: Text("Login"),) : Container())
        ],
      ),
    );
    scaffold = new Scaffold(
      backgroundColor: primaryColor,
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
    setState(() {
      apiModel = model;
      for (int i=0; i< model.response.length ;i++){
        id.add(UserId(model.response[i].id, model.response[i].username));
      }
      apiCalled = true;
    });
  }

  @override
  void onLoginFailure({String message}) {
  }

  @override
  void onLoginSuccess({AssessorLoginModel model}) {
    if(model.responseCode==200){
      Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
          content:  Text(model.responseMessage)
      ));
      Navigator.push(context, new MaterialPageRoute(builder: (c)=> new VivaAndTheoryManagement()));
    }else{
      Scaffold.of(_scaffoldContext).showSnackBar( SnackBar(
          content:  Text(model.responseMessage)
      ));
    }

  }
}

class UserId{
  String id;
  String name;
  UserId(this.id, this.name);
}
