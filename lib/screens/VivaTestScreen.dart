import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class VivaTestScreen extends StatefulWidget {
  @override
  _VivaTestScreenState createState() => _VivaTestScreenState();
}

class _VivaTestScreenState extends State<VivaTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VivaTestScreen"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("1608790990",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text("Bishal Kumar Seth",style: TextStyle(
              fontSize:25,
                fontWeight:FontWeight.bold,

            ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Q1",style: TextStyle(
                fontSize:25,
                fontWeight:FontWeight.bold,

              ),
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.all(20),
            child: Text("Practically you have been assign a task to guard a pemises.Demostrate the knowledge of steps that "
                "should be performed for illegal requiremnets to be connfirmed while undertaking security task."),
          ),


          Container(
              width: 350,
              height: 400,
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: _questionoptionui,
                itemCount: 16,
                padding: EdgeInsets.all(5),
              )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: MaterialButton(onPressed: null,
                  minWidth: 100,
                  height: 50,
                  color: Colors.blue,
                  child: Text("Previous"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: MaterialButton(onPressed: null,
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

  Widget _questionoptionui(BuildContext context,index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:EdgeInsets.all(5),
          child: Text("CAndidate knows the legalprovision applicable for the given task and asks the appropriate"
              " question to understand the job role in case of any doubts"),
        ),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           RadioButtonGroup(
             labels: <String>[
               "No Answer",
               "Poor",
               "Good",
               "Very Good",
               "   Excellent",
             ],
             orientation: GroupedButtonsOrientation.HORIZONTAL,
             padding: EdgeInsets.all(10),

             onSelected: (String selected) => print(selected),
           ),
         ],
       )
      ],
    );
  }
}

