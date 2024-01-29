import 'package:flutter/material.dart';
import 'package:todo/pages/LoginDemo.dart';

import '../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();

}


class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Color.fromRGBO(150, 87, 252, 1),
                    fontSize: 25.0,
                  ),

                ),
              )
          ),
        ),

      ),
      Padding(
        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'UserName',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 30, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'email',
          ),
        ),
      ),
      Container(
        height: 70,
        width: 250,
        decoration: BoxDecoration(
            color: Color.fromRGBO(150, 87, 252, 1),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()));
          },
          child: Text(
            'SignUp',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      ],
        )
      )
    );
  }

}
