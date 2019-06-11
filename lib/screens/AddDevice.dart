import 'package:exam_app/sdk/api/GetAddDevice.dart';
import 'package:exam_app/sdk/api/GetRemoveDevice.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/controllers/AddDeviceControler.dart';
import 'package:exam_app/controllers/RemoveDeviceControler.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:exam_app/model/city.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart' show PlatformException;
import 'package:exam_app/screens/Login.dart';

class AddDevice extends StatefulWidget {
  GetAssessorLoginModel model;
  AddDevice({Key key, this.model }) : super(key: key);
  @override
  _AddDeviceState createState() {
   return _AddDeviceState();
  }//=> _AddDeviceState(model);
}

class _AddDeviceState extends State<AddDevice> implements AddDeviceListener,RemoveDeviceListener{
  int clickindex;
  AddDeviceController controller;
  RemoveDeviceController removecontroller;
  BuildContext _scaffoldContext;
  GetAssessorLoginModel model;
  String btntext="Add";
  int mainindex;
  double height;
  double actual_height;
  List<String> listbtntext;
  static String device_name;
  _AddDeviceState(){
    getDeviceDetails();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listbtntext=new List(GetAssessorLoginModel.response.eventData.students.length);
    for (int i =0 ; i< listbtntext.length; i++) {
      print("device id of student name"+GetAssessorLoginModel.response.eventData.students[i].deviceId);
      if (GetAssessorLoginModel.response.eventData.students[i].deviceId =="") {
        listbtntext[i] = "Add";
      } else {
        listbtntext[i] = "Remove";
      }
    }
  }

   callAddDeviceAPi(int index) {
    this.clickindex=index;
    controller = AddDeviceController(listener: this);
    controller.callApi(index,device_name);
  }
  callRemoveDeviceAPi(int index) {
    this.clickindex=index;
    removecontroller = RemoveDeviceController(listener: this);
    removecontroller.callApi(index,device_name);

  }
  /*@override
  initState() {
    super.initState();
    btntext="Add";
  }
  _changeButtonText(){
    //setState(() {
      return Container(
        child: Text(btntext,
            style: TextStyle(
                color: Colors.black
            )
        ),
      );
   // });

  }*/

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Student List"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: getHomePageBody(context)),
            Container(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (c)=>Login()));
                },
                minWidth: 100,
                height: 50,
                color: Colors.blue,
                child: Text("Submit",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white
                ),
                ),
              ),
            ),

          ],
        )
    );
  }

  getHomePageBody(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    double percentage_height=0.30*height;
    actual_height=height-percentage_height;
    return Container(
      height: actual_height,
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
            child: MaterialButton(
                minWidth: 100,
                height: 50,
                color: Colors.blue,
              onPressed: (){
                setState(() {
                    print("selected btn text"+listbtntext[index].toString());
                    if(listbtntext[index].toString()=="Add"){
                      callAddDeviceAPi(index);
                    }else{
                      callRemoveDeviceAPi(index);
                    }

                });
              },
              child:Text(listbtntext[index], style: TextStyle(color: Colors.white,fontSize: 15.0))
            ),
          ),

        ],
      ),

    );
  }
  static Future<List<String>> getDeviceDetails() async {
    String deviceName;
    String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        print("device name"+deviceName);
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor;//UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    device_name=deviceName;
//if (!mounted) return;
    return [deviceName, deviceVersion, identifier];
  }
  _showSnackBar(BuildContext context, City item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.name} is a city in ${item.country}"),
      backgroundColor: Colors.amber,
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }

 /* @override
  void onApiFailure({Failures failure}) {
    // TODO: implement onApiFailure
  }*/

  @override
  void onApiSuccess({GetAddDeviceModel model}) {
    // TODO: implement onApiSuccess
    if(model.responseCode==200) {
      GetAssessorLoginModel.response.eventData.students[clickindex].deviceId=device_name;
      setState(() {
        listbtntext[clickindex] = "Remove";
      });
    }
  }

 /* @override
  void routeTo({Routes route}) {
    // TODO: implement routeTo
  }

  @override
  void RemoverouteTo({Routes route}) {
    // TODO: implement RemoverouteTo
  }
*/
  /*@override
  void onRemoveApiFailure({Failures removefailure}) {
    // TODO: implement onRemoveApiFailure
  }
*/
  @override
  void onRemoveApiSuccess({GetRemoveDeviceModel model}) {
    // TODO: implement onRemoveApiSuccess
    if (model.responseCode == 200) {
      GetAssessorLoginModel.response.eventData.students[clickindex].deviceId="";
      setState(() {
        listbtntext[clickindex] = "Add";
      });
    }
  }


}
