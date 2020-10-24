import 'package:flutter/material.dart';
import './Cocktail.dart';
import './DetailsDrink.dart';
void main()=>{runApp(MyApp())};


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:Cocktail()
    );
  }
}
