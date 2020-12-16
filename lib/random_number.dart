import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumberGen extends StatefulWidget {
  @override
  _RandomNumberGenState createState() => _RandomNumberGenState();
}

class _RandomNumberGenState extends State<RandomNumberGen> {
  String _hasilGenerate = '';
  final _minLength = TextEditingController();
  final _maxLength = TextEditingController();
  final _minFocus = FocusNode();
  final _maxFocus = FocusNode();
  final _nextAction = TextInputAction.next;
  final _doneAction = TextInputAction.done;

  final _random = new Random();

  void _randomNumber() {
    setState(() {
      int r = int.parse(_minLength.text) +
          _random.nextInt(
              int.parse(_maxLength.text) + 1 - int.parse(_minLength.text));
      _hasilGenerate = r.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Textfield(
              label: 'Min Lenght',
              controller: _minLength,
              focus: _minFocus,
              inputAction: _nextAction,
              onSubmit: (value) {
                FocusScope.of(context).requestFocus(_maxFocus);
              },
            ),
            Textfield(
              label: 'Max Lenght',
              controller: _maxLength,
              focus: _maxFocus,
              inputAction: _doneAction,
              onSubmit: (value) {
                _randomNumber();
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 45,
              child: RaisedButton(
                onPressed: _randomNumber,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Generate Number',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              _hasilGenerate,
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  Textfield({
    @required this.label,
    @required this.controller,
    @required this.focus,
    @required this.onSubmit,
    @required this.inputAction,
  });
  final String label;
  final controller, focus, onSubmit, inputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        focusNode: focus,
        textInputAction: inputAction,
        onSubmitted: onSubmit,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}