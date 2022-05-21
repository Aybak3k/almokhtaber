class QuizBrain {
  String questionBody;
  String rightAnswer;
  List<String> wrongAnswers;

  QuizBrain(this.questionBody, this.rightAnswer, this.wrongAnswers);
}

class QuestionBank {


  // data class
    // insteada module XD
  static List<QuizBrain> bank = [
    QuizBrain(
      "Which are the 3 Pyramids of Egypt located in? 🇪🇬",
      "How about Al-Haram?",
      [
        "um.. Cairo?",
        "I heared there's a city called Al-Fayum",
        "duh🙄 ofc it's Giza"
      ]
    ),
    QuizBrain(
      "The sotry of Santa Claus originated in...",
      "IT'S Türkiye 🇹🇷!",
      [
        "Harry Poter Homeland.. 🇬🇧🤔",
        "España 🇪🇸 it is 🥱",
        "France 🇫🇷!.. I mean the name is french ¯\\_(ツ)_/¯ "
      ]
    ),
    QuizBrain(
      "I'm Vlad Țepeș aka Drakula. WHERE DID I MARCH FROM? Choose Carefully 😈🧛‍♂️",
      "întoarce-te de unde ai venit 🇷🇴👿",
      [
        "S- S- Sp- SPAIN 🇪🇸!, SIR!",
        "Expecto Patronum! 🛡️🇬🇧",
        "TÖTE IHN 🔥🇩🇪!"
      ]
    ),
    QuizBrain(
      "I won't give up\nI won't back down\n'Cause nobody's stopping me except for me now 🎸",
      "NEFFEX🔥 🇺🇸",
      [
        "Rammstein🧑‍🎤 🇩🇪",
        "Blackpink🦹‍♀️ 🇰🇷",
        "NEONI🎆 🇺🇸"
      ]
    ),
    QuizBrain(
      "2nd oldest language in the world\nStill spoken today",
      "Sanskrit 🇮🇳📜",
      [
        "Greek 🇬🇷📚",
        "Farsi 🇮🇷🐎",
        "Hieroglyph 🇪🇬🏛️"
      ]
    ),
    QuizBrain(
      "Home to over 700 different languages and dialects 🌐",
      "Indonesia 🇮🇩🏝️",
      [
        "Iceland 🇮🇸🌋",
        "Wait WHAT?! 😮",
        "how may langauges exist/ed in 1st place... 🤨"
      ]
    ),
    QuizBrain(
      "The Motherland Calls\nTallest statue of a woman\n📍🗺️❓",
      "Россия 🇷🇺",
      [
        "Portugal 🇵🇹",
        "Canada 🇨🇦",
        "España 🇪🇸"
      ]
    ),
    QuizBrain(
      "Called The Pearl of the Indian Ocean 🦪♥️",
      "இலங்கை 🇱🇰",
      [
        "*Where's the Indian Ocean to begin with 🤔*",
        "इंडिया 🇮🇳",
        "日本 🇯🇵"
      ]
    ),
    QuizBrain(
      "They love to travel the most 🗺️🧳",
      "Das sind wir 🦅",
      [
        "よく私たちはたくさん旅行します 🎏",
        "nous aimons certainement beaucoup voyager 🥐",
        "那很可愛 🐼"
      ]
    ),
  ];



  // Export Q&A
    // alt << random access && pop..?
  static Map<String, List> getBank() {
    // Shuffle Q&A array
    bank.shuffle();

    // Create Map to be returned
    var bankMap = {
      "Questions": [],
      "Correct Answers": [],
      "All Answers": List.filled(bank.length, List.filled(4, ""))
      };
    List<String> tempAnswersArr = [];

    // Add Correct_Answers[] to Map
    for (var b in bank) {
      bankMap["Correct Answers"]?.add(b.rightAnswer);
    }

    // Add Questions[] to Map
    for (var b in bank) {
      bankMap["Questions"]?.add(b.questionBody);
    }

    // Add All_Answers[] to Map
    for (var i = 0; i < bank.length; i++) {
      tempAnswersArr = [bank[i].rightAnswer, ...bank[i].wrongAnswers];
      bankMap["All Answers"]![i] = tempAnswersArr;
    }

    // Shuffle each Answer[] in All_Answers individually
    for (var group in bankMap["All Answers"]!) {
      group.shuffle();
    }

    return bankMap;
  }


}
