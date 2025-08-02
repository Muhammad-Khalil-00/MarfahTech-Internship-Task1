
class Task{
   String title;
   String description;
  bool  isCompleted;
   Task({
     required this.isCompleted,
    required this.title,
     required this.description

});
   void isDone(){
     isCompleted= !isCompleted;
   }

  void update(String newTitle, String newDescription) {
    title = newTitle;
    description = newDescription;
  }
}