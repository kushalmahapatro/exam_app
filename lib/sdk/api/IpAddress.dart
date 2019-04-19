import 'package:exam_app/sdk/ApiUtils.dart';

Future<IpAddressModel> ipAddressApi() async {
  try {
    return IpAddressModel.fromJSON(await request_GET(parameters: null, url: ipAddressUrl()));
  } catch (e) {print(e);}
  return null;
}

class IpAddressModel {
  final String ipAddress;

  IpAddressModel(this.ipAddress) : assert(ipAddress!=null);

  IpAddressModel.fromJSON(String json) :
        assert(json!=null),
        ipAddress=(jsonDecode(json) as Map)["ip"] as String ?? "";
}