part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoFetched extends TodoEvent{}

 class TodoCreated extends TodoEvent{
  final String title, message;
  TodoCreated({required this.title, required this.message});
}

class TodoUpdated extends TodoEvent{
  final TodoModel todoModel;
  TodoUpdated({required this.todoModel});
}

class TodoDeleted extends TodoEvent{
  final TodoModel todoModel;
  TodoDeleted({required this.todoModel});
}

class TodoSearched extends TodoEvent{
  final String searchTodo;
  TodoSearched({required this.searchTodo});
}

