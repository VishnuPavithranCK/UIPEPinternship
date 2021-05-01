import 'task_event.dart';
import 'model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, List<Task>>{
  // ignore: deprecated_member_use
  List<Task> get initialState => List<Task>();

  TaskBloc(List<Task> initialState) : super(initialState);

  @override
  Stream<List<Task>> mapEventToState(TaskEvent event)  async*{
    switch (event.eventType){
      case EventType.add:
        List<Task>  newTask= List.from(state);
        if (event.task !=null) {
          newTask.add(event.task);
        }
        yield newTask;
        break;
      default:
        throw Exception('event not found ');
    }
  }
}