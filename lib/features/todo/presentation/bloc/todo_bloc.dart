import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';
import 'package:todo_app_bloc/features/todo/data/repository/todo_repository.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<TodoCreated>(_addTodo);
    on<TodoFetched>(_fetchTodos);
    on<TodoUpdated>(_updateTodo);
    on<TodoDeleted>(_deleteTodo);
    on<TodoSearched>(_searchedTodo);
  }

  _addTodo(TodoCreated event, Emitter<TodoState> emit) {
    if(event.title.isEmpty){
      emit(TodoFailure(errorMessage: "Add title to field"));
    }
    if(event.message.isEmpty){
      emit(TodoFailure(errorMessage: "Add message to field"));
    }
    todoRepository.createNewTodo(message: event.message, title: event.title);
    emit(TodoSuccess(successMessage: "${event.title} added successfully"));
    final todos=todoRepository.getTodos();
    emit(TodoData(todoList: todos));
  }

  _fetchTodos(TodoFetched event, Emitter<TodoState> emit){
    final dataList=todoRepository.getTodos();
    emit(TodoData(todoList: dataList));
  }

  _updateTodo(TodoUpdated event, Emitter<TodoState> emit){
    todoRepository.updateTodo(todoModel: event.todoModel);
    emit(TodoSuccess(successMessage: "Updated successfully"));
    final todos=todoRepository.getTodos();
    emit(TodoData(todoList: todos));
  }

  _deleteTodo(TodoDeleted event, Emitter<TodoState>  emit){
    todoRepository.deleteTodo(todoModel: event.todoModel);
    emit(TodoSuccess(successMessage: "Successfully deleted"));

    final todaData=todoRepository.getTodos();
    emit(TodoData(todoList: todaData));
  }

  _searchedTodo(TodoSearched event, Emitter<TodoState> emit){
    final searchTodo=todoRepository.searchTodo(event.searchTodo);
    emit(TodoData(todoList: searchTodo));
  }

}
