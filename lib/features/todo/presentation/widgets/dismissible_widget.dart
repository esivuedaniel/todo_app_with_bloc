import 'package:flutter/material.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';

class DismissibleWidget extends StatelessWidget {
  final Widget child;
  final Function(DismissDirection)? onDismissed;
  const DismissibleWidget({super.key, required this.child, required this.onDismissed});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        direction: DismissDirection.endToStart,
        key:UniqueKey(),
        onDismissed: onDismissed,
        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(color: CustomColors.kDeleteColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),),
          child: const Icon(Icons.delete, color: CustomColors.kIconDeleteColor,),),
    child: child);
  }
}
