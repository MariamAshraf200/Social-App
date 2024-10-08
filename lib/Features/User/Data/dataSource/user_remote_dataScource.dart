import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire/global/Errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class UserRemoteDatascource {
  Future<UserModel> LoginIn(String email, String password);
  Future<UserModel> SignUp(
      String name, String email, String phone, String password);
  Future<List<UserModel>> GetAllUsers();
  Future<void> ResetPassword(String email);
  Future<void> LogOut();
}

class UserRemoteDataScource implements UserRemoteDatascource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  UserRemoteDataScource({required this.firestore, required this.firebaseAuth});

  @override
  Future<List <UserModel>> GetAllUsers() async {
    try{
      final snapshot = await FirebaseFirestore.instance.collection('users').get();
      return snapshot.docs.map((doc)=>UserModel.fromJson(doc.data())).toList();
    }catch(e){
      throw serverExceptions();
    }
  }

  @override
  Future<void> LogOut() async {
 await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> LoginIn(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;

      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return UserModel.fromJson(userDoc.data()!);
      } else {
        throw wrongDataExceptions();
      }
    } catch (e) {
      throw serverExceptions();
    }
  }

  @override
  Future<void> ResetPassword(String email) async {
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
    }catch (e){
      throw serverExceptions();
    }
  }

  @override
  Future<UserModel> SignUp(
      String name, String email, String phone, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        final usermodel =
            UserModel(name: name, id: user.uid, phone: phone, email: email);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(usermodel.toJson());
        return usermodel;
      } else {
        throw wrongDataExceptions();
      }
    } catch (e) {
      throw serverExceptions();
    }
  }
}
