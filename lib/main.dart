import 'package:flutter/material.dart';
import './random_number.dart' as randomnumber;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Number Generator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar:AppBar(
              title: Center(child: Text('Random Number Generator')),
            ),
            body: randomnumber.RandomNumberGen()
        ),
      ),
    );
  }
}