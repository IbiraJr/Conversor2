import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RichText(text: null),
          TextButton(
            onPressed: (){

          }, child: Text('Entrar'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
          )
        ],
      ),
    );
  }
}
