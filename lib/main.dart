import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calcuator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String ind="";

  Widget buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      ind="";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "X" ||
        buttonText == "/") {

      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      ind="Y";
      _output=num1.toString();
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains decimal");
        return null;
      } else {
        ind="";
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      if(ind=="Y") {_output=buttonText;}
      else{
        ind="";
      _output = _output+buttonText;}
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    }
    );
    //return _output;
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.lightBlueAccent,
highlightColor: Colors.green,
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.blueAccent)),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(output, style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),),
                  ),
                  new Expanded(
                    child: new Divider(),
                  ),

                  new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            buildButton("7"),
                            buildButton("8"),
                            buildButton("9"),
                            buildButton("/"),
                          ],
                        ),

                        new Row(
                          children: <Widget>[
                            buildButton("4"),
                            buildButton("5"),
                            buildButton("6"),
                            buildButton("X"),
                          ],
                        ),

                        new Row(
                          children: <Widget>[
                            buildButton("1"),
                            buildButton("2"),
                            buildButton("3"),
                            buildButton("-"),
                          ],
                        ),

                        new Row(
                          children: <Widget>[
                            buildButton("."),
                            buildButton("0"),
                            buildButton("00"),
                            buildButton("+"),
                          ],
                        ),

                        new Row(
                          children: <Widget>[
                            buildButton("Clear"),
                            buildButton("="),
                          ],
                        ),
                      ]
                  )
                ]
            )
        )
    );
  }
}