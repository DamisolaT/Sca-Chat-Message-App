import 'package:firebase_auth/firebase_auth.dart';
class FirebaseService {
  final auth = FirebaseAuth.instance;
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


  Future<({bool? signedup, String? error})> signup({required String email, required String password})async{
    try{
   await auth.createUserWithEmailAndPassword(email: email, password: password);
    return (signedup:true, error: null);
    } on FirebaseAuthException catch(e){
    return (signedup:null, error:e.message);
    } catch(e){
      return (signedup:null, error:e.toString());
    }
  }
}