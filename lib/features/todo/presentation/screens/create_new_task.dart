import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/core/components/reusable_widgets.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';
import 'package:todo_app_bloc/core/utils/heights.dart';
import 'package:todo_app_bloc/features/todo/data/model/todo_model.dart';
import 'package:todo_app_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/features/todo/presentation/widgets/header_widget.dart';

class CreateNewTask extends StatefulWidget {
  final TodoModel? todoModel;
   const CreateNewTask({required this.todoModel, super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  TextEditingController titleController=TextEditingController();
  TextEditingController messageController=TextEditingController();

  @override
  void initState() {
    titleController.text=widget.todoModel?.title??"";
    messageController.text=widget.todoModel?.message??"";
    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: appBarSize(),
        body:  Column(
          children: [
            HeaderWidget(
                onPressedCheck:()=> Navigator.pop(context),
                onPressDelete:(){
              if(widget.todoModel != null){
                context.read<TodoBloc>().add(TodoDeleted(todoModel: widget.todoModel!));
                Navigator.pop(context);
              }
                }, isEditable: widget.todoModel==null?false:true,),
            height18,
            Expanded(
              child: CustomizedContainer(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  children: [
                    height18,
                    CustomizedTextField(textEditingController: titleController, hintTxt: "Enter Title",),
                    height18,
                    CustomizedTextField(textEditingController: messageController, hintTxt: "Enter Message",),
                    height50,
                    Center(child: TextButton(
                      onPressed: () {
                        if(titleController.text.isNotEmpty && messageController.text.isNotEmpty){
                          //if todoModel is not null, update data
                          if(widget.todoModel !=null){
                            context.read<TodoBloc>().add(TodoUpdated(todoModel:TodoModel(id: widget.todoModel!.id, title: titleController.text, message: messageController.text, dateTime: DateTime.now())));
                          }else{
                            context.read<TodoBloc>().add(TodoCreated(title: titleController.text, message: messageController.text));
                          }
                          Navigator.pop(context);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter content")));
                        }
                      },
                      child: const Text("Save Data",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),))
                  ],
                ),
              ),
            )
            // const Placeholder(),
          ],
        ));
  }
}

