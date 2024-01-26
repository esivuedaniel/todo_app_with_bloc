import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';

class CustomizedContainer extends StatelessWidget {
  final Widget? child;
  const CustomizedContainer({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/1.15,
      decoration: const BoxDecoration(
          color: CustomColors.kWhiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
      ),
      child: child,
    );
  }
}

PreferredSize appBarSize({double ? height, Color? overlaycolor}){
  return PreferredSize(preferredSize: Size.fromHeight(height??16), child: AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.light, statusBarColor: Colors.transparent),
    backgroundColor:overlaycolor?? Colors.transparent, elevation: 0,),);
}



class AnimatedSearchBox extends StatelessWidget {
 final Function? onChanged;
 final TextEditingController textEditingController;
 final Function? onCollapseComplete;
 const AnimatedSearchBox({required this.onChanged, this.onCollapseComplete, required this.textEditingController, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchBarAnimation(
        textEditingController: textEditingController,
        isOriginalAnimation: true,
        isSearchBoxOnRightSide: true,
        // searchBoxWidth: 280,
        buttonBorderColour: Colors.transparent,
        buttonColour: CustomColors.kPrimaryColor,
        buttonShadowColour: Colors.transparent,
        cursorColour: Colors.transparent,
        enableKeyboardFocus: true,
        searchBoxBorderColour: Colors.transparent,
        enableBoxBorder: false,
        enableButtonShadow: false,
        buttonWidget: SvgPicture.asset("images/search_svg.svg"),
        onChanged:onChanged,
        onCollapseComplete:onCollapseComplete,
        trailingWidget: const SizedBox.shrink(),
        secondaryButtonWidget: const Icon(Icons.close, color: CustomColors.kTextColor2,),
      ),
    );
  }
}


class CustomizedTextField extends StatelessWidget {
  final TextEditingController ? textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final  String ? labeltxt;
  final String ? hintTxt;
  final bool ? obsec;
  final Widget ? surffixWidget;
  final Function(String)? onChanged;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final BoxConstraints? suffixIconConstraints;
  final int? maxLines;
  final int?maxLength;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormat;


  const CustomizedTextField({super.key,  this.maxLines,this.textEditingController, this.keyboardType, this.textInputAction, this.labeltxt, this.hintTxt,
    this.obsec, this.surffixWidget, this.inputFormat, this.readOnly, this.onChanged, this.validator, this.onTap, this.suffixIconConstraints,
    this.maxLength, this.suffixText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obsec?? false,
      textCapitalization: TextCapitalization.sentences,
      controller: textEditingController,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      readOnly: readOnly??false,
      onTap:onTap ,
      textInputAction: textInputAction,
      inputFormatters: inputFormat ?? [],
      onChanged:onChanged,
      maxLength:maxLength ,
      maxLines: maxLines??1,
      validator:validator?? (value) {
        if (value!.isEmpty) {
          return "Fill empty field";
        } else {
          return null;
        }
      },
      style: const TextStyle(color: Color(0xff303237), fontWeight: FontWeight.w400, fontSize: 14),
      decoration:  InputDecoration(
          hintText: hintTxt,
          isDense: true,
          suffixText: suffixText,
          suffixIconConstraints: suffixIconConstraints ?? const BoxConstraints(minWidth: 19, minHeight: 19,) ,
          suffixIcon: surffixWidget ?? const SizedBox.shrink(),
          fillColor: CustomColors.kWhiteColor,
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: CustomColors.kTextColor3, width: 0.5), borderRadius: BorderRadius.circular(4),),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: CustomColors.kTextColor3), borderRadius: BorderRadius.circular(4),),
          errorBorder:  OutlineInputBorder(borderSide:  const BorderSide(color: Colors.red, width: 0.2), borderRadius: BorderRadius.circular(4),),
          border: OutlineInputBorder(borderSide: const BorderSide(color: CustomColors.kTextColor3), borderRadius: BorderRadius.circular(4),) ,
          focusedErrorBorder: OutlineInputBorder(borderSide:  const BorderSide(color:CustomColors.kTextColor3, width: 0.5), borderRadius: BorderRadius.circular(4),),
          hintStyle: const TextStyle(color: Color(0xff7E8494), fontWeight: FontWeight.w400, fontSize: 14)
      ),
    );
  }
}
