import 'package:flutter/material.dart';
import 'package:quiz_app_new/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> QuestionList = getQuestions();
  int currentQuestion = 0;
  Answer? selectAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              "Harry Potter Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              "Questions ${currentQuestion + 1} / ${QuestionList.length}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    QuestionList[currentQuestion].questionText,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  left: -20,
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  right: -20,
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.check_sharp,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (Answer answer in QuestionList[currentQuestion].answerList)
                  answerButton(answer)
              ],
            ),
            nextButton(),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  answerButton(Answer answer) {
    bool isSelectedAnswer = answer == selectAnswer;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectAnswer = answer;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
        child: Card(
            color: isSelectedAnswer ? Colors.orange : Colors.white,
            child: ListTile(
              title: Text(
                answer.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )),
      ),
    );
  }

  nextButton() {
    bool islistQ = false;
    if (currentQuestion == QuestionList.length - 1) {
      islistQ = true;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 200, top: 30),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
          onPressed: () {
            if (selectAnswer!.isCorrectAnswer) {
              score++;
            }
            if (selectAnswer == null) {
            } else {
              if (islistQ) {
                bool ispassed = false;
                if (score >= QuestionList.length * 0.8) {
                  ispassed = true;
                }
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text(
                        "${ispassed ? 'passed' : 'faild'}\n Score is : $score",
                        style: TextStyle(
                            color: ispassed ? Colors.green : Colors.red),
                      ),
                      content: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                            score = 0;
                            currentQuestion = 0;
                            selectAnswer = null;
                          });
                        },
                        child: Text(
                          'Restart',
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue, // Text color
                        ),
                      ),
                    );
                  },
                );
              } else {
                setState(() {
                  selectAnswer = null;
                  currentQuestion += 1;
                });
              }
            }
          },
          child: Text(
            islistQ ? 'Submit' : "Next",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
