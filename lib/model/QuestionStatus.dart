 class QuestionStatus{
  bool isVisited=true,isReviewed=false,isAnswer=false;
  String qstn_status="";

  QuestionStatus(
      this.isVisited,
      this.isReviewed,
      this.isAnswer,
      this.qstn_status);

}
 Map<String, dynamic> _questionStatusJson(QuestionStatus instance) => <String, dynamic>{
   'isVisited': instance.isVisited,
   'isReviewed': instance.isReviewed,
   'isAnswer': instance.isAnswer,
   'qstn_status': instance.qstn_status,
 };
