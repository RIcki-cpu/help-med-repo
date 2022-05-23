import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_med/model/models.dart';

import '../db.dart';

class Profile {
  String name;
  String? imageUrl;
  String id;
  int age;
  double? height;
  double? weight;
  String? bloodType;
  String? address;
  String? phoneNum;
  List<Map<String, dynamic>>? medicationList;
  // List<Vaccine>? vaccine;
  // List<>? vaccine;

  Profile(
      {required this.name,
      required this.id,
      required this.age,
      this.imageUrl,
      this.bloodType,
      this.height,
      this.weight,
      this.address,
      this.phoneNum,
      this.medicationList});

  //Parse the List<Map> to List<Medic>
  List<Medication> toListMedication() {
    List<Medication> drugs = [];

    //Convert each Map to Medication
    if (medicationList != null) {
      for (Map<String, dynamic> drug in medicationList!) {
        drugs.add(Medication.fromMap(drug));
      }
    }

    return drugs;
  }

  static Future<Profile> getUpToDateProfile(
      String userid, String profileid) async {
    final db = DataRepository(userid: userid);
    final docsnap = await db.getProfile(profileid);
    final profileMap = docsnap.data();

    return fromFiresore(profileMap as Map<String, dynamic>);
  }

  static Profile fromFiresore(Map<String, dynamic> profileMap) {
    List<Map<String, dynamic>> medication = [];

    if (profileMap['medicationList'] != null) {
      for (var item in profileMap['medicationList']) {
        medication.add({
          'name': item['name'],
          'dosage': item['dosage'],
          'quantity': item['quantity'],
          'startDate': item['startDate'],
          'endDate': item['endDate'],
          'notes': item['notes']
        });
      }
    }
    return Profile(
        name: profileMap['name'],
        id: profileMap['id'],
        age: profileMap['age'],
        imageUrl: profileMap['imageUrl'],
        bloodType: profileMap['bloodType'],
        height: profileMap['height'],
        weight: profileMap['weight'],
        address: profileMap['address'],
        phoneNum: profileMap['phoneNum'],
        medicationList: medication);
  }

  factory Profile.fromSnapshot(DocumentSnapshot snapshot) {
    final newProfile =
        Profile.fromFiresore(snapshot.data() as Map<String, dynamic>);
    newProfile.id = snapshot.reference.id;
    return newProfile;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'id': id,
      'age': age,
      'height': height,
      'weight': weight,
      'bloodType': bloodType,
      'address': address,
      'phoneNum': phoneNum,
      'medicationList': medicationList,
    };
  }

  //ERROR REPORTE if the list field retrieved is null then it can't be parsed

  //   Profile.fromFiresore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // )   : name = snapshot.data()?["name"],
  //       id = snapshot.data()?["id"],
  //       age = snapshot.data()?["age"],
  //       imageUrl = snapshot.data()?["imageUrl"],
  //       bloodType = snapshot.data()?["bloodType"],
  //       height = snapshot.data()?["height"],
  //       weight = snapshot.data()?["weight"],
  //       address = snapshot.data()?["address"],
  //       phoneNum = snapshot.data()?["phoneNum"],
  //       medicationList =
  //           snapshot.data()?["medicationList"] as List<Map<String, dynamic>>;
}
