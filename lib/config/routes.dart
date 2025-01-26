
import 'package:flutter/cupertino.dart';
import 'package:sca_chat_message_app/config/route_strings.dart';
import 'package:sca_chat_message_app/features/auth/presentation/screens/home.dart';
import 'package:sca_chat_message_app/features/auth/presentation/screens/login_screen.dart';
import 'package:sca_chat_message_app/features/auth/presentation/screens/sign_up_screen.dart';

import '../features/auth/presentation/screens/splash_screen.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case AppRouteStrings.signupScreen:
        return CupertinoPageRoute(builder: (_) => SignUpScreen());
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
        
      

      default:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
    }
  }
}
