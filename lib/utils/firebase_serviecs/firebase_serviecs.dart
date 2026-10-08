
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseServiecs {
  static Future <UserCredential> createAccount(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static void Tosta({required String msg, Color bgColor = Colors.black}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: AppColors.white,
        backgroundColor: bgColor

    );
  }

  static Future<void> addUserToFireStore(UserModel user) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>>userCollection = db.collection(
        "Users");
    DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(
        user.id);
    return userDoc.set({
      "id": user.id,
      "name": user.name,
      "email": user.email
    });
  }

  static Future<UserModel> getUserFromFireStore(String userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>>userCollection = db.collection(
        "Users");
    DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(
        userId);
    DocumentSnapshot<Map<String, dynamic>> documentSnapShot = await userDoc
        .get();
    Map<String, dynamic> json = documentSnapShot.data()!;
    UserModel user = UserModel(id: json["id"], name:
    json["name"], email: json["email"]);
    return user;
  }

  static Future<void> addEventToFireStore(EventModel event) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>>eventCollection = db.collection(
        "Events");
    DocumentReference<Map<String, dynamic>> eventDoc = eventCollection.doc();
    event.id = eventDoc.id;
    return eventDoc.set({
      "id": event.id,
      "title": event.title,
      "description": event.description,
      "date": event.date,
      "time": "${event.time.hour.toString().padLeft(2, '0')}:${event.time.minute
          .toString().padLeft(2, '0')}",
      "categoryID": event.category.id,
      "ownerID": event.ownerid
    });
  }


  static Stream<List<EventModel>> getEventFromFireStoreRealUpdate(CategoryModel category)async*{
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> eventCollection = db.collection("Events");
    Stream<QuerySnapshot<Map<String, dynamic>>> collectionSnapShots=eventCollection.where("categoryID",isEqualTo:category.id=="0"?null: category.id).orderBy("date").snapshots();

    Stream<List<EventModel>> events=collectionSnapShots.map((querySnapShot)=>querySnapShot.docs.map((docSnapShot){
      Map<String,dynamic>json=docSnapShot.data();

      final category = CategoryModel.categories.firstWhere(
            (category) => category.id == json["categoryID"],
        orElse: () => CategoryModel.categories[0],
      );

      final DateTime date = (json["date"] as Timestamp).toDate();

      final timeParts = (json["time"] as String).split(":");
      final TimeOfDay time = TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      );

      return EventModel(
        id: json["id"],
        category: category,
        title: json["title"],
        description: json["description"],
        date: date,
        time: time,
        ownerid: json["ownerID"],
      );


    }).toList());
yield* events;

  }















}