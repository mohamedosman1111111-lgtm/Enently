
import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// iOS-only configuration for google_sign_in 7.x.
/// Leave these null on Android/Web (the native flow reads them from
/// google-services.json / Firebase config). Fill them after adding a
/// "Google" OAuth client in the Firebase console for your iOS bundle id.
class GoogleAuth {
  static const String? iOsClientId = null; // e.g. "XXXX.apps.googleusercontent.com"
  static const String? restClientId = null; // OAuth REST client id (iOS)
  static const String? redirectUri = null; // e.g. "com.example.evently:/oauth2redirect"
}

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

  /// Signs in the user with their Google account and links/creates
  /// a Firebase Auth session using the resulting Google credentials.
  static Future<UserCredential> signInWithGoogle() async {
    // Web uses the built-in Firebase popup flow.
    if (kIsWeb) {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/userinfo.email');
      googleProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
      return FirebaseAuth.instance.signInWithPopup(googleProvider);
    }

    // Trigger the authentication flow (native platforms).
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId & serverClientId are required on iOS only;
      // on Android they are read from google-services.json.
      clientId: Platform.isIOS ? GoogleAuth.iOsClientId : null,
      serverClientId: Platform.isIOS ? GoogleAuth.restClientId : null,
    );
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'user-cancelled',
        message: 'Google sign-in was cancelled',
      );
    }

    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential for Firebase.
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Make sure the user has a document in the "Users" collection.
    final user = userCredential.user;
    if (user != null) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> userDoc =
          db.collection("Users").doc(user.uid);
      DocumentSnapshot<Map<String, dynamic>> snapshot = await userDoc.get();
      if (!snapshot.exists) {
        await addUserToFireStore(UserModel(
          id: user.uid,
          name: user.displayName ?? user.email ?? 'Unknown',
          email: user.email ?? '',
        ));
      }
      UserModel.loggedUser = await getUserFromFireStore(user.uid);
    }

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
      "email": user.email,
      "favoriteEventsId":user.favoriteEventsId
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
    UserModel user = UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      favoriteEventsId: (json["favoriteEventsId"] as List<dynamic>).cast<String>()
    );
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

static Future<void> addEventToFavorite(EventModel event){
UserModel currentUser=UserModel.loggedUser!;
currentUser.favoriteEventsId.add(event.id);
FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>>userCollection = db.collection("Users");
DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(currentUser.id);

return userDoc.update({

  "favoriteEventsId": FieldValue.arrayUnion([event.id]),
});
}
static Future<void> removeEventToFavorite(EventModel event){
UserModel currentUser=UserModel.loggedUser!;
currentUser.favoriteEventsId.remove(event.id);
FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>>userCollection = db.collection("Users");
DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(currentUser.id);

return userDoc.update({

  "favoriteEventsId": currentUser.favoriteEventsId,
});
}

  static Stream<List<EventModel>> getFavoriteEventFromFireStoreRealUpdate()async*{
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> eventCollection = db.collection("Events");
    Stream<QuerySnapshot<Map<String, dynamic>>> collectionSnapShots=eventCollection.snapshots();

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