import 'package:exam_app/sdk/api/GetSyncApi.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:meta/meta.dart';
import 'package:exam_app/utils/Utils.dart';

class SyncApiController  {
  final SyncApiListener listener;

  SyncApiController({@required this.listener});

  void callApi(int index,String question_json) async {
    try {
      SyncApiModel getSettings = await GetSyncApiModel(
          {'Client-Service': 'frontend-client', 'Auth-Key' : 'simplerestapi', 'Content-Type':'application/x-www-form-urlencoded'
           ,'Authorization':GetAssessorLoginModel.response.token,'User-ID':GetAssessorLoginModel.response.userId},
          {'module' : 'events', 'service' : 'syncTheory','event_id' : GetAssessorLoginModel.response.eventData.id,
            'student_code' : GetAssessorLoginModel.response.eventData.students[index].studentCode,
            'student_question_array' : question_json}
          );
      listener.onApiSuccess(model: getSettings);
      await new Future.delayed(const Duration(milliseconds: 3000));
      listener.routeTo(route: Routes.LOGIN);
    }catch (e){
      listener.onApiFailure(failure: Failures.NO_INTERNET);
    }
  }

}

abstract class SyncApiListener {
  void onApiFailure({@required Failures failure});
  void onApiSuccess({@required SyncApiModel model});
  void routeTo({@required Routes route});
}

enum Failures { NO_INTERNET, UNKNOWN }

enum Routes { LOGIN, HOME, MY_DOWNLOADS }


