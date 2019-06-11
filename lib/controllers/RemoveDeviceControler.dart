import 'package:exam_app/sdk/api/GetRemoveDevice.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:meta/meta.dart';
import 'package:exam_app/utils/Utils.dart';

class RemoveDeviceController  {
  final RemoveDeviceListener listener;

  RemoveDeviceController({@required this.listener});

  void callApi(int index,String device_name) async {
    try {
      GetRemoveDeviceModel getSettings = await GetRemoveDeviceAPI(
          {'Client-Service': 'frontend-client', 'Auth-Key' : 'simplerestapi', 'Content-Type':'application/x-www-form-urlencoded'
           ,'Authorization':GetAssessorLoginModel.response.token,'User-ID':GetAssessorLoginModel.response.userId},
          {'module' : 'events', 'service' : 'freeDevice','event_id' : GetAssessorLoginModel.response.eventData.id,
            'student_code' : GetAssessorLoginModel.response.eventData.students[index].studentCode,
            'device_id' : device_name}
          );
      listener.onRemoveApiSuccess(model: getSettings);
      await new Future.delayed(const Duration(milliseconds: 3000));
      //listener.RemoverouteTo(route: Routes.LOGIN);
    }catch (e){
     // listener.onRemoveApiFailure(failure: Failures.NO_INTERNET);
    }
  }

}

abstract class RemoveDeviceListener {
  //void onRemoveApiFailure({@required Failures failure});
  void onRemoveApiSuccess({@required GetRemoveDeviceModel model});
  //void RemoverouteTo({@required Routes route});
}

enum Failures { NO_INTERNET, UNKNOWN }

enum Routes { LOGIN, HOME, MY_DOWNLOADS }


