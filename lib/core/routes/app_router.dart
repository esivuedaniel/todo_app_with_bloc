import 'package:flutter/material.dart';
import 'package:todo_app_bloc/core/routes/pages.dart';
import 'package:todo_app_bloc/core/utils/transition.dart';
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';
import 'package:todo_app_bloc/features/todo/presentation/screens/create_new_task.dart';
import 'package:todo_app_bloc/features/todo/presentation/screens/home_screen.dart';
import 'package:todo_app_bloc/features/todo/presentation/widgets/page_not_found.dart';
import 'package:todo_app_bloc/splash_screen.dart';

Route onGenerateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case Pages.initial:
      return MaterialPageRoute(builder: (context)=> const SplashScreen());
    case Pages.home:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());
    case Pages.createNewTask:
      if(routeSettings.arguments is TodoModel){
        final dataArg=routeSettings.arguments as TodoModel;
        return ScaleTransition1(page: CreateNewTask(todoModel: dataArg,));
      }else{
        return ScaleTransition1(page: const CreateNewTask(todoModel:null,));
      }
    default:
      return MaterialPageRoute(builder: (context)=> const PageNotFound());
  }
}


