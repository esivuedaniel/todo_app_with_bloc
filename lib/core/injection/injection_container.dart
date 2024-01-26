import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/features/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app_bloc/features/todo/data/repository/todo_repository.dart';

final inject=GetIt.instance;
setUpLocator(){
  inject.registerLazySingleton<TodoDataSource>(() => TodoDataSource());
  inject.registerLazySingleton<TodoRepository>(() => TodoRepository(inject()));
}