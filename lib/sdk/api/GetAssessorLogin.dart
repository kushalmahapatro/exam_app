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
}*/

class GetAssessorLoginModel {
  static GetAssessorLoginModel _instance;
  static int responseCode;
  static bool responseStatus;
  static String responseMessage;
  static Response response;

  GetAssessorLoginModel(
      {responseCode,
        responseStatus,
        responseMessage,
        response});

  GetAssessorLoginModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode']?? 0;
    responseStatus = json['ResponseStatus']?? false;
    responseMessage = json['ResponseMessage'] ?? "";
    response = Response.fromJson(json['Response'] ?? Map<String, dynamic>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = responseCode;
    data['ResponseStatus'] = responseStatus;
    data['ResponseMessage'] = responseMessage;
    if (response != null) {
      data['Response'] = response.toJson();
    }
    print("op: "+data.toString());
    return data;
  }

  static GetAssessorLoginModel getInstance(String jsonValue) {
    if(_instance==null) {
      _instance = GetAssessorLoginModel.fromJson(jsonValue);
    }
    return _instance;
  }

  clear() {
    _instance = null;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class Response {
  String userId;
  String token;
  EventData eventData;

  Response({this.userId, this.token, this.eventData});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? "";
    token = json['token'] ?? "";
    eventData =EventData.fromJson(json['event_data']?? Map<String, dynamic>());
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
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
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
  String finalSubmitPicture;
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
    instructionLanguage = json['instruction_language'] ?? "";
    if (json['students'] != null) {
      students = new List<Students>();
      json['students'].forEach((v) {
        students.add(new Students.fromJson(v));
      });
    }
    questionSetInfo = json['question_set_info'] ?? "";
    batchInfo = json['batch_info'] ?? "";
    finalSubmit = json['final_submit'] ?? "";
    finalSubmitPicture = json['final_submit_picture'] ?? "";
    totalMarks = json['total_marks'] ?? "";
    totalQuestions = json['total_questions'] ?? "";
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
    else{
      data['students'] = List<Students>();
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
  String studentRollNo;
  String longitude;
  String latitude;
  String batch;
  String name;
  String fatherName;
  String password;
  String gender;
  String profilePic;
  String examStatus;
  String vivaStatus;
  String syncStatus;
  String deviceId;
  String aadharPic;
  List<TheoryQuestions> theoryQuestions;
  List<VivaQuestions> vivaQuestions;

  Students(
      {this.id,
        this.studentCode,
        this.studentRollNo,
        this.longitude,
        this.latitude,
        this.batch,
        this.name,
        this.fatherName,
        this.password,
        this.gender,
        this.profilePic,
        this.examStatus,
        this.vivaStatus,
        this.syncStatus,
        this.deviceId,
        this.aadharPic,
        this.theoryQuestions,
        this.vivaQuestions});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    studentCode = json['student_code'] ?? "";
    studentRollNo = json['student_roll_no'] ?? "";
    longitude = json['longitude'] ?? "";
    latitude = json['latitude'] ?? "";
    batch = json['batch'] ?? "";
    name = json['name'] ?? "";
    fatherName = json['father_name'] ?? "";
    password = json['password'] ?? "";
    gender = json['gender'] ?? "";
    profilePic = json['profile_pic'] ?? "";
    examStatus = json['exam_status'] ?? "";
    vivaStatus = json['viva_status'] ?? "";
    syncStatus = json['sync_status'] ?? "";
    deviceId = json['device_id'] ?? "";
    aadharPic = json['aadhar_pic'] ?? "";
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
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['batch'] = this.batch;
    data['name'] = this.name;
    data['father_name'] = this.fatherName;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['exam_status'] = this.examStatus;
    data['viva_status'] = this.vivaStatus;
    data['sync_status'] = this.syncStatus;
    data['device_id'] = this.deviceId;
    data['aadhar_pic'] = this.aadharPic;
    if (this.theoryQuestions != null) {
      data['theory_questions'] =
          this.theoryQuestions.map((v) => v.toJson()).toList();
    }else{
      data['theory_questions'] = List<TheoryQuestions>();
    }
    if (this.vivaQuestions != null) {
      data['viva_questions'] =
          this.vivaQuestions.map((v) => v.toJson()).toList();
    }
    else{
      data['viva_questions'] = List<VivaQuestions>();
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
  String testId;
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
  String createdBy;
  String modifiedBy;
  String ownerId;
  String assignedId;
  String nosName;
  Map<String, SingleLanguageQuestion> _languageQuestions;

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
    id = json['id'] ?? "";
    subjectId = json['subject_id'] ?? "";
    schemeId = json['scheme_id'] ?? "";
    sectorId = json['sector_id'] ?? "";
    courseId = json['course_id'] ?? "";
    questionsetId = json['questionset_id'] ?? "";
    testId = json['test_id'] ?? "";
    question = json['question'] ?? "";
    language = json['language'] ?? "";
    questionPhoto = json['question_photo'] ?? "";
    optiona = json['optiona'] ?? "";
    optionaPhoto = json['optiona_photo'] ?? "";
    optionb = json['optionb'] ?? "";
    optionbPhoto = json['optionb_photo'] ?? "";
    optionc = json['optionc'] ?? "";
    optioncPhoto = json['optionc_photo'] ?? "";
    optiond = json['optiond'] ?? "";
    optiondPhoto = json['optiond_photo'] ?? "";
    correctanswer = json['correctanswer'] ?? "";
    marks = double.parse(json['marks'].toString()) ?? 0.0;
    weightage = json['weightage'] ?? "";
    createdDate = json['created_date'] ?? "";
    modifiedDate = json['modified_date'] ?? "";
    status = json['status'] ?? "";
    deleted = json['deleted'] ?? "";
    createdBy = json['created_by'] ?? "";
    modifiedBy = json['modified_by'] ?? "";
    ownerId = json['owner_id'] ?? "";
    assignedId = json['assigned_id'] ?? "";
    nosName = json['nos_name'] ?? "";
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
  Map<String, SingleLanguageQuestion> getLanguageQuestion() {
    if(_languageQuestions==null || _languageQuestions.length<1) {
      Map<String, SingleLanguageQuestion> result = Map();
      result["English"] = SingleLanguageQuestion(
        question: question, optiona: optiona, optionb: optionb,
          optionc: optionc, optiond: optiond);
      List<dynamic> list = jsonDecode(language) as List<dynamic>;
      for(int i=0; i<list.length; i++) {
        Map<String, dynamic> item = (list[i] as Map<String, dynamic>) ?? {"": Map()};
        item.forEach((k, v) {
          if(k!=null && k.trim().length>0 && v!=null) {
            result[k] = SingleLanguageQuestion.fromJson(v as Map<String, dynamic>);
          }
        });
      }
      _languageQuestions = result;
    }
    return _languageQuestions;
  }
}

class VivaQuestions {
  String id;
  String schemeId;
  String sectorId;
  String courseId;
  String questionsetId;
  String question;
  String language;
  double marks;
  double obtained_marks;
  String weightage;
  String createdDate;
  String modifiedDate;
  String status;
  String deleted;
  String createdBy;
  String modifiedBy;
  String ownerId;
  String assignedId;
  List<Steps> steps;
  Map<String, String> _languageQuestion;

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
    id = json['id'] ?? "";
    schemeId = json['scheme_id'] ?? "";
    sectorId = json['sector_id'] ?? "";
    courseId = json['course_id'] ?? "";
    questionsetId = json['questionset_id'] ?? "";
    question = json['question'] ?? "";
    language = json['language'] ?? "";
    marks = double.parse(json['marks'].toString()) ?? 0.0;
    weightage = json['weightage'] ?? "";
    createdDate = json['created_date'] ?? "";
    modifiedDate = json['modified_date'] ?? "";
    status = json['status'] ?? "";
    deleted = json['deleted'] ?? "";
    createdBy = json['created_by'] ?? "";
    modifiedBy = json['modified_by'] ?? "";
    ownerId = json['owner_id'] ?? "";
    assignedId = json['assigned_id'] ?? "";
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
    }else{
      data['steps'] =List<Steps>();
    }
    return data;
  }

  Map<String, String> getLanguageQuestion() {
    if(_languageQuestion==null || _languageQuestion.length<1) {
      Map<String, String> result = Map();
      result["English"] = question ?? "";
      List<dynamic> list = jsonDecode(language) as List<dynamic>;
      for(int i=0; i<list.length; i++) {
//        Map<String, String> item = (list[i] as Map<String, String>) ?? {"": ""};
//        item.forEach((k, v) {
//          if(k!=null && k.trim().length>0 && v!=null) {
//            result[k] = v;
//          }
//        });
      }
      _languageQuestion = result;
    }
    return _languageQuestion;
  }

}

class SingleLanguageQuestion {
  String question;
  String optiona;
  String optionb;
  String optionc;
  String optiond;
  String selectedOption;

  SingleLanguageQuestion({
    this.question,
    this.optiona,
    this.optionb,
    this.optionc,
    this.optiond
  });


  SingleLanguageQuestion.fromJson(Map<String, dynamic> json) {
    /*{
      "question": "ग्राहक आईडी प्रूफ के साथ दोहरी जांच का सबसे महत्वपूर्ण कारण है जबकि भुगतान ईएमआई के माध्यम से किया जा रहा है?",
    "optiona": "यह एक प्रक्रिया है और इसका पालन करने की आवश्यकता है",
    "optionb": "आईडी प्रूफ नकली या चोरी हो सकता है",
    "optionc": "आईडी प्रूफ एक फोटोकॉपी हो सकता है",
    "optiond": "आईडी प्रूफ की अवधि समाप्त हो सकती है"
  }*/
    question = json['question'] ?? "";
    optiona = json['optiona'] ?? "a";
    optionb = json['optionb'] ?? "b";
    optionc = json['optionc'] ?? "c";
    optiond = json['optiond'] ?? "d";
  }

  int getSelectedOptionIndex() {
    if(selectedOption!=null) {
      if(optiona == selectedOption) {
        return 1;
      }
      else if(optionb == selectedOption) {
        return 2;
      }
      else if(optionc == selectedOption) {
        return 3;
      }
      else if(optiond == selectedOption) {
        return 4;
      }
    }
    return -1;
  }
}

class SingleLanguageStepQuestion {
  String question;
  final String option1 = "No Answer";
  final String option2 = "Poor";
  final String option3 = "Good";
  final String option4 = "Very Good";
  final String option5 = " Excellent";
  String selectedOption;


  SingleLanguageStepQuestion({this.question = ""});

  SingleLanguageStepQuestion.fromJson(Map<String, dynamic> json) {
  /*{
      "step": "???????? 1 ???? ??"
  }*/
    question = json['step'] ?? "";
  }

  int getSelectedOptionIndex() {
    if(selectedOption!=null) {
      if(option1 == selectedOption) {
        return 0;
      }
      else if(option2 == selectedOption) {
        return 1;
      }
      else if(option3 == selectedOption) {
        return 2;
      }
      else if(option4 == selectedOption) {
        return 3;
      }
      else if(option5 == selectedOption) {
        return 4;
      }
    }
    return -1;
  }
}

class Steps {
  String id;
  String vivaQuestionId;
  String step;
  String language;
  double steps_mark;
  Map<String, SingleLanguageStepQuestion> _languageStepQuestions;

  Steps({this.id, this.vivaQuestionId, this.step, this.language});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    vivaQuestionId = json['viva_question_id'] ?? "";
    step = json['step'] ?? "";
    language = json['language'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['viva_question_id'] = this.vivaQuestionId;
    data['step'] = this.step;
    data['language'] = this.language;
    return data;
  }


  Map<String, SingleLanguageStepQuestion> getLanguageStepQuestion() {
    if(_languageStepQuestions==null || _languageStepQuestions.length<1) {
      Map<String, SingleLanguageStepQuestion> result = Map();
      result["English"] = SingleLanguageStepQuestion(question: step ?? "");
      List<dynamic> list = jsonDecode(language) as List<dynamic>;
      for(int i=0; i<list.length; i++) {
        Map<String, dynamic> item = (list[i] as Map<String, dynamic>) ?? {"": Map()};
        item.forEach((k, v) {
          if(k!=null && k.trim().length>0 && v!=null) {
            result[k] = SingleLanguageStepQuestion.fromJson(v as Map<String, dynamic>);
          }
        });
      }
      _languageStepQuestions = result;
    }
    return _languageStepQuestions;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class AssessorData {
  String username;

  AssessorData({this.username});

  AssessorData.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}