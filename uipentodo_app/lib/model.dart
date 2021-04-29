class Task{
  final String name;
  final String number;
   bool isDone;

  Task({this.name,this.number, this.isDone=false});

  void toggleDone(){
    isDone =!isDone;
  }
}