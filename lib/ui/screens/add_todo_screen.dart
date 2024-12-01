import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
 final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add todo "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "title",
                    labelText: "title",
                    border: OutlineInputBorder()
                  ),
                  validator: (String?value){
                  if (value==null || value!.trim().isEmpty){
                    return "enter title";
                  }
                  return null;
                  },

                ),
                    SizedBox(
            height: MediaQuery.sizeOf(context).height*.02,
                    ),
                TextFormField(
                  maxLines: 10,
                  decoration: const InputDecoration(
                      hintText: "description",
                      labelText: "description",
                      border: OutlineInputBorder()
                  ),
                  validator: (String?value){
                    if (value==null||value!.trim().isEmpty){
                      return "enter description";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*.04,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*.07,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      print("success");
                    }else{
                      print("something is wrong");
                    }
                  },
                      child:const Text("add todo")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
