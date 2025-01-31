import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sca_chat_message_app/features/home/models/user_model.dart';
import 'package:path/path.dart' as p;

import '../shared/constants.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;
  
  
  Future<({bool? loggedIn, String? error})>  login({required String email, required String password})async{
   try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    await auth.currentUser?.reload;
    return (loggedIn:true, error: null);
    }on FirebaseAuthException catch(e){
    return (loggedIn:null, error:e.message);
    }catch(e){
      return (loggedIn:null, error:e.toString());
    }
  }
  Future<void> logout() async{
    try{
      await auth.signOut();
    }catch(_){}
  }
   Future<String?> uploadImg(File img) async {
    try {
      final storageRef = storage.ref();

      final imgRef = storageRef.child(
          "${auth.currentUser?.uid}/${DateTime.now().millisecondsSinceEpoch}${p.extension(img.path)}");

      final upload = await imgRef.putFile(img);
      if (upload.state == TaskState.success) {
        return await imgRef.getDownloadURL();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<({bool? signedup, String? error})> signup({
    required String email, 
    required String password,
    required String firstName,
    required String lastName, 
    })async{
    try{
  
   await auth.createUserWithEmailAndPassword(email: email, password: password);
   await auth.currentUser?.reload();
   
   await fireStore.collection("users").doc(auth.currentUser?.uid).set(
    UserModel(uid: auth.currentUser?.uid,
    lastName: lastName,
    firstName: firstName,
    img: imgs[Random().nextInt(imgs.length)])
    .toJson(),
   );
    return (signedup:true, error: null);
    } on FirebaseAuthException catch(e){
    return (signedup:null, error:e.message);
    } catch(e){
      return (signedup:null, error:e.toString());
    }
  }
}