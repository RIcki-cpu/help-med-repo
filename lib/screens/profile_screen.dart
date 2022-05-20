import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/models.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance; // Init Firestore
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser;
  Profile? currentProfile;
  //const ProfileScreen({Key? key}) : super(key: key);
  // I need to recieve parameters

  @override
  Widget build(BuildContext context) {
    //Map Value and get the Currentuser
    db.collection("users").doc(user!.uid).get().then((value) {
      loggedInUser = UserModel.fromMap(
          value.data()); // Map authenticate user to our Model user
    });
    // get the arguments from Switch Account push
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    //the screen will edit the profile info retrieved from switch account screen
    //if the profile sent would been null then the aplication will set the  Defaultprofile and create the collection
    if (arguments['profile'] != null) {
      currentProfile = arguments['profile'];
    } else {
      //the initial data from the DefaultProfile

      // currentProfile = Profile(
      //     name: loggedInUser!.firstName + " " + loggedInUser!.secondName,
      //     id: loggedInUser!.profileID,
      //     age: age,
      //     address: address,
      //     phoneNum: phoneNum);
    }

    //Todo set init data  in the fields with currentProfile
    //THen  send to save the changes

    return Scaffold(
      appBar: AppBar(
        title: Text('Información Personal'),
      ),
      body: const Center(child: Text('Aqui editas información personal')),
    );
  }

  void setDefaultProfile(Profile p1) {
    //final db = DataRepository(userid: loggedInUser!.uid);
    db
        .collection('users')
        .doc(loggedInUser!.uid)
        .collection('profiles')
        .doc(loggedInUser!.profileID)
        .set(p1.toFirestore());
  }

  void saveProfile() {}
}


//Profile p1;

      // setDefaultProfile(
      //     p1); // or create collections and create the first profile
//1. 