import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/core/components/reusable_widgets.dart';
import 'package:todo_app_bloc/core/routes/pages.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';
import 'package:todo_app_bloc/core/utils/heights.dart';
import 'package:todo_app_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/features/todo/presentation/widgets/content_widget.dart';
import 'package:todo_app_bloc/features/todo/presentation/widgets/dismissible_widget.dart';
import 'package:todo_app_bloc/features/todo/presentation/widgets/empty_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    context.read<TodoBloc>().add(TodoFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSize(),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (BuildContext context, TodoState state) {

          if(state is TodoFailure){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(backgroundColor: CustomColors.kErrorColor, content: Text(state.errorMessage)));
          }
          if(state is TodoSuccess){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(backgroundColor:CustomColors.kSuccessColor, content: Text(state.successMessage)));
          }

        },
        builder: (context, state) {

          if(state is TodoData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSearchBox(textEditingController: searchText, onChanged: (value) {
                  context.read<TodoBloc>().add(TodoSearched(searchTodo: value));
                }),

                Expanded(
                  child: state.todoList.isEmpty?const EmptyScreen(): CustomizedContainer(
                    child: ListView.separated(
                      itemCount: state.todoList.length,
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (_, int position) {
                        return GestureDetector(
                          onTap:()=> Navigator.pushNamed(context, Pages.createNewTask, arguments:state.todoList[position]),
                          child: DismissibleWidget(
                            onDismissed:(direction) => context.read<TodoBloc>().add(TodoDeleted(todoModel: state.todoList[position])),
                            child: ContentWidget(title: state.todoList[position].title,
                                content: state.todoList[position].message,
                                dateTime:state.todoList[position].dateTime),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => height14,),
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () =>Navigator.pushNamed(context, Pages.createNewTask, arguments: null)),
    );
  }
}
