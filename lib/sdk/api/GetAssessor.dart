import 'dart:convert';
import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';

Future<GetAssessorModel> getAssessorAPI(
    Map<String, String> params, Map<String, String> body) async {
  try {
    return GetAssessorModel.fromJson(await request_POST_header(
        parameters: params, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}

class GetAssessorModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  List<Response> response;

  GetAssessorModel(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.response});

  GetAssessorModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      response = new List<Response>();
      json['Response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseMessage'] = this.responseMessage;
    if (this.response != null) {
      data['Response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String id;
  String username;
  String password;
  String firstName;
  String lastName;
  String userType;
  String email;
  String phone;
  String stateId;
  String cityId;
  String hash_Code;
  String companyName;
  String supportEmail;
  String supportPhone;
  String userProfilePic;
  String createdDate;
  String modifiedDate;
  String status;
  String deleted;
  String createdBy;
  String modifiedBy;
  String ownerId;
  String assignedId;

  Response(
      {this.id,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.userType,
      this.email,
      this.phone,
      this.stateId,
      this.cityId,
      this.hash_Code,
      this.companyName,
      this.supportEmail,
      this.supportPhone,
      this.userProfilePic,
      this.createdDate,
      this.modifiedDate,
      this.status,
      this.deleted,
      this.createdBy,
      this.modifiedBy,
      this.ownerId,
      this.assignedId});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    phone = json['phone'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    hash_Code = json['hash_code'] ?? "";
    companyName = json['company_name'];
    supportEmail = json['support_email'];
    supportPhone = json['support_phone'];
    userProfilePic =  json['user_profile_pic'] != null ?  json['user_profile_pic'] : "";
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    status = json['status'];
    deleted = json['deleted'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    ownerId = json['owner_id'];
    assignedId = json['assigned_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['hash_code'] = this.hash_Code;
    data['company_name'] = this.companyName;
    data['support_email'] = this.supportEmail;
    data['support_phone'] = this.supportPhone;
    data['user_profile_pic'] = this.userProfilePic;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['owner_id'] = this.ownerId;
    data['assigned_id'] = this.assignedId;
    return data;
  }
}
