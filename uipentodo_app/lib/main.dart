
import 'package:flutter/material.dart';
import 'package:uipentodo_app/login_screen.dart';
import 'package:uipentodo_app/registration_screen.dart';
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
     debugShowCheckedModeBanner: false,
     initialRoute: LoginScreen.routeName,
     routes: {
        LoginScreen.routeName :(context)=>LoginScreen(),
        RegistrationScreen.routeName : (context)=> RegistrationScreen(),
       TaskScreen.routeName : (context)=> TaskScreen(),

     },
    ),
    );
  }
}


