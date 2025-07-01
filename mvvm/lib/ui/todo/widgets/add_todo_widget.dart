import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

class AddTodoWidget extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  const AddTodoWidget({super.key, required this.todoViewmodel});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidget();
}

class _AddTodoWidget extends State<AddTodoWidget> {
  final _formkey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  final verticalGap =  SizedBox(
    height: 16,
  );

  @override
  void initState() {
    widget.todoViewmodel.addTodo.addListener(_onResult);
    super.initState();
  }

  void _onResult () {
    if(widget.todoViewmodel.addTodo.running) {
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: IntrinsicHeight(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      );
    } else {
      if(widget.todoViewmodel.addTodo.completed) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Todo criado com sucesso")
          )
        );
      }
      if(widget.todoViewmodel.addTodo.error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Ocorreu erro ao criar o todo")
          )
        );
      }
    }
  }

  @override 
  void dispose() {
    nameController.dispose();
    widget.todoViewmodel.addTodo.removeListener(_onResult);
    super.dispose();
  }
  
  @override 
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget> [
              const Row(
                children: <Widget>[
                  Text("Adicione novos todos")
                ],
              ),
              verticalGap,
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Nome",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if(value == null || value.trim() == "") {
                    return "Por favor preencha o campo de nome";
                  }

                  return null;
                },
              ),
              verticalGap,
              ElevatedButton(
                onPressed: () {
                  if(_formkey.currentState?.validate() == true) {
                    widget.todoViewmodel.addTodo.execute(nameController.text);
                  }
                }, 
                child: const Text("Enviar")
              )
            ],
          ),
        )
      ),
    );
  }
}

