import 'package:flutter/material.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';

class TodoEdit extends StatefulWidget {
  final Todo todo;
  final TodoDetailsViewmodel todoDetailsViewmodel;

  const TodoEdit({
    super.key,
    required this.todo,
    required this.todoDetailsViewmodel,
  });

  @override
  State<TodoEdit> createState() => _TodoEdit();
}

class _TodoEdit extends State<TodoEdit> {
  final _formkey = GlobalKey<FormState>();

  late final TextEditingController nameController = TextEditingController(
    text: widget.todo.name
  );

  late final TextEditingController descriptionController = TextEditingController(
    text: widget.todo.description
  );

  final verticalGap =  SizedBox(
    height: 16,
  );

  void _onUpdate () {
    if(widget.todoDetailsViewmodel.updateTodo.running) {
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
      if(widget.todoDetailsViewmodel.updateTodo.completed) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Todo atualizado com sucesso")
          )
        );
      }
      if(widget.todoDetailsViewmodel.updateTodo.error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Ocorreu erro ao atualizar o todo")
          )
        );
      }
    }
  }

  @override
  void initState() {
    widget.todoDetailsViewmodel.updateTodo.addListener(_onUpdate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
            TextFormField(
              minLines: 3,
              maxLines: null,
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Descrição",
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if(value == null || value.trim() == "") {
                  return "Por favor preencha o campo de descrição";
                }

                return null;
              },
            ),
            verticalGap,
            ElevatedButton(
              onPressed: () {
                if(_formkey.currentState?.validate() == true) {
                  widget.todoDetailsViewmodel.updateTodo.execute(widget.todo.copyWith(
                    name: nameController.text,
                    description: descriptionController.text
                  ));
                }
              }, 
              child: const Text("Enviar")
            )
          ],
        ),
      )
    );
  }

  @override 
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    widget.todoDetailsViewmodel.updateTodo.removeListener(_onUpdate);
    super.dispose();
  }
}