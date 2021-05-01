import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final  String number;
  final Function checkBoxCallBack;

  TaskTile({this.number, this.isChecked, this.title,this.checkBoxCallBack});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.pink[200],
              borderRadius: BorderRadius.circular(20),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3),
                )
              ]
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Text(number),
            ),
            title: Text(
              title,
              style:
              TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              value: isChecked,
              onChanged: checkBoxCallBack,
            ),
          )
      ),
    );
  }
}
