import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:exam_app/screens/InstructionScreen.dart';

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
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      //final dir = await getExternalStorageDirectory();
      //final String path = dir.path;
      //final File finalImage = await cameraFile.copy('$path/image1.png');
     // print("path== " + path);
      print("You selected camera image : " + adhaarFile.path);
      setState(() {
        //_image = finalImage;
      });
      //setState(() {});
    }
    imageSelectorProfile() async {
      File _image;
      profileFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
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
                          Navigator.push(context,MaterialPageRoute(builder: (c)=>InstuctionScreen()));
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

  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 150.0,
      width: 100.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('select image')
          : new Image.file(file),
    );
  }
}