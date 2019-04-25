
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:flutter/material.dart';

class AssessorLoginController {
  final AssessorLoginListener listener;
  AssessorLoginController({@required this.listener});

  void callAPI(String id, String password) async{
    try{
      GetAssessorLoginModel getAssessorLogin = await getAssessorLoginAPI({"Client-Service":"frontend-client",
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
  void onLoginSuccess ({@required GetAssessorLoginModel model});
}