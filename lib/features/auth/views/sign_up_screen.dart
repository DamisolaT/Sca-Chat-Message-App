import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sca_chat_message_app/core/shared/app_button.dart';
import 'package:sca_chat_message_app/core/shared/custom_textform_field.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';
import 'package:sca_chat_message_app/features/auth/view_models/authentication_provider.dart';

import '../../../config/route_strings.dart';
import 'package:provider/provider.dart';

import '../../../config/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {
              Navigator.pushNamed(context, AppRouteStrings.loginScreen);
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: AppColors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
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
                    Row(
                      children: [
                        Expanded(child: CustomTextField(controller:_firstNameController, hintText: "First Name")),
                        SizedBox(width: 11,),
                        Expanded(child: CustomTextField(controller:_lastNameController, hintText: "Last Name",)),
                      ],
                    ),
                     SizedBox(height: 16),
                  
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
                    SizedBox(height: 32),
                    NewsletterCheckbox(),
                    SizedBox(height: 43),
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
                          text: "Sign Up",
                          action: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await value.signup(
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
