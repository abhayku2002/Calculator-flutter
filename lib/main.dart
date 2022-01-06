import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calcbutton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';
  var userInput = '';

 // String _remove = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }
  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF283637),
        body: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Color(0xff199EB0),
                Color(0xff344656),
              ],
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),

          ),
          padding: EdgeInsets.all(12),
          //width: 100,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
           // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child:
                  Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),

                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    userInput,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    textSize: 30,
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback:numClick,
                  ),
                  CalcButton(
                    text: '/',
                    textSize: 30,
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: 'x',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 40,
                    callback: numClick,
                  ),
             ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 50,
                    callback: numClick,
                  ),
             ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                  CalcButton(
                    text: '1',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 40,
                    callback: numClick,
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    textSize: 20,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '⌫',
                    buttontapped: (){
                      setState(() {
                        userInput.substring(0, userInput.length - 1);
                      });
                    },
                    textSize: 30,
                  ),

                  CalcButton(
                    text: '=',
                    textSize: 40,
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),

            ],

          ),
        ),

      ),
    );
  }
}


