// TODOs
  // DONE
    // 1) shuffle Q&A accordingly && provide access to them
    // - shuffle 1st
    // return both sep by a loop
  // 2) getNextQuestion()
    // - check answwer && update score keeper
    // - but how to get rid of the question mark?
  // - check lenght
  // 3) restart

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
  static List<QuizBrain> bank = [
    QuizBrain("Which are the 3 Pyramids of Egypt located in? 🇪🇬",
        "How about Al-Haram?", [
      "um.. Cairo?",
      "I heared there's a city called Al-Fayum",
      "duh🙄 ofc it's Giza"
    ]),
    QuizBrain(
        "The sotry of Santa Claus originated in...", "IT'S Türkiye 🇹🇷!", [
      "Harry Poter Homeland.. 🇬🇧🤔",
      "España 🇪🇸 it is 🥱",
      "France 🇫🇷!.. I mean the name is french ¯\\_(ツ)_/¯ "
    ]),
    QuizBrain(
        "I'm Vlad Țepeș aka Drakula. WHERE DID I MARCH FROM? Choose Carefully 😈🧛‍♂️",
        "întoarce-te de unde ai venit 🇷🇴👿", [
      "S- S- Sp- SPAIN 🇪🇸!, SIR!",
      "Expecto Patronum! 🛡️🇬🇧",
      "TÖTE IHN 🔥🇩🇪!"
    ]),
  ];

  static Map<String, List> getBank() {
    bank.shuffle();

    var bankMap = {"Questions": [],
                   "Answers": List.filled(bank.length, List.filled(4, ""))};
    List<String> tempAnswersArr = [];

    for (var b in bank) {
      bankMap["Questions"]?.add(b.questionBody);
    }

    for (var i = 0; i < bank.length; i++) {
      tempAnswersArr = [bank[i].rightAnswer, ...bank[i].wrongAnswers];
      bankMap["Answers"]![i] = tempAnswersArr;
    }
    bankMap["Answers"]!.forEach((group) => {group.shuffle()});

    return bankMap;
  }
}
