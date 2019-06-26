import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/model/LocalStorageData.dart';
//import 'package:exam_app/model/VivaQuestionjson.dart';
import 'package:exam_app/screens/ConductViva.dart';
import 'package:exam_app/model/Vivajson.dart';
import 'package:exam_app/model/CalculateTimeJson.dart';
import 'package:exam_app/screens/timer_page.dart';
import 'package:exam_app/sdk/api/GetVivaSyncApi.dart';
import 'package:exam_app/controllers/VivaSyncAPiControler.dart';
//import 'package:exam_app/model/VivaStepjson.dart';

class VivaTestScreen extends StatefulWidget {
  @override
  _VivaTestScreenState createState() => _VivaTestScreenState();
}

class _VivaTestScreenState extends State<VivaTestScreen> implements VIvaSyncApiListener {
  vivaSyncApiController controller;
  int mainindex;
  String next_btn_text="Next";
  int stdposition;
  //List<Vivastepjson> stepjson=new List();
  VivaQuestions currentQuestion;
  List mainquestionjson=new List();
  List finalmainquestionjson=new List();
  List<VivaJson> viva_json;
  List final_vivajson=new List();
  List<CalculateTimejson> calulate_time_json;
  @override
  initState(){
    super.initState();
    DateTime now = DateTime.now();
    print("curr date=="+now.toString());
    LocalStorageData.start_time=now.toString();
    viva_json=new List();
    calulate_time_json=new List();
    stdposition=LocalStorageData.std_position;
    mainindex=0;
    for(int i=0;i<GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length;i++){
      viva_json.add(VivaJson());
      if(i==0){
        calulate_time_json.add(CalculateTimejson("", ""));
      }
    }
    next_btn_text="Next";
  }

  _init() {
    currentQuestion = GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions[mainindex];
  }

