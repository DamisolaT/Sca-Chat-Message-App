import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/shared/app_button.dart';
import 'package:sca_chat_message_app/core/shared/custom_textform_field.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';

import '../../../../config/route_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
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
        "Sign Up",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.cancel_sharp, color: Colors.grey),
      ),
      actions: [
      TextButton(
          onPressed: () {},
          child: Text(
            "Login",
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
          SizedBox(height: 32,),
          NewsletterCheckbox(),
          SizedBox(height: 43,),
          AppButton(buttonName: "Log In", onPressed: (){ Navigator.pushNamed(
                        context, AppRouteStrings.loginScreen);})
        ],),
      )),
      );
  }
}


class NewsletterCheckbox extends StatefulWidget {
  const NewsletterCheckbox({super.key});

  @override
  _NewsletterCheckboxState createState() => _NewsletterCheckboxState();
}

class _NewsletterCheckboxState extends State<NewsletterCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue ?? false;
            });
          },
        ),
        Expanded(
          child: Text(
            'I would like to receive your newsletter and other promotional information.',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ),
      ],
    );
  }
}
