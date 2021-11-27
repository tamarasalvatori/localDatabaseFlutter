import 'package:flutter/material.dart';
import './todo_model.dart';

class Todocard extends StatefulWidget {
  Todocard(
      {this.id,
      this.title,
      this.creationDate,
      this.isChecked,
      this.insertFunction,
      this.deleteFunction,
      Key key})
      : super(key: key);

  int id;
  String title;
  DateTime creationDate;
  Function insertFunction;
  Function deleteFunction;
  bool isChecked;

  @override
  _TodocardState createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);

    return Card(
        child: Row(
      children: [
        Container(
          child: Checkbox(
            value: widget.isChecked,
            onChanged: (bool value) {
              setState(() {
                widget.isChecked = value;
              });
              anotherTodo.isChecked = value;
              widget.insertFunction(anotherTodo);
            },
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.creationDate.toString()),
          ],
        )),
        IconButton(
          onPressed: () {
            widget.deleteFunction(anotherTodo);
          },
          icon: Icon(Icons.close),
        ),
      ],
    ));
  }
}
