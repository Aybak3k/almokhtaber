class QuizBrain {
  String questionBody;
  String rightAnswer;
  List<String> wrongAnswers;

  //  prefer_initializing_formals
  QuizBrain(this.questionBody, this.rightAnswer, this.wrongAnswers);
}

// insteada module XD:
class QuestionBank {
  static List<QuizBrain> bank = [
    QuizBrain(
      "Which are the 3 Pyramids of Egypt located in? 🇪🇬",
      "How about Al-Haram?",
      ["um.. Cairo?",
      "I heared there's a city called Al-Fayum",
      "duh🙄 ofc it's Giza"]),
  ];

  static List<String> getAllAnswers() {
    // invalid ref to this
    var bank = QuestionBank.bank;

    List<String> allAnswers = [
      // @TODO
      bank[0].rightAnswer,
      ...bank[0].wrongAnswers
    ];
    allAnswers.shuffle();
    return (allAnswers);
  }
}
