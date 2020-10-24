import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './DetailsDrink.dart';


class Cocktail extends StatefulWidget {
  @override
  _CocktailState createState() => _CocktailState();
}

class _CocktailState extends State<Cocktail> {

  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()async{
    var res=await http.get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass');


    setState(() {
      data=jsonDecode(res.body)["drinks"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Cocktail app'),
        centerTitle: true,

      ),
      body:Center(
        child: data==null?CircularProgressIndicator(): Container(

          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return
                  (
                    ListTile(
                      title: Text('${data[index]["strDrink"] }'),
                      leading:Hero(
                        tag:data[index]["idDrink"],
                        child: CircleAvatar(
                          backgroundImage:  NetworkImage(
                              data[index]["strDrinkThumb"]
                          ),

                        ),
                      ),
                      subtitle: Text('${data[index]["idDrink"]}'),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>Details(detail:data[index])
                        ));
                      },
                    )
                  );
              },

          ),
        ),
      ),
    );
  }
}
