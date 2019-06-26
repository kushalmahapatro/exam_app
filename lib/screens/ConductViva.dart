import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:exam_app/model/city.dart';
import 'package:exam_app/screens/TakeVivaStudentPic.dart';
import 'package:exam_app/model/LocalStorageData.dart';

class ConductViva extends StatefulWidget {
  GetAssessorLoginModel model;
  ConductViva({Key key, this.model }) : super(key: key);
  @override
  _ConductVivaState createState() => _ConductVivaState(model);
}

class _ConductVivaState extends State<ConductViva> {
  BuildContext _scaffoldContext;
  GetAssessorLoginModel model;
  List<String> conduct_btn_text;

  _ConductVivaState(this.model);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conduct_btn_text=new List(GetAssessorLoginModel.response.eventData.students.length);
    for (int i =0 ; i< conduct_btn_text.length; i++) {
      if (GetAssessorLoginModel.response.eventData.students[i].vivaStatus =="Finished") {
        conduct_btn_text[i] = "Finished";
      } else {
        conduct_btn_text[i] = "Conduct";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Student List",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return Container(
      height: 700,
      child:  ListView.builder(
        itemCount: GetAssessorLoginModel.response.eventData.students.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      ),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child:  Text(GetAssessorLoginModel.response.eventData.students[index].name, style:
            TextStyle(fontSize: 20.0)
            ),
          ),

          Spacer(flex: 20,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: (){
                if(GetAssessorLoginModel.response.eventData.students[index].vivaStatus=="Finished"){
                  setState(() {
                    conduct_btn_text[index] = "Finished";
                  });
                }else{
                  LocalStorageData.std_position=index;
                  Navigator.push(context, new MaterialPageRoute(builder: (c)=>TakeVivaStudentPic()));
                }

              },
              child: Text(conduct_btn_text[index],
                  style: TextStyle(
                      color: Colors.black
                  )
              ),
            ),
          ),

        ],
      ),

    );
  }

  _showSnackBar(BuildContext context, City item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.name} is a city in ${item.country}"),
      backgroundColor: Colors.amber,
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}
