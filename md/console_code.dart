void main() {
  Question q1 = Question(  // Unnecessary new keyword
    "Where are the 3 Pyramids of Egypt located?",
    "Haram",
    ["Giza", "Cairo", "Fayum"]
  );
  
  printQuestionPresentation(q1);
}


class Question {
  String questionBody;
  String rightAnswer;
  List<String> wrongAnswers;
  
  //  prefer_initializing_formals
  Question(this.questionBody, this.rightAnswer, this.wrongAnswers);
}

void printQuestionPresentation(Question q){
  List<String> allAnswers = [q.rightAnswer, ...q.wrongAnswers];
  allAnswers.shuffle();
  
  
}