class Todo {
  int id;
  String title;
  DateTime creationDate;
  bool isChecked;

  Todo({
    this.id,
    this.title,
    this.creationDate,
    this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, creationDate: $creationDate, isChecked: $isChecked)';
  }
}
