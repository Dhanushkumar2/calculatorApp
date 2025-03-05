import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'custombutton.dart';
import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      theme: ThemeData.dark(),
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = "";
  String output = "";

  void addInput(String s) {
    if(s == 'C') {
      setState(() {
        input = "";
        output = "";
      });
    }
      else if(s == '='){
        parseInput();
    }
      else if(s == '⌫'){
        input = input.substring(0, input.length - 1);
    }
      else{
        setState(() {
          input += s;
        });
    }
  }

  void parseInput(){
    try{
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel c = ContextModel();
      double ans = exp.evaluate(EvaluationType.REAL, c);
      setState(() {
        output = ans.toString();
      });
    }
    catch(e){
      setState(() {
        output = "Error";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Calculator App"),
      ),
      body:Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text(input,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,),
                    ),
                  )
              ),
          
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text(output,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
                    ),
                  )
              ),
          
              Expanded(
                flex: 3,
                  child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                  childAspectRatio: 1.1),
                      itemCount: buttons.length,
                      itemBuilder: (context, index){
                            return CustomButton(
                              function: () => addInput(buttons[index]),
                              str: buttons[index],
                            );
                      }
                  )
              )
            ],
          
          ),
        ),
      ),
    );
  }
}



