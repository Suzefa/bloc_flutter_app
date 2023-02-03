import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserService {

  UserService._internalConstructor();

  static final UserService _instance = UserService._internalConstructor();

  factory UserService(){
    return _instance;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String _kUserCollectionKey = "Users";

  Future<dynamic> signUpNewUser(UserModel userModel) async {
    try {
      UserCredential createNewUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      if(createNewUser.user == null){
        return "user not created";
      }
      UserModel userWithUserId = userModel.updateCurrentUserModel(userId: createNewUser.user!.uid);
      await _firebaseFirestore.collection(_kUserCollectionKey).doc(createNewUser.user!.uid).set(userWithUserId.toJson(),);
      return userModel;
    } on FirebaseException catch(firebaseException){
      log(firebaseException.message.toString());
      return firebaseException.message;
    } catch (dartException) {
      log(dartException.toString());
      return dartException.toString();
    }
  }

  Future<dynamic> loginUser({required String email,required String password,}) async {
    try{
      UserCredential loginUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(loginUser.user == null){
        return "Email or password incorrect";
      }
      DocumentSnapshot<Map<String, dynamic>> searchUser =
          await _firebaseFirestore
              .collection(_kUserCollectionKey)
              .doc(loginUser.user!.uid)
              .get();
      if(!searchUser.exists){
        return "User not found";
      }
      return const UserModel().fromJson(searchUser.data()!);
    } on FirebaseException catch(firebaseException){
      log(firebaseException.message.toString());
      return firebaseException.message;
    } catch (dartException) {
      log(dartException.toString());
      return dartException.toString();
    }
  }

}