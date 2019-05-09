
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/model/AcessorLogin.dart';
export 'package:exam_app/model/AcessorLogin.dart';

class AssessorLoginController {
  final AssessorLoginListener listener;
  AssessorLoginController({@required this.listener});

  void callAPI(String id, String password) async{
    try{
      AssessorLoginModel getAssessorLogin = await getAssessorLoginAPI({"Client-Service":"frontend-client",
      "Auth-Key":"simplerestapi"}, { "user_id": id,
      "password": password,});
      listener.onLoginSuccess(model: getAssessorLogin);

    }catch(e){
      print(e);
      listener.onLoginFailure(message: e.toString());
    }
  }
}

abstract class AssessorLoginListener {
  void onLoginFailure ({ @required String message });
  void onLoginSuccess ({@required AssessorLoginModel model});
}