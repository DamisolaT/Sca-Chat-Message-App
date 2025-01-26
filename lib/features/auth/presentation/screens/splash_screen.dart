

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/route_strings.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.green,
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: SvgPicture.asset(AppIcons.messageLogo)
              ),
              Text("Text Message", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: AppColors.white),)
            
          ],
        )));
  }

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;
     Navigator.pushNamed(context, AppRouteStrings.signupScreen);
  }
}
