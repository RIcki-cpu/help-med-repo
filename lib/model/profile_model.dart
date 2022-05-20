import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_med/model/models.dart';

class Profile {
  String name;
  String? imageUrl;
  String id;
  int age;
  double? height;
  double? weight;
  String? bloodType;
  String address;
  String phoneNum;
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
      required this.address,
      required this.phoneNum,
      this.medicationList});

  //Parse the List<Map> to List<Medic>
  List<Medication> toListMedication() {
    List<Medication> drugs = [];

    //Convert each Map to Medication
    for (Map<String, dynamic> drug in medicationList!) {
      drugs.add(Medication.fromMap(drug));
    }
    return drugs;
  }

  static Profile fromFiresore(Map<String, dynamic> profileMap) {
    List<Map<String, dynamic>> medication = [];

    for (var item in profileMap['MedicationList']) {
      medication.add({
        'name': item['name'],
        'dosage': item['dosage'],
        'quantity': item['quantity'],
        'startDate': item['startDate'],
        'endDate': item['endDate'],
        'notes': item['notes']
      });
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
