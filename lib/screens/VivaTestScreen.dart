import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/model/LocalStorageData.dart';
//import 'package:exam_app/model/VivaQuestionjson.dart';
//import 'package:exam_app/model/VivaStepjson.dart';

class VivaTestScreen extends StatefulWidget {
  @override
  _VivaTestScreenState createState() => _VivaTestScreenState();
}

class _VivaTestScreenState extends State<VivaTestScreen> {
  int mainindex;
  int stdposition;
  //List<Vivastepjson> stepjson=new List();
  VivaQuestions currentQuestion;
  List mainquestionjson=new List();
  List finalmainquestionjson=new List();
  @override
  initState(){
    super.initState();
    stdposition=LocalStorageData.std_position;
    mainindex=0;
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
        title: Text("VivaTestScreen"),
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
              child: Text("Q"+mainindex.toString(),style: TextStyle(
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
                    if(mainindex<(GetAssessorLoginModel.response.eventData.students[stdposition].vivaQuestions.length-1)) {
                      setState(() {
                        mainindex = mainindex+1;
                      });
                    }
//                    setState(() {
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
                  child: Text("Next"),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

}

