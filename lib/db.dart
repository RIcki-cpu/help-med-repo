import 'package:path/path.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'helpMed.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE drugs (name TEXT PRIMARY KEY, dosage TEXT, quantity INTEGER, initDate TEXT, endDate TEXT, notes TEXT)');
    }, version: 1);
  }

  static Future<void> insert(Medication medication) async {
    Database database = _openDB() as Database;

    database.insert('drugs', medication.toMap());
  }

  static Future<void> delete(Medication medication) async {
    Database database = _openDB() as Database;

    database.delete('drugs', where: 'name = ?', whereArgs: [medication.name]);
  }

  static Future<void> update(Medication medication) async {
    Database database = _openDB() as Database;

    database.update('drugs', medication.toMap(),
        where: 'name = ?', whereArgs: [medication.name]);
  }

//   static Future<List<Medication>> getallDrugs() async {
//     Database database = _openDB() as Database;

//     final List<Map<String, dynamic>> drugsMap = await database.query('drugs');
//     return List.generate(
//         drugsMap.length,
//         (i) => Medication(
//               name: drugsMap[i]['name'],
//               dosage: drugsMap[i]['dosage'],
//               quantity: drugsMap[i]['quantity'],
//               initDate: drugsMap[i]['name'],
//               endDate: drugsMap[i]['name'],
//             ));
//   }
// }
}
