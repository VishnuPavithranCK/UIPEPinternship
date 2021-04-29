import 'package:flutter/material.dart';
import 'package:uipentodo_app/task_tile.dart';
import 'model.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: widget.tasks[index].name,
            number: widget.tasks[index].number,
            isChecked: widget.tasks[index].isDone,
              checkBoxCallBack :(checkBoxState){
          setState(() {
          widget.tasks[index].toggleDone() ;
          });
              }

          );
        });
  }
}
