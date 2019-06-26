import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:exam_app/screens/VideoScreen.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:exam_app/model/LocalStorageData.dart';
import 'dart:io' as Io;
import 'package:permission/permission.dart';
//import 'package:simple_permissions/simple_permissions.dart';

void main() {
  runApp(new TakeStudentPic());
}

class TakeStudentPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UserOptions(),
    );
  }
}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
  var knockDir;
  var dir;
  String student_code;
  int stdposition;
//save the result of gallery file
  File profileFile;

//save the result of camera file
  File adhaarFile;
  @override
  Widget build(BuildContext context) {

    //display image selected from gallery
    /*imageSelectorGallery() async {
      profileFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + profileFile.path);
      setState(() {});
    }*/

    //display image selected from camera
    imageSelectorAdhaar() async {
      var permissionNames = await Permission.requestPermissions([PermissionName.Storage, PermissionName.Camera]);
      stdposition=LocalStorageData.std_position;
      File _image;
      adhaarFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 200.0,
        maxWidth: 200.0,
      );
      //requestPermission();
      student_code=GetAssessorLoginModel.response.eventData.students[stdposition].studentCode;
      dir = await getExternalStorageDirectory();
      var deletedir =
      await new Directory('${dir.path}/Assesmentportal/'+student_code+'').create(recursive: true);
      deletedir.deleteSync(recursive: true);///
      knockDir =
      await new Directory('${dir.path}/Assesmentportal/'+student_code+'').create(recursive: true);
      print("directory=="+knockDir.toString());
      //final dir = await getExternalStorageDirectory();
      final String path = dir.path;
     // Img.Image image = Img.decodeImage(adhaarFile.readAsBytesSync());
     // Img.Image thumbnail = Img.copyResize(image, 120);
      final File finalImage = await adhaarFile.copy('${knockDir.path}/adhaar.png');
      print("path== " + path);
      print("You selected camera image : " + adhaarFile.path);
      setState(() {
        //_image = finalImage;
      });
    }
    imageSelectorProfile() async {
      File _image;
      profileFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 200.0,
        maxWidth: 200.0,
      );
      dir = await getExternalStorageDirectory();
      knockDir =
      await new Directory('${dir.path}/Assesmentportal/'+student_code+'').create(recursive: true);
      final String path = dir.path;
      final File finalImage = await profileFile.copy('${knockDir.path}/profile.png');
      print("You selected camera image : " + profileFile.path);
      setState(() {
        //_image = finalImage;
      });
      //setState(() {});
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Student Picture"),
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return new Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: new MaterialButton(
                          minWidth: 100,
                          height: 50,
                          color: Colors.blue,
                          child: new Text('Adhaar Pic',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                          onPressed: imageSelectorAdhaar,
                        ),
                      ),

                      Spacer(flex: 10,),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: new MaterialButton(
                          minWidth: 100,
                          height: 50,
                          color: Colors.blue,
                          child: new Text('Profile Pic',style: TextStyle(color: Colors.white,fontSize: 20.0)),
                          onPressed: imageSelectorProfile,
                        ),
                      ),
                    ]
                ),
                Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 40, 0, 10),
                        child: displaySelectedFile(adhaarFile),
                      ),
                      Spacer(flex: 10,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 40, 0, 10),
                        child: displaySelectedFile(profileFile),
                      )
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: new MaterialButton(
                        minWidth: 150,
                        height: 50,
                        color: Colors.blue,
                        child: new Text('Next',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (c)=>VideoScreen()));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
 /* void requestPermission() async{
    Permission permission;
    PermissionStatus result = await SimplePermissions.requestPermission(permission);
    print("request :"+ result.toString());
  }*/
  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 150.0,
      width: 100.0,
      child: file == null
          ? new Text('select image')
          : new Image.file(file),
    );
  }

}
