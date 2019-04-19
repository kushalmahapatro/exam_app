import 'package:http/http.dart';
import 'package:meta/meta.dart';
export 'dart:convert';
export 'ApiConstants.dart';

Future<String> request_GET({@required Map<String, String> parameters, @required String url}) async {
  String result;
  try {
    if (parameters != null) {
      List<MapEntry> list = parameters.entries.toList();
      for(int i=0; i<list.length; i++) {
        MapEntry<String, String> entry = list[i];
        if(i==0 && !url.contains("?")) {
          url = url + "?" +entry.key +"="+ entry.value;
        }
        else if(url.endsWith("&")) {
          url = url + entry.key +"="+ entry.value;
        }
        else {
          url = url + "&" +entry.key +"="+ entry.value;
        }
      }
    }
    Response response = await get(url);
    if(response!=null && response.statusCode==200) {
      result = response.body;
      print(url+"::\n"+result);
    }
  } catch(e) {
    print(e);
    result = null;
  }
  return result;
}

// ignore: non_constant_identifier_names
Future<String> request_POST_header({@required Map<String, String> parameters, Map<String, String> body, @required String url}) async {
  String result;
  try {
    Response response = await post(url, headers: parameters, body: body);
    if(response!=null && response.statusCode==200) {
      result = response.body;
      print(url+"::\n"+result);
    }
  } catch(e) {
    print(e);
    result = null;
  }
  return result;
}