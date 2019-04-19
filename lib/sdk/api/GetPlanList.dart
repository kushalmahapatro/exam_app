import 'package:exam_app/sdk/ApiUtils.dart';

Future<GetPlanListModel> getPlanListApi(Map<String, String> parameters) async {
  try {
    return GetPlanListModel.fromJSON(await request_POST_header(
        parameters: parameters, url: getPlanListUrl()));
  }
  catch(e) {
    print(e);
    return null;
  }
}

class GetPlanListModel {
  final int statusCode;
  final String id;
  final String name;
  final String recurrence;
  final String frequency;
  final String studioId;
  final String status;
  final String languageId;
  final String price;
  final String trialPeriod;
  final String trialRecurrence;
  final CurrencyModel currencyDetails;


  GetPlanListModel(this.statusCode, this.id, this.name, this.recurrence,
      this.frequency, this.studioId, this.status, this.languageId, this.price,
      this.trialPeriod, this.trialRecurrence, this.currencyDetails);

  GetPlanListModel.fromJSON(String json)
      : assert(json != null),
        statusCode = (jsonDecode(json) as Map)["code"] as int ?? 0,
        id = (jsonDecode(json) as Map)["id"] as String ?? "",
        name = (jsonDecode(json) as Map)["name"] as String ?? "",
        recurrence = (jsonDecode(json) as Map)["recurrence"] as String ?? "",
        frequency = (jsonDecode(json) as Map)["frequency"] as String ?? "",
        studioId = (jsonDecode(json) as Map)["studio_id"] as String ?? "",
        status = (jsonDecode(json) as Map)["status"] as String ?? "",
        languageId = (jsonDecode(json) as Map)["language_id"] as String ?? "",
        price = (jsonDecode(json) as Map)["price"] as String ?? "",
        trialPeriod = (jsonDecode(json) as Map)["trial_period"] as String ?? "",
        trialRecurrence = (jsonDecode(json) as Map)["trial_recurrence"] as String ?? "",
        currencyDetails = CurrencyModel.fromJSON((jsonDecode(json) as Map)["currency"] as String ?? "{}");
}

class CurrencyModel {
  final String currencyId;
  final String currencyCode;
  final String currencySymbol;

  CurrencyModel(this.currencyId, this.currencyCode,
      this.currencySymbol);

  CurrencyModel.fromJSON(String json)
      : assert(json != null),
        currencyId = (jsonDecode(json) as Map)["currency"] as String ?? "",
        currencyCode = (jsonDecode(json) as Map)["currencyCode"] as String ?? "",
        currencySymbol = (jsonDecode(json) as Map)["symbol"] as String ?? "\$";

}