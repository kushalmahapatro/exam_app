import 'package:exam_app/controllers/AssessorPageController.dart';
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:flutter/material.dart';

class Assessor extends StatefulWidget {
  Assessor({Key key}) : super(key: key);

  @override
  _AssessorState createState() {
    return _AssessorState();
  }

}

class _AssessorState extends State<Assessor> implements AssessorPageListener {
  AssessorPageController controller;
  bool apiCalled = false;
  GetAssessorModel apiModel;
  List<UserId> id= new List();
  int _id;

  _AssessorState(){
    controller = AssessorPageController(listener: this);
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
                padding: EdgeInsets.all(10.0), child: Text("Assessor Login")),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: apiCalled ? dropDown() : Container()),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: apiCalled ? TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Pin",
                  ),
                ) : Container()),
            Padding(padding: EdgeInsets.all(10.0),
              child: apiCalled? RaisedButton(onPressed: (){},child: Text("Login"),) : Container())
          ],
        ),
      ),
    );
  }

  @override
  void onAPIFailure({String message}) {
    // TODO: implement onAPIFailure
  }

  @override
  void onAPISuccess({GetAssessorModel model}) {
    // TODO: implement onAPISuccess
    setState(() {
      apiModel = model;
      for (int i=0; i< model.response.length ;i++){
        id.add(UserId(model.response[i].id, model.response[i].username));
      }
      apiCalled = true;
    });
  }
}

class UserId{
  String id;
  String name;
  UserId(this.id, this.name);
}
