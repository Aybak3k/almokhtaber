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
      "Which are the 3 Pyramids of Egypt located in? ๐ช๐ฌ",
      "How about Al-Haram?",
      [
        "um.. Cairo?",
        "I heared there's a city called Al-Fayum",
        "duh๐ ofc it's Giza"
      ]
    ),
    QuizBrain(
      "The sotry of Santa Claus originated in...",
      "IT'S Tรผrkiye ๐น๐ท!",
      [
        "Harry Poter Homeland.. ๐ฌ๐ง๐ค",
        "Espaรฑa ๐ช๐ธ it is ๐ฅฑ",
        "France ๐ซ๐ท!.. I mean the name is french ยฏ\\_(ใ)_/ยฏ "
      ]
    ),
    QuizBrain(
      "I'm Vlad ศepeศ aka Drakula. WHERE DID I MARCH FROM? Choose Carefully ๐๐งโโ๏ธ",
      "รฎntoarce-te de unde ai venit ๐ท๐ด๐ฟ",
      [
        "S- S- Sp- SPAIN ๐ช๐ธ!, SIR!",
        "Expecto Patronum! ๐ก๏ธ๐ฌ๐ง",
        "TรTE IHN ๐ฅ๐ฉ๐ช!"
      ]
    ),
    QuizBrain(
      "I won't give up\nI won't back down\n'Cause nobody's stopping me except for me now ๐ธ",
      "NEFFEX๐ฅ ๐บ๐ธ",
      [
        "Rammstein๐งโ๐ค ๐ฉ๐ช",
        "Blackpink๐ฆนโโ๏ธ ๐ฐ๐ท",
        "NEONI๐ ๐บ๐ธ"
      ]
    ),
    QuizBrain(
      "The oldest language in the world\nAND still spoken today",
      "Sanskrit ๐ฎ๐ณ๐",
      [
        "Greek ๐ฌ๐ท๐",
        "Farsi ๐ฎ๐ท๐",
        "Hieroglyph ๐ช๐ฌ๐๏ธ"
      ]
    ),
    QuizBrain(
      "Home to over 700 different languages and dialects ๐",
      "Indonesia ๐ฎ๐ฉ๐๏ธ",
      [
        "Iceland ๐ฎ๐ธ๐",
        "Wait WHAT?! ๐ฎ",
        "how may langauges exist/ed in 1st place... ๐คจ"
      ]
    ),
    QuizBrain(
      "The Motherland Calls\nTallest statue of a woman\n๐๐บ๏ธโ",
      "ะ ะพััะธั ๐ท๐บ",
      [
        "Portugal ๐ต๐น",
        "Canada ๐จ๐ฆ",
        "Espaรฑa ๐ช๐ธ"
      ]
    ),
    QuizBrain(
      "Called The Pearl of the Indian Ocean ๐ฆชโฅ๏ธ",
      "เฎเฎฒเฎเฏเฎเฏ ๐ฑ๐ฐ",
      [
        "*Where's the Indian Ocean to begin with ๐ค*",
        "เคเคเคกเคฟเคฏเคพ ๐ฎ๐ณ",
        "ๆฅๆฌ ๐ฏ๐ต"
      ]
    ),
    QuizBrain(
      "They love to travel the most ๐บ๏ธ๐งณ",
      "Das sind wir ๐ฆ",
      [
        "ใใ็งใใกใฏใใใใๆ่กใใพใ ๐",
        "nous aimons certainement beaucoup voyager ๐ฅ",
        "้ฃๅพๅฏๆ ๐ผ"
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
