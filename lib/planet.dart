import 'package:flutter/material.dart';

class planet extends StatefulWidget {
  @override
  _planetState createState() => _planetState();
}

class _planetState extends State<planet> {
  final TextEditingController _textController = new TextEditingController();
  double _finalResult = 0.0;
  String _formattedText="";
  int radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Planet App"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),

      //body
      body: new ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          //Image
          new Container(
            child: new Image.asset(
              "./images/download.png",
              width: 100.0,
              height: 100.0,
              alignment: Alignment.center,
            ),
          ),
          //Text Feild
          new Container(
            //color: Colors.indigoAccent,
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: new TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: "Your Weight on Earth",
                hintText: "In Kg",
                icon: new Icon(Icons.person_outline),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio<int>(
                  groupValue: radioValue,
                  value: 0,
                  onChanged: handleRadioValueChanged),
              new Text("Uranus"),
              new Radio<int>(
                  groupValue: radioValue,
                  value: 1,
                  onChanged: handleRadioValueChanged),
              new Text("Mars"),
              new Radio<int>(
                  groupValue: radioValue,
                  value: 2,
                  onChanged: handleRadioValueChanged),
              new Text("Venus"),
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          new Center(
              child: new Text(
                _textController.text.isEmpty?"Please Enter Your Weight":_formattedText+" Kgs",
            textDirection: TextDirection.ltr,
            style: new TextStyle(
              fontSize: 19.9,
              fontWeight: FontWeight.w600,
            ),
          ))
        ],
      ),
    );
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:{
            _finalResult = _calculateValue(_textController.text, 14.5);
            _formattedText= "Your Weight on Uranus is ${_finalResult.toStringAsFixed(2)}";
            break;
        }
          case 1:{
          _finalResult = _calculateValue(_textController.text, 0.107);
          _formattedText= "Your Weight on Mars is ${_finalResult.toStringAsFixed(2)}";
          break;
          }
        case 2:{
          _finalResult = _calculateValue(_textController.text, 0.815);
          _formattedText= "Your Weight on Venus is ${_finalResult.toStringAsFixed(2)}";
          break;
        }
      }
    });
  }

  double _calculateValue(String text, double d) {
    if (text.isNotEmpty && d > 0.0) {
      return int.parse(text) * d;
    } else
      print("Wrong");
    return 60;
  }
}
