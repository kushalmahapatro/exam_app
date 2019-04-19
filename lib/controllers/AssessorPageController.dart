
import 'package:exam_app/sdk/api/GetAssessor.dart';
import 'package:flutter/material.dart';

class AssessorPageController {
  final AssessorPageListener listener;
  AssessorPageController({@required this.listener});

  void callAPI() async{
    try{
      GetAssessorModel getAssessor = await getAssessorAPI(null, { "module":"users",
      "service":"getAssessors",
      "user_type": "Assessor",
      "order_by":"id",
      "order_value":"ASC",
      "start":"1",
      "page_size":"10",
      "relational_modules":"",});
      listener.onAPISuccess(model: getAssessor);

    }catch(e){
      print(e);
      listener.onAPIFailure(message: e.toString());
    }
  }
}

abstract class AssessorPageListener {
  void onAPIFailure ({ @required String message });
  void onAPISuccess ({@required GetAssessorModel model});
}