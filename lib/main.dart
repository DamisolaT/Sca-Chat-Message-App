import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/services/firebase_services.dart';
import 'package:sca_chat_message_app/features/auth/view_models/authentication_provider.dart';
import 'package:sca_chat_message_app/features/home/view_models/chat_provider.dart';
import 'package:sca_chat_message_app/firebase_options.dart';
import 'config/route_strings.dart';
import 'config/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_)=>AuthenticationProvider(firebaseService: FirebaseService())
          ),
          ChangeNotifierProvider<ChatProvider>(
          create: (_)=>ChatProvider(firebaseService: FirebaseService())
          ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouteStrings.base,
      ),
    );
  }
}


 
