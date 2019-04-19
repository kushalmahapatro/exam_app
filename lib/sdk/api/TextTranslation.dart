import 'package:exam_app/sdk/ApiUtils.dart';

Future<TextTranslationModel> textTranslationApi(Map<String, String> parameters) async {
  try {
    return TextTranslationModel.fromJSON(await request_POST_header(parameters: parameters, url: textTranslationUrl()));
  } catch(e) {
    print(e);
  }
  return null;
}

class TextTranslationModel {
  final Map<String, String> translations;

  TextTranslationModel(this.translations);

  TextTranslationModel.fromJSON(String json)
      : assert(json != null),
        translations = jsonDecode(json) as Map<String, String>;

  TextTranslationModel.clone(TextTranslationModel model, {Map<String, String> translations})
      : assert(model!=null),
        this.translations = translations ?? model.translations;
}