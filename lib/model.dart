class Question {
  String questionText;
  List answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  String text;
  bool isCorrectAnswer;
  Answer(this.text, this.isCorrectAnswer);
}

List<Question> getQuestions() {
  List<Question> list = [];
  list.add(
    Question(
      "ما هو الاسم الحقيقي للورد فولدمورت؟",
      [
        Answer("توم ريدل", true),
        Answer("الفونسو ديفيز", false),
        Answer("هانس نيمان", false),
        Answer("فابيانو كروانا", false)
      ],
    ),
  );

  list.add(
    Question(
      "أي من الأشخاص التاليين ينتمي إلى عائلة \n افرادها ليسو سحرة؟",
      [
        Answer("دين توماس", false),
        Answer("رون ويزلي", false),
        Answer("هيرموني غرانجر", true),
        Answer("ثيودور نوت", false)
      ],
    ),
  );

  list.add(
    Question(
      "ما هو اسم بنك السحرة الموجود في زقاق دياجون؟",
      [
        Answer("جاليون", false),
        Answer("سيكل", false),
        Answer("جرينجوتس", true),
        Answer("كنوت", false)
      ],
    ),
  );

  list.add(
    Question(
      "من هو شبح رافينكلو؟",
      [
        Answer("روينا رافينكلو", false),
        Answer("الراهب السمين", false),
        Answer("السيده الرمادية", false),
        Answer("نيكولاس بورنيجتون", true),
      ],
    ),
  );

  list.add(
    Question(
      "أي مما يلي لا يمكنك شراؤه في متجر زونكو للخدع؟",
      [
        Answer("حلوي الحازوقة", true),
        Answer("قنبلة دانجبومب", false),
        Answer("فنجان عض الانف", false),
        Answer("صندوق حلوي سكايفينج", false)
      ],
    ),
  );

  return list;
}
