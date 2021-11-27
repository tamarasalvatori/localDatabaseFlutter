import 'package:flutter/material.dart';
import './todo_model.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  final Function insertFunction;
  UserInput({this.insertFunction, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      hintText: 'Adicione um novo item',
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                var myTodo = Todo(
                    title: textController.text,
                    creationDate: DateTime.now(),
                    isChecked: false);
                insertFunction(myTodo);
              },
              child: Container(
                color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
