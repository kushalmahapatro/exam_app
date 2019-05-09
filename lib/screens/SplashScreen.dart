import 'dart:ui';
import 'package:exam_app/controllers/SplashScreenController.dart';
import 'package:exam_app/screens/Login.dart';
import 'package:exam_app/sdk/api/GetSettings.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/screens/VivaTestScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    implements SplashScreenListener {
  SplashScreenController controller;
  bool apiResponse = false;
  GetSettingsModel modelAPI;

  _SplashScreenState() {
    controller = SplashScreenController(listener: this);
    controller.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        body: new Container(
          color: primaryColor,
          padding: EdgeInsets.only(top: 0.0),
          width: double.infinity,
          height: double.infinity,
          child: apiResponse
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[logoWidget(), textWidget()],
                )
              : Container(),
        ));
  }

  Widget textWidget() {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            modelAPI.response.companyName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30.0),
          ),
        ));
  }

  Widget logoWidget() {
    return Center(
      child: Image.network(
        modelAPI.response.companyLogo,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void onApiFailure({@required Failures failure}) {
    switch (failure) {
      case Failures.NO_INTERNET:
        break;

      default:
        break;
    }
  }

  @override
  void routeTo({@required Routes route}) {
    switch (route) {
      case Routes.LOGIN:
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (c) => new Login()));
        break;
      case Routes.HOME:
        /* Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (c) => new HomePage()));*/
        break;
      default:
        break;
    }
  }

  @override
  void onApiSuccess({GetSettingsModel model}) {
    // TODO: implement onApiSuccess
    print(model.toString());
    setState(() {
      modelAPI = model;
      apiResponse = true;
    });
  }
}
