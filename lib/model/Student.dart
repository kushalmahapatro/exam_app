import 'package:exam_app/model/TheoryQuestion.dart';
export 'package:exam_app/model/TheoryQuestion.dart';
import 'package:exam_app/model/VivaQuestion.dart';
export 'package:exam_app/model/VivaQuestion.dart';

class Student {
  String id;
  String studentCode;
  String  studentRollNo;
  String batch;
  String name;
  String fatherName;
  String password;
  String gender;
  String  profilePic;
  String examStatus;
  String syncStatus;
  String  deviceId;
  String  aadharPic;
  String vivaStatus;
  List<TheoryQuestion> theoryQuestions;
  List<VivaQuestion> vivaQuestions;

  Student(
      {this.id,
        this.studentCode,
        this.studentRollNo,
        this.batch,
        this.name,
        this.fatherName,
        this.password,
        this.gender,
        this.profilePic,
        this.examStatus,
        this.syncStatus,
        this.deviceId,
        this.aadharPic,
        this.vivaStatus,
        this.theoryQuestions,
        this.vivaQuestions});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    studentCode = json['student_code'] ?? "";
    studentRollNo = json['student_roll_no'] ?? "";
    batch = json['batch'] ?? "";
    name = json['name'] ?? "";
    fatherName = json['father_name'] ?? "";
    password = json['password'] ?? "";
    gender = json['gender'] ?? "";
    profilePic = json['profile_pic'] ?? "";
    examStatus = json['exam_status'] ?? "";
    syncStatus = json['sync_status'] ?? "";
    deviceId = json['device_id'] ?? "";
    aadharPic = json['aadhar_pic'] ?? "";
    vivaStatus = json['viva_status'] ?? "";
    theoryQuestions = new List<TheoryQuestion>();
    if (json['theory_questions'] != null) {
      json['theory_questions'].forEach((v) {
        theoryQuestions.add(new TheoryQuestion.fromJson(v));
      });
    }
    vivaQuestions = new List<VivaQuestion>();
    if (json['viva_questions'] != null) {
      json['viva_questions'].forEach((v) {
        vivaQuestions.add(new VivaQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_code'] = this.studentCode;
    data['student_roll_no'] = this.studentRollNo;
    data['batch'] = this.batch;
    data['name'] = this.name;
    data['father_name'] = this.fatherName;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['exam_status'] = this.examStatus;
    data['sync_status'] = this.syncStatus;
    data['device_id'] = this.deviceId;
    data['aadhar_pic'] = this.aadharPic;
    data['viva_status'] = this.vivaStatus;
    if (this.theoryQuestions != null) {
      data['theory_questions'] =
          this.theoryQuestions.map((v) => v.toJson()).toList();
    }
    if (this.vivaQuestions != null) {
      data['viva_questions'] =
          this.vivaQuestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
