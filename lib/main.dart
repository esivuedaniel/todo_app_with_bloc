import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/core/bloc_observer/app_bloc_observer.dart';
import 'package:todo_app_bloc/core/injection/injection_container.dart';
import 'package:todo_app_bloc/core/routes/app_router.dart';
import 'package:todo_app_bloc/core/routes/pages.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';
import 'package:todo_app_bloc/features/todo/data/repository/todo_repository.dart';
import 'package:todo_app_bloc/features/todo/presentation/bloc/todo_bloc.dart';

void main() {
  setUpLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>  TodoRepository(inject()),
      child: BlocProvider(create: (context) => TodoBloc(inject()),
        child: MaterialApp(
          title: 'Todo app',
          debugShowCheckedModeBanner: false,
          initialRoute: Pages.initial,
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: CustomColors.kPrimaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.kPrimaryColor),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}

