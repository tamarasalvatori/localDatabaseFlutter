import 'package:flutter/material.dart';
import './db_model.dart';
import './todo_card.dart';

class Todolist extends StatelessWidget {
  Todolist({this.insertFunction, this.deleteFunction, Key key})
      : super(key: key);

  final Function insertFunction;
  final Function deleteFunction;
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: db.getTodo(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        var data = snapshot.data;
        var datalenght = data.length;

        return datalenght == 0
            ? const Center(
                child: Text('No data found'),
              )
            : ListView.builder(
                itemCount: datalenght,
                itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction),
              );
      },
    ));
  }
}
