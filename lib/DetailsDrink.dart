import 'package:flutter/material.dart';


class Details extends StatelessWidget {
  final detail;

  const Details({Key key, @required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('${detail["strDrink"]}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Hero(
              tag:detail["idDrink"],
              child: CircleAvatar(
                radius: 100,
                backgroundImage:  NetworkImage(
                    detail["strDrinkThumb"],

                ),

              ),
            ),

            ]
          ),
          SizedBox(height: 20.0,),
          Text('${detail["idDrink"]}'),
          SizedBox(height: 20.0,),
          Text('${detail["strDrink"]}',textScaleFactor: 1.8,)
        ],
      ),
    );
  }
}
