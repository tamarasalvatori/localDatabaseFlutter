import 'package:database/db_model.dart';
import 'package:flutter/material.dart';
import './user_input.dart';
import './todo_list.dart';
import './todo_model.dart';

class Homepage extends StatefulWidget {
  const Homepage();

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de compras'),
        ),
        body: Column(
          children: [
            Todolist(insertFunction: addItem, deleteFunction: deleteItem),
            UserInput(insertFunction: addItem),
          ],
        ));
  }
}