  Widget _questionoptionui(BuildContext context,index){
//    Vivastepjson stepjson=new Vivastepjson("", 0.0);
//    print("instuction"+GetAssessorLoginModel.response.eventData.instructionLanguage.toString());
//    if (finalmainquestionjson.length>0){
//     // mainquestionjson.add(finalmainquestionjson[mainindex]);
//    }

    SingleLanguageStepQuestion currentStepQuestion = currentQuestion.steps[index].getLanguageStepQuestion()[LocalStorageData.selected_lang];


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:EdgeInsets.all(5),
          child: Text(currentStepQuestion.question),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RadioButtonGroup(
              labels: <String>[
//                "No Answer"+mainindex.toString(),
//                "Poor"+mainindex.toString(),
//                "Good"+mainindex.toString(),
//                "Very Good"+mainindex.toString(),
//                "   Excellent"+mainindex.toString(),
                currentStepQuestion.option1,
                currentStepQuestion.option2,
                currentStepQuestion.option3,
                currentStepQuestion.option4,
                currentStepQuestion.option5,
              ],
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              padding: EdgeInsets.all(10),
              onSelected: (String selected) => setState((){
                currentStepQuestion.selectedOption = selected;
                String steps_length=currentQuestion.steps.length.toString();
                double steps_len=double.parse(steps_length);
                double qn_marks = (currentQuestion.marks / steps_len) * 1;

                if(currentStepQuestion.getSelectedOptionIndex()==0) {
                  double selected_mark = 0 * qn_marks / 100;
                  currentQuestion.steps[index].steps_mark=selected_mark;
                  print("steps mark=="+currentQuestion.steps[index].steps_mark.toString());

                } else if(currentStepQuestion.getSelectedOptionIndex()==1){
                  double selected_mark = 25 * qn_marks / 100;
                  currentQuestion.steps[index].steps_mark=selected_mark;
                  print("steps mark=="+currentQuestion.steps[index].steps_mark.toString());

                } else if(currentStepQuestion.getSelectedOptionIndex()==2){
                  double selected_mark = 50 * qn_marks / 100;
                  currentQuestion.steps[index].steps_mark=selected_mark;
                  print("steps mark=="+currentQuestion.steps[index].steps_mark.toString());

                }else if(currentStepQuestion.getSelectedOptionIndex()==3){
                  double selected_mark = 75 * qn_marks / 100;
                  currentQuestion.steps[index].steps_mark=selected_mark;
                  print("steps mark=="+currentQuestion.steps[index].steps_mark.toString());

                }else if(currentStepQuestion.getSelectedOptionIndex()==4){
                  double selected_mark = 100 * qn_marks / 100;
                  currentQuestion.steps[index].steps_mark=selected_mark;
                  print("steps mark=="+currentQuestion.steps[index].steps_mark.toString());
                }


//                stepjson.qstn_answer=selected;
//                stepjson.obtained_marks=0.0;
//                mainquestionjson.add(stepjson);
//                print(stepjson.toString());
//                print(selected);
              }),
              picked: currentStepQuestion.selectedOption??""//,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _init();
   /* for(int i=0;i<GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length;i++){
      stepjson=new List();
      for(int j=0;j<GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions[i].steps.length;j++){
        stepjson.add(Vivastepjson(j.toString(), 0.0));
        mainquestionjson[i]=stepjson;
      }
      //mainquestionjson.add(stepjson);
    }*/
   // print("main json=="+mainquestionjson.toString());
    return Scaffold(
      appBar: AppBar(
        title: new TimerPage(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(GetAssessorLoginModel.response.eventData.students[stdposition].studentCode.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text(GetAssessorLoginModel.response.eventData.students[stdposition].name,style: TextStyle(
              fontSize:25,
                fontWeight:FontWeight.bold,

            ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Q"+(mainindex+1).toString(),style: TextStyle(
                fontSize:25,
                fontWeight:FontWeight.bold,

              ),
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.all(20),
            child: Text(currentQuestion.getLanguageQuestion()[LocalStorageData.selected_lang]),
          ),


          Container(
              width: 350,
              height: 400,
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: _questionoptionui,
                itemCount: currentQuestion.steps.length,
                padding: EdgeInsets.all(5),
              )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: (){
                    if(mainindex>0) {
                      setState(() {
                        mainindex = mainindex-1;
                        next_btn_text="Next";
                      });
                    }
//                setState(() {
//                  if(mainindex!=0)
//                  mainindex=mainindex-1;
//                });
//                finalmainquestionjson.add(mainquestionjson);
//                mainquestionjson=new List();
//                print("final mainjson=="+finalmainquestionjson.toString());
                },
                  minWidth: 100,
                  height: 50,
                  color: Colors.blue,
                  child: Text("Previous"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: (){
                   setState(() {
                    /*if(mainindex==GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length-1){
                        next_btn_text="Submit";
                    }*/
                    if(mainindex<(GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length-1)) {
                      double totalmarks=0.0;
                      for(int i=0;i<currentQuestion.steps.length;i++){
                        totalmarks=totalmarks+currentQuestion.steps[i].steps_mark;
                      }
                       currentQuestion.obtained_marks=totalmarks;
                      viva_json[mainindex].question_id=currentQuestion.id;
                      viva_json[mainindex].marks=currentQuestion.marks;
                      viva_json[mainindex].obtained_marks=currentQuestion.obtained_marks;
                      if(mainindex==GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length-2){
                        next_btn_text="Submit";
                      }
                        mainindex = mainindex + 1;
                    }else{
                      double totalmarks=0.0;
                      for(int i=0;i<currentQuestion.steps.length;i++){
                        totalmarks=totalmarks+currentQuestion.steps[i].steps_mark;
                      }
                      currentQuestion.obtained_marks=totalmarks;
                      viva_json[mainindex].question_id=currentQuestion.id;
                      viva_json[mainindex].marks=currentQuestion.marks;
                      viva_json[mainindex].obtained_marks=currentQuestion.obtained_marks;
                      DateTime end_time = DateTime.now();
                      calulate_time_json[0].start_timestamp=LocalStorageData.start_time;
                      calulate_time_json[0].end_timestamp=end_time.toString();
                      calulate_time_json.toString();
                      final_vivajson.add(calulate_time_json);
                      final_vivajson.add(viva_json.toString());
                      print("Final json=="+final_vivajson.toString());

                      controller = vivaSyncApiController(listener: this);
                      controller.callApi(stdposition, final_vivajson.toString());
                    }
                       });//                    setState(() {
//                      if(mainindex<GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length-1)
//                      mainindex=mainindex+1;
//                    });
//                   finalmainquestionjson.add(mainquestionjson);
//                    mainquestionjson=new List();
//                    print("final mainjson=="+finalmainquestionjson.toString());
                  },
                  minWidth: 100,
                  height: 50,
                  color: Colors.blue,
                  child: Text(next_btn_text),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

  @override
  void onApiFailure({Failures failure}) {
    // TODO: implement onApiFailure
  }

  @override
  void onApiSuccess({VivaSyncApiModel model}) {
    // TODO: implement onApiSuccess
    if(model.responseCode==200){
      GetAssessorLoginModel.response.eventData.students[stdposition].vivaStatus="Finished";
      Navigator.push(context, new MaterialPageRoute(builder: (c)=>ConductViva()));
    }
  }

  @override
  void routeTo({Routes route}) {
    // TODO: implement routeTo
  }

}

