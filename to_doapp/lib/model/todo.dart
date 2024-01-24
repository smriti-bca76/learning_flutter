class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
      ToDo(id: '02', todoText: 'Buy groceries', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Using Phone',
      ),
      ToDo(
        id: '05',
        todoText: 'Dinner Time',
      ),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      todoText: map['todoText'],
      isDone: map['isDone'] == 1,
    );
  }
}
