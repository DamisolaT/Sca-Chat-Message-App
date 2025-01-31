

import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/services/firebase_services.dart';

class ChatProvider extends ChangeNotifier {
  final FirebaseService firebaseService;
  ChatProvider({required this.firebaseService});
}