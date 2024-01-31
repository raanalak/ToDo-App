import 'package:flutter/material.dart';
import 'package:todo/pages/TaskList.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
        children: [
          Expanded(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextButton(context, 'My Day', TaskList()),
             Divider(),
              _buildTextButton(context, 'Important', TaskList()),
             Divider(),
              _buildTextButton(context, 'All Tasks', TaskList()),
            ],
          ),
          ),
        ],
      ),
      ),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, String text, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
          color: Color.fromRGBO(150, 87, 252, 1), // Optional: Change the text color on tap

        ),
      ),
    );
  }

}
