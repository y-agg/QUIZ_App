import "package:flutter/material.dart";
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  int _count = 0, totalscore=0;
  
  void quesfunc(int score ) {
    setState(() {
      _count += 1;
      totalscore += score ;
    });
  }

  void quizreset() {
    setState(() {
      _count = 0;
    });
  }
  String get getmarks {
      return "TOTAL SCORE :  " + totalscore.toString() ;
    }
  
  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> question =  [
      {
        "ques": "QUESTION 1",
        "ans": [
          {"text": "ANS1.1" , "Score" : 1 ,},
          {"text": "ANS1.2" , "Score" : 0 ,},
          {"text": "ANS1.3" , "Score" : 0 ,},
          {"text": "ANS1.4" , "Score" : 0 ,},
        ],
      },
      {
        "ques": "QUESTION 2",
        "ans": [
          {"text": "ANS2.1" , "Score" : 0 ,},
          {"text": "ANS2.2" , "Score" : 1 ,},
          {"text": "ANS2.3" , "Score" : 0 ,},
          {"text": "ANS2.4" , "Score" : 0 ,},
        ],
      },
      {
        "ques": "QUESTION 3",
        "ans": [
          {"text": "ANS3.1" , "Score" : 0 ,},
          {"text": "ANS3.2" , "Score" : 0 ,},
          {"text": "ANS3.3" , "Score" : 1 ,},
          {"text": "ANS3.4" , "Score" : 0 ,},
        ],
      },
      {
        "ques": "QUESTION 4",
        "ans": [
          {"text": "ANS4.1" , "Score" : 0 ,},
          {"text": "ANS4.2" , "Score" : 0 ,},
          {"text": "ANS4.3" , "Score" : 0 ,},
          {"text": "ANS4.4" , "Score" : 1 ,},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Quiz App"),
          ),
          body: _count < question.length
              ? QUESTION(question, _count, quesfunc) : RESULT(getmarks ,quizreset) , 
          ),
    );
  }
}
class ANSWERS extends StatelessWidget {
  final String text;
  final Function func;
  ANSWERS(this.text, this.func);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text , style:  TextStyle( fontSize: 16 , fontWeight: FontWeight.bold ),),
      textColor: Colors.deepPurple,
      onPressed: func,
    );
  }
}

class QUESTION extends StatelessWidget {
  final int _count;
  final Function quesfunc;
  final List<Map<String, Object>> question;
  QUESTION(this.question,this._count , this.quesfunc);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
      width: double.infinity,
      child: Text(question[_count]["ques"] , textAlign: TextAlign.center , style: TextStyle(fontSize: 20),),
      margin: EdgeInsets.all(10),
    ) ,
      ...(question[_count]["ans"] as List<Map<String , Object>>).map((ans) {
                return ANSWERS(ans["text"], () => quesfunc(ans["Score"]));
                     }).toList(),
      ],
    ); 
  }
}

class RESULT extends StatelessWidget {
  final getmarks;
  final Function quizreset;
  RESULT(this.getmarks , this.quizreset ,);
  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text("QUIZ COMPLETED" ,),
                    ),
                    Text (getmarks , style:TextStyle(fontSize:18,fontWeight: FontWeight.w500 , fontStyle: FontStyle.italic) ), 
                    FlatButton(
                      child: Text(
                        "Resart Quiz",
                        style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ,  fontStyle:FontStyle.italic),
                      ),
                      textColor: Colors.blue,
                      onPressed: quizreset,
                    )
                  ],
                 ) 
               ,) ;
  }
}