import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Qusetion Screen';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0,
                child: ListView.builder(
                  itemBuilder: _getHorizontlData,
                  itemCount: AssessorLoginModel.getInstance(Map()).eventData.students.length,
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
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Colors.red,
                      child: Center(
                          child: Text("00h 59m 55s",style: TextStyle(
                            fontSize: 25,
                          ),
                          )
                      ),
                    ),
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
                        onSelected: (List<String> checked) => print(checked.toString())
                    ),
                  ),


                ],
              ),

              /*@bishal
            *To show the Question number
             */
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Q1",style: TextStyle(
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
                child:  Text("Identify the design of the gun and select the answer from below",style: TextStyle(
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
                    "Option A",
                    "Option B",
                    "Option C",
                    "Option D",
                  ],
                  onSelected: (String selected) => print(selected)
              ),

              /*@bishal
              *Next and previous button
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 10),
                    child: MaterialButton(onPressed: null,
                      minWidth: 100,
                      height: 50,
                      color: Colors.blue,
                      child: Text("Previous"),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 10, 10),
                    child: MaterialButton(onPressed: null,
                    minWidth: 100,
                    height: 50,
                    color: Colors.blue,
                    child: Text("Next"),
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

Widget _getHorizontlData(BuildContext context,int index) {
  return GestureDetector(
    onTap: (){
      //QuestionWidget();
      },
   child: Container(
     width: 50,
     height: 50.0,
     padding: EdgeInsets.all(5),
     color: Colors.transparent,
     child: new Container(
         decoration: new BoxDecoration(
           color: Colors.transparent,
           border: Border.all(
               color: Colors.black
           ),
         ),
         child: new Center(
           child: new Text(index.toString()),
         )
     ),
   ),
  );
}

Widget QuestionWidget(){
  return Container(
    child:  Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text("Q7",style: TextStyle(
            fontSize: 25,
            color: Colors.black
        ),
        ),
      ),
    ),
  );
}


