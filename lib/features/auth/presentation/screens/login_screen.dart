import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/shared/app_button.dart';
import 'package:sca_chat_message_app/core/shared/custom_textform_field.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';

import '../../../../config/route_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _emailController = TextEditingController();
  //final _emailNode = FocusNode();
  final _passwordController = TextEditingController();
  //final _passwordNode = FocusNode();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
     appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Sign Up",
              style: TextStyle(color: AppColors.green, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
  ),

      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(height: 32,),
          CustomTextField(controller: _emailController, hintText: "Email or Phone Number",isObscureText: false,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),),
          SizedBox(height: 16,),
          CustomTextField(controller: _passwordController, hintText: "Password",isObscureText: true, 
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),),
          SizedBox(height: 167,),
          
        
          AppButton(buttonName: "Log In", onPressed: (){ Navigator.pushNamed(
                        context, AppRouteStrings.homeScreen);}),
          SizedBox(height: 16,),
         GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.green,
                ),
              ),
            ),

        ],),
      )),
      );
  }
}
