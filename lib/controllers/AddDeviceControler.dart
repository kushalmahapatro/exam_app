import 'package:exam_app/sdk/api/GetAddDevice.dart';
import 'package:exam_app/sdk/api/GetAssessorLogin.dart';
import 'package:meta/meta.dart';
import 'package:exam_app/utils/Utils.dart';

class AddDeviceController  {
  final AddDeviceListener listener;

  AddDeviceController({@required this.listener});

  void callApi(int index,String device_name) async {
    try {
      GetAddDeviceModel getSettings = await GetAddDeviceAPI(
          {'Client-Service': 'frontend-client', 'Auth-Key' : 'simplerestapi', 'Content-Type':'application/x-www-form-urlencoded'
           ,'Authorization':GetAssessorLoginModel.response.token,'User-ID':GetAssessorLoginModel.response.userId},
          {'module' : 'events', 'service' : 'setDevice','event_id' : GetAssessorLoginModel.response.eventData.id,
            'student_code' : GetAssessorLoginModel.response.eventData.students[index].studentCode,
            'device_id' : device_name}
          );
      listener.onApiSuccess(model: getSettings);
      await new Future.delayed(const Duration(milliseconds: 3000));
      //listener.routeTo(route: Routes.LOGIN);
    }catch (e){
      //listener.onApiFailure(failure: Failures.NO_INTERNET);
    }
  }

}

abstract class AddDeviceListener {
  //void onApiFailure({@required Failures failure});
  void onApiSuccess({@required GetAddDeviceModel model});
  //void routeTo({@required Routes route});
}

enum Failures { NO_INTERNET, UNKNOWN }

enum Routes { LOGIN, HOME, MY_DOWNLOADS }


