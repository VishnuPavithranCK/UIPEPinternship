import 'package:flutter/material.dart';
import 'addtaskscreen.dart';
import 'task_list.dart';
// import 'model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TaskScreen extends StatefulWidget {
  static const String routeName = 'TaskScreen';
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [

         IconButton(icon:  Icon(Icons.close), onPressed: (){
           FirebaseAuth.instance.signOut();
           Navigator.pop(context);
    })
        ],
        title: Text("Todo"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TaskList(),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context)=>SingleChildScrollView(child: AddTaskScreen()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

