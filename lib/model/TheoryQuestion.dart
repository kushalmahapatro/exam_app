
class TheoryQuestion {
  String id;
  String subjectId;
  String schemeId;
  String sectorId;
  String courseId;
  String questionsetId;
  String  testId;
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
  String  createdBy;
  String  modifiedBy;
  String ownerId;
  String assignedId;
  String nosName;

  TheoryQuestion(
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

  TheoryQuestion.fromJson(Map<String, dynamic> json) {
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
    marks = json['marks'] ?? 0.0;
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
}
