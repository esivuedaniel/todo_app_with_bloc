import 'package:flutter/material.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';
import 'package:todo_app_bloc/core/utils/custom_text_style.dart';
import 'package:todo_app_bloc/core/utils/heights.dart';
import 'package:todo_app_bloc/core/utils/util.dart';

class ContentWidget extends StatelessWidget {
  final String title, content;
  final DateTime dateTime;
  const ContentWidget({required this.title,required this.content,required this.dateTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: CustomColors.kContainerColor),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(title, style: CustomTextStyle.kTxtBold,),
          height8,
           Text(content, style:CustomTextStyle.kTxtRegular.copyWith(color: CustomColors.kTextColor3)),
          height8,
           Text(dateString(dateTime:dateTime), style: CustomTextStyle.kTxtRegular ,),
        ],
      ),
    );
  }
}
