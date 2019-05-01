import 'dart:convert';
import 'package:exam_app/model/Student.dart';
export 'package:exam_app/model/Student.dart';

class EventData {
  String id;
  String name;
  String slug;
  String urlSlug;
  String logo;
  String date;
  String status;
  String createdDate;
  String modifiedDate;
  String deleted;
  String assessorId;
  String instruction;
  String supportPhone;
  String supportEmail;
  String duration;
  String testSecretCode;
  String testStatus;
  Map<String, String> instructionLanguage;
  List<Student> students;

  EventData(
      {this.id,
        this.name,
        this.slug,
        this.urlSlug,
        this.logo,
        this.date,
        this.status,
        this.createdDate,
        this.modifiedDate,
        this.deleted,
        this.assessorId,
        this.instruction,
        this.supportPhone,
        this.supportEmail,
        this.duration,
        this.testSecretCode,
        this.testStatus,
        this.instructionLanguage,
        this.students});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    urlSlug = json['url_slug'] ?? "";
    logo = json['logo'] ?? "";
    date = json['date'] ?? "";
    status = json['status'] ?? "";
    createdDate = json['created_date'] ?? "";
    modifiedDate = json['modified_date'] ?? "";
    deleted = json['deleted'] ?? "";
    assessorId = json['assessor_id'] ?? "";
    instruction = json['instruction'] ?? "";
    supportPhone = json['support_phone'] ?? "";
    supportEmail = json['support_email'] ?? "";
    duration = json['duration'] ?? "";
    testSecretCode = json['test_secret_code'] ?? "";
    testStatus = json['test_status'] ?? "";
    instructionLanguage = jsonDecode(json['instruction_language'] as String) ?? Map<String, String>();
    students = new List<Student>();
    if (json['students'] != null) {
      json['students'].forEach((v) {
        students.add(new Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['url_slug'] = this.urlSlug;
    data['logo'] = this.logo;
    data['date'] = this.date;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['deleted'] = this.deleted;
    data['assessor_id'] = this.assessorId;
    data['instruction'] = this.instruction;
    data['support_phone'] = this.supportPhone;
    data['support_email'] = this.supportEmail;
    data['duration'] = this.duration;
    data['test_secret_code'] = this.testSecretCode;
    data['test_status'] = this.testStatus;
    data['instruction_language'] = this.instructionLanguage;
    if (this.students != null) {
      data['students'] = this.students.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
