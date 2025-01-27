import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/services/firebase_services.dart';

class AuthenticationProvider extends ChangeNotifier{
  final FirebaseService firebaseService;
  AuthenticationProvider({required this.firebaseService});

  bool loading = false;

  Future<({bool? loggedIn, String? error})> login ({required String email, required String password}) async {
    loading = true;
    final login = await firebaseService.login(email: email, password: password);
    if(login.loggedIn??false){
      loading = false;
      notifyListeners();
      return (loggedIn: true, error: null);
    }else{
       loading = false;
      notifyListeners();
      return (loggedIn: null, error: login.error);
    }

  }
}