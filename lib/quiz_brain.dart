class QuizBrain {
  String questionBody;
  String rightAnswer;
  List<String> wrongAnswers;

  //  prefer_initializing_formals
  QuizBrain(this.questionBody, this.rightAnswer, this.wrongAnswers);
}

// insteada module XD:
class QuestionBank {
  // int _questionNum = 0;

  QuestionBank();

  static List<QuizBrain> bank = [
    QuizBrain(
      "Which are the 3 Pyramids of Egypt located in? 🇪🇬",
      "How about Al-Haram?",
      ["um.. Cairo?",
      "I heared there's a city called Al-Fayum",
      "duh🙄 ofc it's Giza"]),
    QuizBrain(
      "The sotry of Santa Claus originated in...",
      "IT'S Türkiye 🇹🇷!",
      ["Harry Poter Homeland.. 🇬🇧🤔",
      "España 🇪🇸 it is 🥱",
      "France 🇫🇷!.. I mean the name is french ¯\\_(ツ)_/¯ "]),
    QuizBrain(
      "I'm Vlad Țepeș aka Drakula. WHERE DID I MARCH FROM? Choose Carefully 😈🧛‍♂️",
      "întoarce-te de unde ai venit 🇷🇴👿",
      ["S- S- Sp- SPAIN 🇪🇸!, SIR!",
      "Expecto Patronum! 🛡️🇬🇧",
      "TÖTE IHN 🔥🇩🇪!"]),
  ];

  static List<String> getAllAnswers() {
    // invalid ref to this
    var bank = QuestionBank.bank;

    List<String> allAnswers = [
      // @TODO
      bank[1].rightAnswer,
      ...bank[1].wrongAnswers
    ];
    allAnswers.shuffle();
    return (allAnswers);
  }
}
