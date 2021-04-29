import 'package:flutter/material.dart';
import 'addtaskscreen.dart';
import 'task_list.dart';
import 'model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> task = [
    // Task(name: "buy milk ", number:"1" ),
    // Task(name: "buy milk ", number: "1"),
    // Task(name: "buy milk ", number:"1" )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TaskList(task),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context)=>SingleChildScrollView(child: AddTaskScreen((newTitle,newNum){
                  setState(() {
                    task.add(Task(name: newTitle,number:newNum ));
                  });
              })),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

