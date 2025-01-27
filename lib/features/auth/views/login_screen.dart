import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sca_chat_message_app/config/routes.dart';
import 'package:sca_chat_message_app/core/shared/app_button.dart';
import 'package:sca_chat_message_app/core/shared/custom_textform_field.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sca_chat_message_app/features/auth/view_models/authentication_provider.dart';

import '../../../config/route_strings.dart';

// Define your email regex here if you haven't already
final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Example regex

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {
              Navigator.pushNamed(context, AppRouteStrings.signupScreen);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: AppColors.green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<AuthenticationProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email or Phone Number",
                      isObscureText: false,
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z@._-]'))
                      ],
                      validator: (a) {
                        if (!emailRegex.hasMatch(a ?? "")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Password",
                      isObscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      inputFormatter: [
                        FilteringTextInputFormatter.deny(RegExp(r' '))
                      ],
                      validator: (a) =>
                          (a ?? '').isNotEmpty ? null : "Invalid password",
                    ),
                    SizedBox(height: 167),
                   if (value.loading)
                        Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(AppColors.white),
                             backgroundColor: AppColors.green,  
                             strokeWidth: 3.0,
                          ),
                        )
                      else
                        AppButton(
                          text: "Log In",
                          action: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await value.login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ).then((result) {
                                if (result.error != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(result.error ?? "")),
                                  );
                                } else {
                                  AppRouter.pushAndClear(AppRouteStrings.homeScreen);
                                }
                              });
                            }
                          },
                        ),  
                      
                    const SizedBox(height: 16),
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
