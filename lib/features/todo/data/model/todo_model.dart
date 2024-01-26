class TodoModel{
  int id;
  String title;
  String message;
  DateTime dateTime;

  TodoModel({required this.id,
    required this.title,
    required this.message,
    required this.dateTime});

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, message: $message, dateTime: $dateTime}';
  }
}