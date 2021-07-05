import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class QuizScreen extends StatefulWidget{
  List<Quiz> quizs;
  QuizScreen({this.quizs});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  List<int> _answers = [-1,-1,-1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple),
          ),
          width: width*0.58,
          height: height * 0.5,
          child: Swiper(physics: NeverScrollableScrollPhysics(),
          loop: false,
          itemCount: widget.quizs.length,
          itemBuilder: (BuildContext context, int index){
            return _buildQuizCard(widget.quizs[index], width, height);
          },
          ),
        ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0,width * 0.024, 0, width * 0.024),
            child: Text(
              'Q'+(_currentIndex +1).toString() + '.',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
              padding: EdgeInsets.only(top: width * 0.012),
            child: Text(
              quiz.title,
            ),
          )
        ],
      ),
    );

  }
}