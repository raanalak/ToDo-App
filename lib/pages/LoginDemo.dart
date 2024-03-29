import 'package:flutter/material.dart';
import 'package:todo/classes/User.dart';
import 'package:todo/pages/SignUpPage.dart';
import 'package:todo/pages/HomePage.dart';

import '../command.dart';
import '../socket.dart';


class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  late User user;
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
                    onChanged: (value) {
                      user.userName = value;
                    },
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
                    onChanged: (value) {
                      user.password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(150, 87, 252, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      if(await _LogInUser()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    },

                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    child: Text(
                      'new user? Creat Account',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 87, 252, 1), fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }

  Future<bool> _LogInUser() async {
    MySocket socket = MySocket(null, Command.LogIn,
        [user.userName, user.password]);
    String response = await socket.sendAndReceive();
    return _checkServerResponse(response);
  }
  bool _checkServerResponse(String value) {
    List<String> list = value.split(';');
    bool userNameValid = list.elementAt(0) == 'true' ? true : false;
    bool passValid = list.elementAt(1) == 'true' ? true : false;

    return userNameValid && passValid;
  }

}
