import 'package:flutter/material.dart';
import 'package:to_do_class_project/models/todo_model.dart';
import 'package:to_do_class_project/ui/screens/add_todo_screen.dart';
import 'package:to_do_class_project/ui/screens/update_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<TodoModel> todoList = [];
  // add todo
  void addTodo(TodoModel todoModel) {
    todoList.add(todoModel);
    setState(() {});
  }

  //delete todo
  void deleteTodo(int index) {
    todoList.removeAt(index);
    setState(() {});
  }

  //update todo
  void updateTodo(int index, TodoModel todoModel) {
    todoList[index] = todoModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TodoModel? todoModel = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTodoScreen(),
              ),
          );
          if (todoModel != null){
            addTodo(todoModel);
          }


        },
        child: const Icon(Icons.add),
      ),
      body: Visibility(
        visible: todoList.isNotEmpty,
        replacement: const Center(child: Text("No todo here")),
        child: ListView.builder(
             itemCount: todoList.length,
            itemBuilder: (context, index) {
          TodoModel todoModel = todoList[index];
          return ListTile(
            onTap: () {
              print("object");
            },
            title:  Text(todoModel.title,style: TextStyle(color: Colors.red),),
            leading:  Text(todoModel.status!.name),
            subtitle: Text(todoModel.description),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateTodoScreen()));
                    },
                    icon: const Icon(Icons.edit)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
