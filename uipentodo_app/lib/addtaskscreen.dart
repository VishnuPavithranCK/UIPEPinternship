import 'package:flutter/material.dart';
import 'package:uipentodo_app/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_bloc.dart';
import 'task_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTaskScreen extends StatelessWidget {
  final _auth = Firestore.instance;

  @override
  Widget build(BuildContext context) {
  final textController = TextEditingController();
  final numController = TextEditingController();
    String newTitle;
    String newNum;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.pink[300]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.pink,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Add Tasks',
                  ),
                  controller: textController,
                  onChanged: (value) {
                    newTitle = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.pink,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Add task number',
                  ),
                  controller: numController,
                  onChanged: (num) {
                    newNum = num;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {

                  BlocProvider.of<TaskBloc>(context)
                      .add(TaskEvent.add(Task(name: newTitle, number: newNum)));
                  textController.clear();
                  numController.clear();

                  _auth.collection('Tasks').add(
                    {
                      'task': newTitle,
                      'tasknumber': newNum,
                    },
                  );
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
