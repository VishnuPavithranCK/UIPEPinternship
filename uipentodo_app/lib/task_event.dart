import 'model.dart';

enum EventType {add,}

class TaskEvent {

  Task task;
  EventType eventType;


  TaskEvent.add(Task task){
    this.eventType =EventType.add;
    this.task = task;



  }

}