import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:exam_app/model/city.dart';

class AddDevice extends StatefulWidget {
  AddDevice({Key key}) : super(key: key);
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final List<City> _allCities = City.allCities();
  BuildContext _scaffoldContext;
  List<Student> students = AssessorLoginModel.getInstance(Map()).eventData.students;

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
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
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
            child:  Text(students[index].name, style:
            TextStyle(fontSize: 20.0)
            ),
          ),

          Spacer(flex: 20,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: null,
              child: Text("Add",
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
