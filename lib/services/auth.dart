import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_vsapp/screens/models/user.dart';
import 'package:first_vsapp/services/database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
       // .map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }


  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmail(String email,String pass) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('0', 'new', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

    Future registerWithEmail(String email,String pass) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
    }


  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}