import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_bloc/features/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';
void main(){

  late TodoDataSource todoDataSource;
  late List<TodoModel> getTodoList;
  setUp((){
    todoDataSource=TodoDataSource();
    getTodoList=todoDataSource.getCreatedTodos();
  });


  group("This is a todo_test for performing CRUD operation", () {

    test("Check for empty todo", (){
      expect(getTodoList, []);
    });

    test("Create and read todos", (){
      todoDataSource.createTodo(title: "My name", message: "Daniel");
      expect(getTodoList.length,1);

      //create another td
      todoDataSource.createTodo(title: "My Skill", message: "Flutter dev");
      expect(getTodoList.length,2);
    });

    test("Update my todo", (){

      todoDataSource.createTodo(title: "todo1", message: "message1",);
      expect(getTodoList[0].title, "todo1");

      final updatedTodo=TodoModel(id: 1, title: "todo2", message: "message2", dateTime: DateTime.now());
      todoDataSource.updateTodo(todoModel: updatedTodo);

      expect(getTodoList[0].title, "todo2");
    });

    test("Delete todo", (){
      todoDataSource.createTodo(message: "my_message", title: "my_title");
      expect(getTodoList.length, 1);

      todoDataSource.deleteTodo(todoModel: getTodoList[0]);

      expect(getTodoList.length, 0);
    });

    //Added bonus for filtering
    test("Filter search", (){
      todoDataSource.createTodo(title: "todo1", message: "message1",);
      todoDataSource.createTodo(title: "Danny", message: "message2",);
      todoDataSource.createTodo(title: "Daniel", message: "message3",);
      expect(getTodoList.length, 3);

      final returnedSearches=todoDataSource.filterTodo("Dan");
      expect(returnedSearches.length, 2);

      final returnedSearchResult=todoDataSource.filterTodo("Flutter");
      expect(returnedSearchResult.length, 0);
    });

  });




}