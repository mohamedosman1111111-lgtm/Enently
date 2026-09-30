
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseServiecs {
   static Future <UserCredential> createAccount({required String email,required String password})async{
    UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
    return userCredential;
  }
  static void Tosta({required String msg,Color bgColor=Colors.black}){
     Fluttertoast.showToast(
         msg: msg,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       textColor: AppColors.white,
       backgroundColor: bgColor

     );
  }
  static Future<void> addUserToFireStore(UserModel user){
     FirebaseFirestore db=FirebaseFirestore.instance;
     CollectionReference<Map<String, dynamic>>userCollection =db.collection("Users");
     DocumentReference<Map<String,dynamic>> userDoc=userCollection.doc(user.id);
     return userDoc.set({
       "id":user.id,
       "name":user.name,
       "email":user.email
     });
  }
   static Future<UserModel> getUserFromFireStore(String userId) async {
     FirebaseFirestore db=FirebaseFirestore.instance;
     CollectionReference<Map<String, dynamic>>userCollection =db.collection("Users");
     DocumentReference<Map<String,dynamic>> userDoc=userCollection.doc(userId);
     DocumentSnapshot<Map<String,dynamic>> documentSnapShot=  await userDoc.get();
     Map<String,dynamic> json=documentSnapShot.data()!;
     UserModel user=UserModel(id: json["id"], name:
         json["name"], email: json["email"]);
     return user;

   }
   static Future<void> addEventToFireStore(EventModel event){
     FirebaseFirestore db=FirebaseFirestore.instance;
     CollectionReference<Map<String, dynamic>>eventCollection =db.collection("Events");
     DocumentReference<Map<String,dynamic>> eventDoc=eventCollection.doc();
     event.id=eventDoc.id;
     return eventDoc.set({
       "id":event.id,
       "title":event.title,
       "description":event.description,
       "date":event.date,
       "categoryID":event.category.id,
       "ownerID":event.ownerid
     });
   }
}