import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_bloc/core/routes/pages.dart';
import 'package:todo_app_bloc/core/utils/color_palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _startTime();
    super.initState();
  }
  _startTime()async{
    Future.delayed(const Duration(milliseconds: 4000), ()=> Navigator.pushNamedAndRemoveUntil(context, Pages.home, (route) => false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kPrimaryColor,
      body: Center(child: SvgPicture.asset("images/logo.svg")),
    );
  }


}
