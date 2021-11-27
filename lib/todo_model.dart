class Todo {
  int id;
  String title;
  bool isChecked;

  Todo({
    this.id,
    this.title,
    this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked ? 1 : 0,
    };
  }
}
