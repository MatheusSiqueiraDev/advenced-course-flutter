import 'package:flutter/material.dart';

class TodoDetailsScreen extends StatefulWidget {
  final String id;

  const TodoDetailsScreen({
    super.key,
    required this.id
  });

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreen();
}

class _TodoDetailsScreen extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listando detalhe do Todo"),
      ),
      body: Center(
        child: Text('Vizualizando todo com id ${widget.id}'),
      ),
    );
  }
}