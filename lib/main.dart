import 'package:flutter/material.dart';

import 'config/route_strings.dart';
import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouteStrings.base,
    );
  }
}


 
