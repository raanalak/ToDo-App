import 'package:flutter/material.dart';
import '../classes/Task.dart';
import 'package:todo/pages/TaskPage.dart';


class TaskList extends StatelessWidget {

  late List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                child:
                ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context , index){
                      return ListTile(
                        title: Text(tasks[index].title),
                        onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => TaskPage(task: tasks[index],)));
                        },
                        trailing: Checkbox(
                          value: tasks[index].hasDone,
                          onChanged: (value){

                              tasks[index].hasDone = value ?? false;
                          },
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),

    );
  }



  // Widget _buildFloatingActionButton(BuildContext context) {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       // Handle the action when the button is pressed
  //       Navigator.push( context,
  //         MaterialPageRoute(builder: (context) => TaskPage()),
  //       );
  //     },
  //     child: Icon(Icons.add),
  //   );
  // }
}