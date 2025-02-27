import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/services/firebase_services.dart';
import 'package:sca_chat_message_app/core/shared/constants.dart';

class AuthenticationProvider extends ChangeNotifier{
  final FirebaseService firebaseService;
  AuthenticationProvider({required this.firebaseService});

  bool loading = false;
  File? profileImage;

  void setImage(File img){
    profileImage = img;
    notifyListeners();
  }

  Future<({bool? loggedIn, String? error})> login ({required String email, required String password}) async {
    loading = true;
    notifyListeners();
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


  
  Future<({bool? signedup, String? error})> signup ({
    required String email, 
    required String password, 
    required String firstName,
    required String lastName}) async {
    loading = true;
    notifyListeners();
    final login = await firebaseService.signup(
      email: email, 
      password: password,
      firstName: firstName ,
      lastName: lastName,
      );
    if(login.signedup??false){
      loading = false;
      notifyListeners();
      return (signedup: true, error: null);
    }else{
       loading = false;
      notifyListeners();
      return (signedup: null, error: login.error);
    }

  }
}