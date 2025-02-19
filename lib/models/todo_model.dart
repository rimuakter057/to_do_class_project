

class TodoModel{
  final String title;
  final String description;
  final TodoStatus? status;
  TodoModel({
    required this.title,
    required this.description,
    this.status=TodoStatus.idle,
  });
}
enum TodoStatus{idle,inProgress,done}