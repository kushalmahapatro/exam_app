import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:exam_app/screens/VideoScreen.dart';
import 'dart:io' as Io;
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
      File _image;
      adhaarFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 200.0,
        maxWidth: 200.0,
      );
      //requestPermission();
      dir = await getExternalStorageDirectory();
      knockDir =
      await new Directory('${dir.path}/Assesmentportal').create(recursive: true);
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
        title: new Text('Student Picture',
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
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
                        child: new RaisedButton(
                          child: new Text('Adhaar Pic'),
                          onPressed: imageSelectorAdhaar,
                        ),
                      ),

                      Spacer(flex: 10,),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: new RaisedButton(
                          child: new Text('Profile Pic'),
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
                      child: new RaisedButton(
                        child: new Text('Next'),
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