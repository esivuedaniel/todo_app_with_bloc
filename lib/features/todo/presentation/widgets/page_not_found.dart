import 'package:flutter/material.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.kWhiteColor,
        body: Center(child: Text("Page not found", style: TextStyle(fontSize: 20),))
    );
  }
}
