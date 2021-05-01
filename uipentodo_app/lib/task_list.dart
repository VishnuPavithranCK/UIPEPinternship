import 'package:flutter/material.dart';
 import 'package:uipentodo_app/task_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'task_bloc.dart';


class TaskList extends StatefulWidget {

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: BlocConsumer<TaskBloc, List<Task>>(
        buildWhen: (List<Task> previous, List<Task> current){
          return true;
        },
        listenWhen: (List<Task> previous, List<Task> current){
          if (current.length > previous.length){
            return true;
          }
          return false;
        },
         builder: (context, taskList){
          return ListView.builder(
            physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: (context, index){
                print(taskList[index].name);
                print(taskList.length);
                 return  TaskTile(
                   title: taskList[index].name,
                   number: taskList[index].number,
                   isChecked: taskList[index].isDone,
                   checkBoxCallBack: (checkBoxState){
                    setState(() {
                      taskList[index].toggleDone();
                    });
                   }

                 );
              }
              );
         },
        listener: (BuildContext context , taskList){
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Added',textAlign: TextAlign.center,)),
          );
        },
      ),
    );
  }
}
