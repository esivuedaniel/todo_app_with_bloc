import 'package:flutter/material.dart';

import '../../../../core/utils/color_palette.dart';

class HeaderWidget extends StatelessWidget {
  final Function()? onPressedCheck, onPressDelete;
  final bool isEditable;
  const HeaderWidget({required this.onPressedCheck, required this.onPressDelete, required this.isEditable, super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPressedCheck, icon: const Icon(Icons.arrow_back_ios,color: CustomColors.kWhiteColor,)),
          isEditable? IconButton(onPressed: onPressDelete, icon: const Icon(Icons.delete,color: CustomColors.kWhiteColor,)):const SizedBox.shrink(),
        ],
      ),
    );
  }
}
