import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;
  AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newTitle;
    String newNum;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                 color: Colors.pink[300]
           ),
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
                    onChanged: (value){
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
                  onChanged: (num){
                    newNum = num;
                  },
                ),
              ),

              RaisedButton(
                  onPressed: (){
                    addTaskCallBack(newTitle,newNum);
                  },
                   child: Text('Add'),
                elevation: 5,
                color: Colors.pink,
              ),
            ],

          ),
        ),
      ),
    );
  }
}
