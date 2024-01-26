import 'package:todo_app_bloc/features/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';

class TodoRepository{
  TodoDataSource todoDataSource;
  TodoRepository(this.todoDataSource);

  List<TodoModel> getTodos(){
    return todoDataSource.getCreatedTodos();
  }

  void createNewTodo({required String message,required String title}){
   todoDataSource.createTodo(message: message, title: title);
  }

  void updateTodo({required TodoModel todoModel}){
    todoDataSource.updateTodo(todoModel: todoModel);
  }

  void deleteTodo({required TodoModel todoModel}){
    todoDataSource.deleteTodo(todoModel: todoModel);
  }

  List<TodoModel> searchTodo(String searchKeyword){
    return todoDataSource.filterTodo(searchKeyword);
  }

}