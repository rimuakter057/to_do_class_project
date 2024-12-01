
import 'package:flutter/material.dart';
import 'package:to_do_class_project/ui/screens/add_todo_screen.dart';
import 'package:to_do_class_project/ui/screens/update_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodoScreen()));
      },
      child: const Icon(Icons.add),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          onTap: (){
            print("object");
          },
          leading: Text("Status"),
          title: Text("title"),
          subtitle: Text("description"),
          trailing: Wrap(
            children: [
              IconButton(onPressed: (){},
                  icon:const Icon(Icons.delete)),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateTodoScreen()));
              },
                  icon:const Icon(Icons.edit)),
            ],
          ),
        );
      }),
    );
  }
}
