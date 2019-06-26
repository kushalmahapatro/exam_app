import 'package:flutter/material.dart';
import 'package:exam_app/screens/Radio_button_group.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/screens/SummaryScreen.dart';
import 'package:exam_app/model/Questionjson.dart';
import 'package:exam_app/model/QuestionStatus.dart';
import 'package:exam_app/model/CalculateTimeJson.dart';
import 'package:exam_app/utils/PreferenceManager.dart';
import 'package:exam_app/model/LocalStorageData.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:exam_app/screens/timer_page.dart';
import 'dart:convert';


class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int mainIndex;
  var question_color_box;
  double height;
  double actual_height;
  String next_btn_text="Next";
  bool mark_review,radio_select,both_markreview_radioselect,nothing_select;
  List<Color> select_color;
  List<QuestionJson> question_json;
  List<QuestionStatus> question_status;
  List<CalculateTimejson> calulate_time_json;
  PreferenceManager preferenceManager=new PreferenceManager();
  TheoryQuestions theoryQuestion;
  SingleLanguageQuestion singleLanguageQuestion;
  int stdposition;
  @override
  initState() {
    super.initState();
    DateTime now = DateTime.now();
    print("curr date=="+now.toString());
    LocalStorageData.start_time=now.toString();
    mainIndex = 0;
    next_btn_text="Next";
    question_color_box=Colors.transparent;
    mark_review=false;
    radio_select=false;
    nothing_select=true;
    stdposition=LocalStorageData.std_position;
    both_markreview_radioselect=false;
    question_status=new List();
    question_json=new List();
    calulate_time_json=new List();
    select_color=new List(GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions.length);
    for (int i =0 ; i< select_color.length; i++) {
      select_color[i] = Colors.transparent;
      question_status.add(QuestionStatus(true, false, false, "unanswered"));
      question_json.add(QuestionJson());
      if(i==0){
        calulate_time_json.add(CalculateTimejson("", ""));
      }
    }
   // actulaquestionlanguage=jsonDecode(questionlanguage.toString());
    //print("actulajsonlanguage=="+actulaquestionlanguage.toString());

//    var user = new User.fromJson(questionlanguage);
//    String json = jsonEncode(user);
//    print(json);
    }

    void _init() {
      theoryQuestion = GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions[mainIndex];
      singleLanguageQuestion = theoryQuestion.getLanguageQuestion()[LocalStorageData.selected_lang];
    }

  void _awaitReturnValueFromSummaryScreen(BuildContext context) async {
    print("question json value=="+question_json.toString());
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(question_status,question_json,calulate_time_json,select_color),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      mainIndex=result;
    });
  }

  Widget _getHorizontlData(BuildContext context, final int index) {
    return  Container(
        width: 50,
        height: 50.0,
        padding: EdgeInsets.all(5),
        color: Colors.transparent,
        child: InkWell(onTap: (){
          setState(() {
            mainIndex = index;
          });
        }, child: Container(

            decoration: new BoxDecoration(
              color: select_color[index],
              border: Border.all(
                  color: Colors.black
              ),
            ),
            child: new Center(
              child: new Text((index+1).toString()),
            )
        )),
      );
  }

  Widget QuestionWidget(int index) {

    //actulaquestionlanguage=jsonDecode(questionlanguage.toString());
    //print("Questionlanguage="+actulaquestionlanguage.toString());
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        /*@bishal
            *To show the Question number
             */
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text("Q" + (index+1).toString(), style: TextStyle(
                fontSize: 25,
                color: Colors.black
            ),
            ),
          ),
        ),

        /*@bishal
            *show the questions here
             */
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: Text(
            singleLanguageQuestion.question,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
        ),

        /*@bishal
              *Show question options
               */
        RadioButtonGroup(
            labels: <String>[
              singleLanguageQuestion.optiona,
              singleLanguageQuestion.optionb,
              singleLanguageQuestion.optionc,
              singleLanguageQuestion.optiond,
            ],
            onSelected: (String selected)=>  setState((){
              /*radio_select = true;
              nothing_select=false;
              both_markreview_radioselect=false;
              if(mark_review){
                both_markreview_radioselect=true;
              }else{
                mark_review=false;
                both_markreview_radioselect=false;
              }*/
//              print("selected answer="+selected);
              singleLanguageQuestion.selectedOption = selected;
              question_json[index].qstn_id=theoryQuestion.id;
              int selected_option=singleLanguageQuestion.getSelectedOptionIndex();
              if(selected_option==1){
                question_json[index].qstn_answer="optiona";
              }else if(selected_option==2){
                question_json[index].qstn_answer="optionb";
              }else if(selected_option==3){
                question_json[index].qstn_answer="optionc";
              }else if(selected_option==4){
                question_json[index].qstn_answer="optiond";
              }
             question_status[index].isAnswer=true;
             if(!question_status[index].isReviewed){
               question_status[index].isReviewed=false;
             }
              question_status[index].isVisited=true;
               print("value of answer"+question_status.length.toString());
            }),
           picked:singleLanguageQuestion.selectedOption,
        ),
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    double percentage_height=0.33*height;
    actual_height=height-percentage_height;
    final title = 'Qusetion Screen';

    _init();

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: new TimerPage(),
          ),
          floatingActionButton: SpeedDial(
            // both default to 16
            marginRight: 18,
            marginBottom: 20,
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: true,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                  child: Icon(Icons.language),
                  backgroundColor: Colors.red,
                  label: 'English',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    setState((){
                      LocalStorageData.selected_lang="English";
                    });
                  }
              ),
              SpeedDialChild(
                  child: Icon(Icons.language),
                  backgroundColor: Colors.red,
                  label: 'hindi',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    setState((){
                      LocalStorageData.selected_lang="hindi";
                    });
                  }
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.blue,
                label: 'bengali',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="bengali";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.cyan,
                label: 'tamil',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="tamil";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.lightBlue,
                label: 'telugu',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="telugu";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.orange,
                label: 'gujarati',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="gujarati";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.lightBlueAccent,
                label: 'kannada',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="kannada";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.blueGrey,
                label: 'malayalam',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="malayalam";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.grey,
                label: 'marathi',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="marathi";
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.language),
                backgroundColor: Colors.pink,
                label: 'nepali',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: ()  {
                  setState((){
                    LocalStorageData.selected_lang="nepali";
                  });
                },
              ),
            ],
          ),

          body: ListView(
            scrollDirection: Axis.vertical,
            /*mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,*/
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0,
                child: ListView.builder(
                  itemBuilder: _getHorizontlData,
                  itemCount: GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions.length ??0,
                  scrollDirection: Axis.horizontal,
                ),
              ),

              /*@bishal
            *This below part is for timer
             */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5),
                    /*child:  Container(
                      width: 150,
                      height: 50,
                      color: Colors.red,
                      child: Center(
                          child: Text("00h 59m 55s", style: TextStyle(
                            fontSize: 25,
                          ),
                          )
                      ),
                    ),*/
                  ),

                  /*@bishal
               *This below part is for mark review
                */
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: CheckboxGroup(
                      labels: <String>[
                        "mark review",
                      ],
                      onSelected: (List<String> checked) => setState((){
                        /*   mark_review = true;
                          nothing_select=false;
                          both_markreview_radioselect=false;
                          if(radio_select){
                            both_markreview_radioselect=true;
                          }else{
                            radio_select=false;
                            both_markreview_radioselect=false;
                          }*/
                        if(!question_status[mainIndex].isAnswer) {
                          question_status[mainIndex].isAnswer = false;
                        }
                        question_status[mainIndex].isReviewed=true;
                        question_status[mainIndex].isVisited=true;
                        //question_status.indexOf(QuestionStatus(false, true, true, "unanswered"),mainIndex);
                      }),
                    ),
                  ),


                ],
              ),
              Container(
                  child: QuestionWidget(mainIndex)
              ),
              /*Container(
                child: QuestionWidget(mainIndex),
              ),*/
              /*@bishal
              *Next and previous button
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 0, 10),
                      child: MaterialButton(onPressed:(){
                        setState(() {
                          if(mainIndex !=0)
                            mainIndex = mainIndex - 1;
                          next_btn_text="Next";
                        });
                      } ,
                        minWidth: 100,
                        height: 50,
                        color: Colors.blue,
                        child: Text("Previous",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 10, 10),
                      child: MaterialButton(onPressed: (){
                        setState(() {
                          /*print("value of radio bollean"+radio_select.toString());
                          print("value of mark_review"+mark_review.toString());*/
                          /* if(both_markreview_radioselect){
                          select_color[mainIndex] = Colors.yellow;
                          }
                          else if(radio_select){
                            select_color[mainIndex] = Colors.green;
                          }
                          else if(mark_review){
                            select_color[mainIndex] = Colors.pink;
                          }
                          else {
                            select_color[mainIndex] = Colors.red;
                          }*/
                          if(!question_status[mainIndex].isReviewed &&
                              question_status[mainIndex].isVisited &&
                              !question_status[mainIndex].isAnswer){
                            select_color[mainIndex] = Colors.red;
                          }else if(!question_status[mainIndex].isReviewed&&
                              question_status[mainIndex].isVisited&&
                              question_status[mainIndex].isAnswer){
                            select_color[mainIndex] = Colors.lightGreen;
                            question_status[mainIndex].qstn_status="Answer";
                          }else if(question_status[mainIndex].isReviewed&&
                              question_status[mainIndex].isVisited&&
                              question_status[mainIndex].isAnswer){
                            select_color[mainIndex] = Colors.green;
                          }else if(question_status[mainIndex].isReviewed&&
                              question_status[mainIndex].isVisited&&
                              !question_status[mainIndex].isAnswer){
                            select_color[mainIndex] = Colors.pink;
                          }
                          if(mainIndex==GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions.length-1){
                            next_btn_text="Submit";
                          }
                          if(mainIndex<GetAssessorLoginModel.response.eventData.students[stdposition].theoryQuestions.length-1) {
                            mainIndex = mainIndex + 1;
                          }else{
                            _awaitReturnValueFromSummaryScreen(context);
                          }
                          /*nothing_select=true;
                          radio_select=false;
                          mark_review=false;*/

                        });
                      },
                        minWidth: 100,
                        height: 50,
                        color: Colors.blue,
                        child: Text(next_btn_text,style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      )
                  ),
                ],
              )
            ],
          )
      ),
    );
  }

}
class User {
  List<Language> language;

  User({this.language});

  User.fromJson(Map<String, dynamic> json) {
    if (json['language'] != null) {
      language = new List<Language>();
      json['language'].forEach((v) {
        language.add(new Language.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Language {
  Hindi hindi;

  Language({this.hindi});

  Language.fromJson(Map<String, dynamic> json) {
    hindi = json['hindi'] != null ? new Hindi.fromJson(json['hindi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hindi != null) {
      data['hindi'] = this.hindi.toJson();
    }
    return data;
  }
}

class Hindi {
  String question;
  String optiona;
  String optionb;
  String optionc;
  String optiond;

  Hindi(
      {this.question, this.optiona, this.optionb, this.optionc, this.optiond});

  Hindi.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    optiona = json['optiona'];
    optionb = json['optionb'];
    optionc = json['optionc'];
    optiond = json['optiond'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['optiona'] = this.optiona;
    data['optionb'] = this.optionb;
    data['optionc'] = this.optionc;
    data['optiond'] = this.optiond;
    return data;
  }
}






