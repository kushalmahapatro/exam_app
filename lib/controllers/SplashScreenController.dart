import 'package:exam_app/sdk/api/GetSettings.dart';
import 'package:meta/meta.dart';
import 'package:exam_app/utils/Utils.dart';

class SplashScreenController  {
  final SplashScreenListener listener;

  SplashScreenController({@required this.listener});

  void callApi() async {
    try {
      GetSettingsModel getSettings = await GetSettingsAPI(
          {'Client-Service': 'frontend-client', 'Auth-Key' : 'simplerestapi', 'Content-Type':'application/x-www-form-urlencoded'},
          {'module' : 'settings', 'service' : 'getSettings'}
          );
      listener.onApiSuccess(model: getSettings);
      await new Future.delayed(const Duration(milliseconds: 3000));
      listener.routeTo(route: Routes.LOGIN);
    }catch (e){
      listener.onApiFailure(failure: Failures.NO_INTERNET);
    }
  }

}

abstract class SplashScreenListener {
  void onApiFailure({@required Failures failure});
  void onApiSuccess({@required GetSettingsModel model});
  void routeTo({@required Routes route});
}

enum Failures { NO_INTERNET, UNKNOWN }

enum Routes { LOGIN, HOME, MY_DOWNLOADS }


