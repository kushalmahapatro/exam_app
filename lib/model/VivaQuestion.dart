import 'package:exam_app/model/Step.dart';
export 'package:exam_app/model/Step.dart';

class VivaQuestion {
  String id;
  String schemeId;
  String sectorId;
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
  String  createdBy;
  String  modifiedBy;
  String ownerId;
  String assignedId;
  List<Step> steps;

  VivaQuestion(
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

  VivaQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    schemeId = json['scheme_id'] ?? "";
    sectorId = json['sector_id'] ?? "";
    courseId = json['course_id'] ?? "";
    questionsetId = json['questionset_id'] ?? "";
    question = json['question'] ?? "";
    language = json['language'] ?? "";
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
    steps = new List<Step>();
    if (json['steps'] != null) {
      json['steps'].forEach((v) {
        steps.add(new Step.fromJson(v));
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
