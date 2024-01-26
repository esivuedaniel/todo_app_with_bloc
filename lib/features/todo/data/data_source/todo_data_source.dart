
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';

class TodoDataSource{

  List<TodoModel> todoList=[];

  List<TodoModel> getCreatedTodos(){
    return todoList;
  }

  void createTodo({required String message, required String title,  }){
    todoList.add(TodoModel(id:todoList.length+1, title: title, message: message, dateTime: DateTime.now()));
  }

  void updateTodo({required TodoModel todoModel}){
    todoList[todoList.indexWhere((element) => element.id== todoModel.id)] = todoModel;
  }

  void deleteTodo({required TodoModel todoModel}){
    todoList.remove(todoModel);
  }

  List<TodoModel> filterTodo(String searchKeyword){
    List<TodoModel> results=todoList;
    return results.where((element){
      final titleMatch=element.title.toLowerCase().contains(searchKeyword.toLowerCase());
      final messageMatch= element.message.toLowerCase().contains(searchKeyword.toLowerCase());
      return titleMatch || messageMatch;
    }).toList();
  }


}