import 'dart:convert';
import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';

Future<GetAssessorLoginModel> getAssessorLoginAPI(
    Map<String, String> params, Map<String, String> body) async {
  try {
    return GetAssessorLoginModel.fromJson(await request_POST_header(
        parameters: params, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}

/*class GetAssessorLoginModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  String response;

  GetAssessorLoginModel(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.response});

  GetAssessorLoginModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      response = json['Response'].toString();
    }
  }
}*/
class GetAssessorLoginModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  Response response;

  GetAssessorLoginModel(
      {this.responseCode,
        this.responseStatus,
        this.responseMessage,
        this.response});

  GetAssessorLoginModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);

    responseCode = json['ResponseCode'] != null
                   ? json['ResponseCode']:0;
    responseStatus = json['ResponseStatus'] != null
                     ? json['ResponseStatus']:null;
    responseMessage = json['ResponseMessage'] != null
                      ? json['ResponseMessage']:null;
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseMessage'] = this.responseMessage;
    if (this.response != null) {
      data['Response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  String userId;
  String token;
  EventData eventData;

  Response({this.userId, this.token, this.eventData});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    token = json['token'];
    eventData = json['event_data'] != null
        ? new EventData.fromJson(json['event_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['token'] = this.token;
    if (this.eventData != null) {
      data['event_data'] = this.eventData.toJson();
    }
    return data;
  }
}

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
  String instructionLanguage;
  List<Students> students;
  String questionSetInfo;
  String batchInfo;
  String finalSubmit;
  Null finalSubmitPicture;
  String totalMarks;
  String totalQuestions;
  String assessorPassword;
  AssessorData assessorData;

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
        this.students,
        this.questionSetInfo,
        this.batchInfo,
        this.finalSubmit,
        this.finalSubmitPicture,
        this.totalMarks,
        this.totalQuestions,
        this.assessorPassword,
        this.assessorData});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    urlSlug = json['url_slug'];
    logo = json['logo'];
    date = json['date'];
    status = json['status'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    deleted = json['deleted'];
    assessorId = json['assessor_id'];
    instruction = json['instruction'];
    supportPhone = json['support_phone'];
    supportEmail = json['support_email'];
    duration = json['duration'];
    testSecretCode = json['test_secret_code'];
    testStatus = json['test_status'];
    instructionLanguage = json['instruction_language'];
    if (json['students'] != null) {
      students = new List<Students>();
      json['students'].forEach((v) {
        students.add(new Students.fromJson(v));
      });
    }
    questionSetInfo = json['question_set_info'];
    batchInfo = json['batch_info'];
    finalSubmit = json['final_submit'];
    finalSubmitPicture = json['final_submit_picture'];
    totalMarks = json['total_marks'];
    totalQuestions = json['total_questions'];
    assessorPassword = json['assessor_password'];
    assessorData = json['assessor_data'] != null
        ? new AssessorData.fromJson(json['assessor_data'])
        : null;
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
    data['question_set_info'] = this.questionSetInfo;
    data['batch_info'] = this.batchInfo;
    data['final_submit'] = this.finalSubmit;
    data['final_submit_picture'] = this.finalSubmitPicture;
    data['total_marks'] = this.totalMarks;
    data['total_questions'] = this.totalQuestions;
    data['assessor_password'] = this.assessorPassword;
    if (this.assessorData != null) {
      data['assessor_data'] = this.assessorData.toJson();
    }
    return data;
  }
}

class Students {
  String id;
  String studentCode;
  Null studentRollNo;
  String batch;
  String name;
  String fatherName;
  String password;
  String gender;
  Null profilePic;
  String examStatus;
  String syncStatus;
  Null deviceId;
  Null aadharPic;
  String vivaStatus;
  List<TheoryQuestions> theoryQuestions;
  List<VivaQuestions> vivaQuestions;

  Students(
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

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentCode = json['student_code'];
    studentRollNo = json['student_roll_no'];
    batch = json['batch'];
    name = json['name'];
    fatherName = json['father_name'];
    password = json['password'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    examStatus = json['exam_status'];
    syncStatus = json['sync_status'];
    deviceId = json['device_id'];
    aadharPic = json['aadhar_pic'];
    vivaStatus = json['viva_status'];
    if (json['theory_questions'] != null) {
      theoryQuestions = new List<TheoryQuestions>();
      json['theory_questions'].forEach((v) {
        theoryQuestions.add(new TheoryQuestions.fromJson(v));
      });
    }
    if (json['viva_questions'] != null) {
      vivaQuestions = new List<VivaQuestions>();
      json['viva_questions'].forEach((v) {
        vivaQuestions.add(new VivaQuestions.fromJson(v));
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

class TheoryQuestions {
  String id;
  String subjectId;
  String schemeId;
  String sectorId;
  String courseId;
  String questionsetId;
  Null testId;
  String question;
  String language;
  String questionPhoto;
  String optiona;
  String optionaPhoto;
  String optionb;
  String optionbPhoto;
  String optionc;
  String optioncPhoto;
  String optiond;
  String optiondPhoto;
  String correctanswer;
  double marks;
  String weightage;
  String createdDate;
  String modifiedDate;
  String status;
  String deleted;
  Null createdBy;
  Null modifiedBy;
  String ownerId;
  String assignedId;
  String nosName;

  TheoryQuestions(
      {this.id,
        this.subjectId,
        this.schemeId,
        this.sectorId,
        this.courseId,
        this.questionsetId,
        this.testId,
        this.question,
        this.language,
        this.questionPhoto,
        this.optiona,
        this.optionaPhoto,
        this.optionb,
        this.optionbPhoto,
        this.optionc,
        this.optioncPhoto,
        this.optiond,
        this.optiondPhoto,
        this.correctanswer,
        this.marks,
        this.weightage,
        this.createdDate,
        this.modifiedDate,
        this.status,
        this.deleted,
        this.createdBy,
        this.modifiedBy,
        this.ownerId,
        this.assignedId,
        this.nosName});

  TheoryQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    schemeId = json['scheme_id'];
    sectorId = json['sector_id'];
    courseId = json['course_id'];
    questionsetId = json['questionset_id'];
    testId = json['test_id'];
    question = json['question'];
    language = json['language'];
    questionPhoto = json['question_photo'];
    optiona = json['optiona'];
    optionaPhoto = json['optiona_photo'];
    optionb = json['optionb'];
    optionbPhoto = json['optionb_photo'];
    optionc = json['optionc'];
    optioncPhoto = json['optionc_photo'];
    optiond = json['optiond'];
    optiondPhoto = json['optiond_photo'];
    correctanswer = json['correctanswer'];
    marks = json['marks'];
    weightage = json['weightage'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    status = json['status'];
    deleted = json['deleted'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    ownerId = json['owner_id'];
    assignedId = json['assigned_id'];
    nosName = json['nos_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['scheme_id'] = this.schemeId;
    data['sector_id'] = this.sectorId;
    data['course_id'] = this.courseId;
    data['questionset_id'] = this.questionsetId;
    data['test_id'] = this.testId;
    data['question'] = this.question;
    data['language'] = this.language;
    data['question_photo'] = this.questionPhoto;
    data['optiona'] = this.optiona;
    data['optiona_photo'] = this.optionaPhoto;
    data['optionb'] = this.optionb;
    data['optionb_photo'] = this.optionbPhoto;
    data['optionc'] = this.optionc;
    data['optionc_photo'] = this.optioncPhoto;
    data['optiond'] = this.optiond;
    data['optiond_photo'] = this.optiondPhoto;
    data['correctanswer'] = this.correctanswer;
    data['marks'] = this.marks;
    data['weightage'] = this.weightage;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['owner_id'] = this.ownerId;
    data['assigned_id'] = this.assignedId;
    data['nos_name'] = this.nosName;
    return data;
  }
}

class VivaQuestions {
  String id;
  Null schemeId;
  Null sectorId;
  String courseId;
  String questionsetId;
  String question;
  String language;
  double marks;
  String weightage;
  String createdDate;
  String modifiedDate;
  String status;
  String deleted;
  Null createdBy;
  Null modifiedBy;
  String ownerId;
  String assignedId;
  List<Steps> steps;

  VivaQuestions(
      {this.id,
        this.schemeId,
        this.sectorId,
        this.courseId,
        this.questionsetId,
        this.question,
        this.language,
        this.marks,
        this.weightage,
        this.createdDate,
        this.modifiedDate,
        this.status,
        this.deleted,
        this.createdBy,
        this.modifiedBy,
        this.ownerId,
        this.assignedId,
        this.steps});

  VivaQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schemeId = json['scheme_id'];
    sectorId = json['sector_id'];
    courseId = json['course_id'];
    questionsetId = json['questionset_id'];
    question = json['question'];
    language = json['language'];
    marks = json['marks'];
    weightage = json['weightage'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    status = json['status'];
    deleted = json['deleted'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    ownerId = json['owner_id'];
    assignedId = json['assigned_id'];
    if (json['steps'] != null) {
      steps = new List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheme_id'] = this.schemeId;
    data['sector_id'] = this.sectorId;
    data['course_id'] = this.courseId;
    data['questionset_id'] = this.questionsetId;
    data['question'] = this.question;
    data['language'] = this.language;
    data['marks'] = this.marks;
    data['weightage'] = this.weightage;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['owner_id'] = this.ownerId;
    data['assigned_id'] = this.assignedId;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  String id;
  String vivaQuestionId;
  String step;
  String language;

  Steps({this.id, this.vivaQuestionId, this.step, this.language});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vivaQuestionId = json['viva_question_id'];
    step = json['step'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['viva_question_id'] = this.vivaQuestionId;
    data['step'] = this.step;
    data['language'] = this.language;
    return data;
  }
}

class AssessorData {
  String username;

  AssessorData({this.username});

  AssessorData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
