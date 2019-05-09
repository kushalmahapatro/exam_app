import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Summary Screen"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
              /*@bishal
              *header design consist of question number ,Status,Action
               */
              Container(
                width: 350,
                height: 50,
                color: Colors.black45,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("Question No"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(1, 2, 40, 2),
                      child: Text("Status"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(1, 2, 40, 2),
                      child: Text("Action"),
                    ),
                  ],
                ),
              ),

              /*@bishal
              *Lisview builder design
               */
              Container(
                width: 350,
                height: 500,
                color: Colors.black12,
                child: ListView.builder(
                  itemBuilder: _summaryui,
                  itemCount: 16,
                  padding: EdgeInsets.all(20),
                )
              ),

              /*@bishal
              *Button design
               */
              Container(
                padding: EdgeInsets.all(10),
                child: MaterialButton(onPressed: null,
                  minWidth: 100,
                  height: 50,
                  color: Colors.blue,
                  child: Text("Submit"),
                ),
              ),
        ],
      ),
    );
  }
  Widget _summaryui(BuildContext context,index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(index.toString()),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("Unanswer"),
        ),
        Padding(
          padding: EdgeInsets.all(1),
          child: new Container(
              width:90 ,
              height: 50,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.black
                ),
              ),
              child: new Center(
                child: new Text("Change"+index.toString()),
              )
          ),
        ),
      ],
    );
  }
}
