import 'package:exam_app/sdk/api/GetAddDevice.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/model/QuestionStatus.dart';
import 'package:exam_app/model/Questionjson.dart';
import 'package:exam_app/screens/VivaAndTheoryManagement.dart';
import 'package:exam_app/model/CalculateTimeJson.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/model/LocalStorageData.dart';
import 'package:exam_app/sdk/api/GetSyncApi.dart';
import 'package:exam_app/controllers/SyncAPiControler.dart';
import 'package:exam_app/screens/timer_page.dart';

class SummaryScreen extends StatefulWidget {
  List<QuestionStatus> question_status;
  List<QuestionJson> question_json;
  List<CalculateTimejson> calulate_time_json;
  List<Color> select_color;
  SummaryScreen(this.question_status,this.question_json,this.calulate_time_json,this.select_color);

  @override
  _SummaryScreenState createState() => _SummaryScreenState(question_status,question_json,calulate_time_json,select_color);
}

class _SummaryScreenState extends State<SummaryScreen> implements SyncApiListener{
  SyncApiController controller;
  List<QuestionStatus> question_status;
  List<QuestionJson> question_json;
  List<CalculateTimejson> calulate_time_json;
  List final_json=new List();
  List<Color> select_color;
  double height;
  double actual_height;
  int stdposition;
  _SummaryScreenState(this.question_status,this.question_json,this.calulate_time_json,this.select_color);


  @override
  void initState() {
    stdposition=LocalStorageData.std_position;
    // TODO: implement initState
    super.initState();
  }

  moveToQuestionscreen(int index){
    setState(() {
      Navigator.pop(context);
    });

  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    double percentage_height=0.30*height;
    actual_height=height-percentage_height;
    print("height"+height.toString());
    print("actual_height"+actual_height.toString());
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
              height: actual_height,
              color: Colors.black12,
              child: ListView.builder(
                itemBuilder: _summaryui,
                itemCount: GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions.length,
                padding: EdgeInsets.all(20),
              )
          ),

          /*@bishal
              *Button design
               */
          Container(
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: (){
                print("question status =="+question_json.toString() );
                DateTime end_time = DateTime.now();
                calulate_time_json[0].start_timestamp=LocalStorageData.start_time;
                calulate_time_json[0].end_timestamp=end_time.toString();
                calulate_time_json.toString();
                final_json.add(calulate_time_json);
                final_json.add(question_json);
                final_json.toString();
                print("TIme json="+final_json.toString());
                controller = SyncApiController(listener: this);
                controller.callApi(stdposition, final_json.toString());
                //Navigator.push(context, new MaterialPageRoute(builder: (c)=>VivaAndTheoryManagement()));
              },
              minWidth: 100,
              height: 50,
              color: Colors.blue,
              child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20.0),),
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
          child: Text((index+1).toString()),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(question_status[index].qstn_status),
        ),
        Padding(
          padding: EdgeInsets.all(1),
          child: new Container(
            width:90 ,
            height: 50,
            decoration: new BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: select_color[index]
              ),
            ),
            child:InkWell(
              onTap: (){
                Navigator.pop(context,index);
              },
              child: new Center(
                child: new Text("Change"+(index+1).toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onApiFailure({Failures failure}) {
    // TODO: implement onApiFailure
  }

  @override
  void onApiSuccess({SyncApiModel model}) {
    // TODO: implement onApiSuccess
    if(model.responseCode==200){
      GetAssessorLoginModel.response.eventData.students[stdposition].examStatus="Over";
      Navigator.push(context, new MaterialPageRoute(builder: (c)=>VivaAndTheoryManagement()));
   }
  }

  @override
  void routeTo({Routes route}) {
    // TODO: implement routeTo
  }
}
