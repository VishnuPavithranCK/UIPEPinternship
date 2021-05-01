import 'package:flutter/material.dart';
import 'taskScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_bloc.dart';
import 'model.dart';
void main(){
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Task> task = [
    // Task(name: 'Buy milk'),
    // Task(name: 'Buy eggs'),
    // Task(name: 'Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(task),
    child: MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[600],
      ),
      home: TaskScreen(),
    ),
    );
  }
}


