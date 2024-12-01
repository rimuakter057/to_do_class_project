

class TodoModel{
  final String title;
  final String description;
  final TodoStatus? status;
  TodoModel({
    required this.title,
    required this.description,
    this.status,
  });
}
enum TodoStatus{idle,inProgress,done}