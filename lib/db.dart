// import 'package:firebase_database/firebase_database.dart';

// class DB {
//   final databaseReference = FirebaseDatabase.instance.ref();

//   void createRecord() {
//     try {
//       databaseReference.child("1").set({
//         'name': 'paracetamol 2.0',
//         'dosage': 'ml',
//         'quantity': 23,
//         'startDate': '01/06/2022',
//         'endDate': '02/07/2023',
//         'note': null
//       });
//       databaseReference.child("2").set({
//         'name': 'ibuprofeno',
//         'dosage': 'ml',
//         'quantity': 50,
//         'startDate': '01/04/2022',
//         'endDate': '02/09/2023',
//         'note': 'jodase xdddd'
//       });
//     } catch (e, stackTrace) {
//       print(e.toString());
//     }
//   }
// }
import 'package:sqflite/sqflite.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'helpMed.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE drugs (name TEXT PRIMARY KEY, dosage TEXT, quantity INTEGER, startDate TEXT, endDate TEXT, notes TEXT)');
    }, version: 1);
  }

  static Future<void> insert(Medication medication) async {
    Database database = await _openDB();

    database.insert('drugs', medication.toMap());
  }

  static Future<void> updatetable() async {
    Database database = await _openDB();

    database.execute('DROP TABLE drugs');
  }

  static Future<void> createtable() async {
    Database database = await _openDB();

    database.execute(
        'CREATE TABLE drugs (name TEXT PRIMARY KEY, dosage TEXT, quantity INTEGER, startDate TEXT, endDate TEXT, notes TEXT)');
  }

  static Future<void> delete(Medication medication) async {
    Database database = await _openDB();

    database.delete('drugs', where: 'name = ?', whereArgs: [medication.name]);
  }

  static Future<void> update(Medication medication) async {
    Database database = _openDB() as Database;

    database.update('drugs', medication.toMap(),
        where: 'name = ?', whereArgs: [medication.name]);
  }

  static Future<List<Medication>> getallDrugs() async {
    Database database = _openDB() as Database;

    final List<Map<String, dynamic>> drugsMap = await database.query('drugs');
    return List.generate(
        drugsMap.length,
        (i) => Medication(
              name: drugsMap[i]['name'],
              dosage: drugsMap[i]['dosage'],
              quantity: drugsMap[i]['quantity'],
              startDate: drugsMap[i]['startDate'],
              endDate: drugsMap[i]['endDate'],
              notes: drugsMap[i]['notes'],
            ));
  }
}
