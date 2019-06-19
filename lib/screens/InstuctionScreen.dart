import 'package:flutter/material.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/screens/QuestionScreen.dart';
//import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:exam_app/model/LocalStorageData.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class InstuctionScreen extends StatefulWidget {
  GetAssessorLoginModel model;
  InstuctionScreen({Key key,this.model}) : super(key: key);
  @override
  _InstuctionScreenState createState() => _InstuctionScreenState(model);
}


class _InstuctionScreenState extends State<InstuctionScreen> {
  GetAssessorLoginModel model;
  _InstuctionScreenState(this.model);
  static String html='';
  List<CustomPopupMenu> choices = <CustomPopupMenu>[
    CustomPopupMenu(title: 'Home', icon: Icons.home),
    CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
    CustomPopupMenu(title: 'Settings', icon: Icons.settings),
  ];
@override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("selected lang=="+LocalStorageData.selected_lang);
    print("instructionLanguage lang=="+LocalStorageData.instructionLanguage['hindi']);
    if(LocalStorageData.selected_lang=="English"){
      html=GetAssessorLoginModel.response.eventData.instruction;
    }else{
      html=LocalStorageData.instructionLanguage[LocalStorageData.selected_lang];
    }


  }

  @override
  Widget build(BuildContext context) {
    String markdown;
    if(LocalStorageData.selected_lang=="English"){
      markdown = html2md.convert(GetAssessorLoginModel.response.eventData.instruction);
    }else{
      markdown = html2md.convert(html);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Instuction Screen"),
/*        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: null,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],*/
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        //verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
            height: 420,
            child: Center(
              child: MarkdownBody(
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(p: Theme.of(context).textTheme.body1.copyWith(fontSize: 20.0)),
                data: markdown,
              ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: MaterialButton(
                  minWidth: 150,
                  height: 50,
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (c) => new QuestionScreen()));
                  },
                  child: Text("Next",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}
