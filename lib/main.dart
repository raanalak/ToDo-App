
import 'package:flutter/material.dart';
import 'package:todo/pages/LoginDemo.dart';

void main() => runApp(myApp());

class myApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _myAppState();
}
class _myAppState extends State<myApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}


class User{
  late String userName;
  late String password;
  late String email;

  User(String userName, String password, String email) {
    // Validate and set username
    if (isValidUsername(userName)) {
      this.userName = userName;
    } else {
      throw Exception('Invalid username');
    }

    // Validate and set password
    if (isValidPassword(password)) {
      this.password = password;
    } else {
      throw Exception('Invalid password');
    }

    // Validate and set email
    if (isValidEmail(email)) {
      this.email = email;
    } else {
      throw Exception('Invalid email');
    }
  }

}
bool isValidUsername(String username) {
  // You can add your own validation logic for the username
  return username.isNotEmpty;
}

bool isValidPassword(String password) {
  // Password must contain at least 8 characters, one capital letter, one small letter, and one digit
  final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
  return passwordRegex.hasMatch(password);
}

bool isValidEmail(String email) {
  // Simple email validation using RegExp
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}




class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }

}


