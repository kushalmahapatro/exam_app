import 'package:exam_app/sdk/ApiUtils.dart';

Future<LanguageListModel> getLanguageListApi(Map<String, String> parameters) async {
  try {
    return LanguageListModel.fromJSON(await request_POST_header(parameters: parameters, url: getLanguageListUrl()));
  }
  catch(e) {
    print(e);
  }
  return null;
}

class LanguageListModel {
  final int statusCode;
  final List<LanguageModel> languageList;
  final String defaultLanguage;
  final String message;

  LanguageListModel(this.statusCode, this.languageList, this.defaultLanguage,
      this.message);

  LanguageListModel.fromJSON(String json)
      : assert(json != null),
        statusCode = (jsonDecode(json) as Map)["code"] as int ?? 0,
        defaultLanguage = (jsonDecode(json) as Map)["default_lang"] as String ?? "en",
        message = (jsonDecode(json) as Map)["msg"] as String ?? "",
        languageList = _getLangList((jsonDecode(json) as Map)["lang_list"] as String ?? "[]");


  static List<LanguageModel> _getLangList(String jsonArray) {
    if((jsonDecode(jsonArray) as List)==null)
      return List<LanguageModel>();
    else
      return List<LanguageModel>.generate(
    (jsonDecode(jsonArray) as List).length,
    (i)=>LanguageModel.fromJSON((jsonDecode(jsonArray) as List)[i] as String ?? "{}")
    );
  }


}

class LanguageModel {
  final String languageCode;
  final String languageName;

  LanguageModel(this.languageCode, this.languageName);

  LanguageModel.fromJSON(String json)
      : assert(json != null),
        languageCode = (jsonDecode(json) as Map)["code"] as String ?? "",
        languageName = (jsonDecode(json) as Map)["language"] as String ?? "";
}