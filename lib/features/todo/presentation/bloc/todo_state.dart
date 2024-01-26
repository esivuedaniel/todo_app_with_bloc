part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

class TodoInitial extends TodoState {}
class TodoData extends TodoState {
  final List<TodoModel> todoList;
  TodoData({required this.todoList});
}

class TodoSuccess extends TodoState{
  final String successMessage;
  TodoSuccess({required this.successMessage});
}
class TodoFailure extends TodoState{
  final String errorMessage;
  TodoFailure({required this.errorMessage});
}