
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/config/route_strings.dart';
import 'package:sca_chat_message_app/features/home/views/home.dart';
import 'package:sca_chat_message_app/features/auth/views/login_screen.dart';
import 'package:sca_chat_message_app/features/auth/views/sign_up_screen.dart';

import '../features/auth/views/splash_screen.dart';
import '../features/home/views/chat_screen.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.splashScreen:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case AppRouteStrings.signupScreen:
        return CupertinoPageRoute(builder: (_) => SignUpScreen());
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      case AppRouteStrings.chatScreen:
        return CupertinoPageRoute(builder: (_) => ChatScreen());
        
        
      

      default:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
    }
  }
  static Future<void> push(String name, {Object? arg}) async {
    await navKey.currentState?.pushNamed(name, arguments: arg);
  }

  static void pushReplace(String name, {Object? arg}) {
    navKey.currentState?.pushReplacementNamed(name, arguments: arg);
  }

  static void pop({Object? arg}) {
    navKey.currentState?.pop(arg);
  }

  static void pushAndClear(String name, {Object? arg}) {
    navKey.currentState?.pushNamedAndRemoveUntil(name, (_) => false);
  }

   static void message(String msg, {bool? isSuccessful}) {
    ScaffoldMessenger.of(navKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
