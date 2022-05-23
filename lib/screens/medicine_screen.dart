import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_med/model/models.dart';
import 'package:help_med/themes/app_theme.dart';
import 'package:help_med/widgets/widgets.dart';

class MedicationScreen extends StatelessWidget {
  final String userid = FirebaseAuth.instance.currentUser!.uid;
  List<Medication> medicamentos = [];
  List<MedicineCard> drugs = [];

  // MedicationScreen({Key? key, required this.medicamentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    // Parsing Data
    Profile p1 = arguments['profile'];
    medicamentos = p1.toListMedication();

    for (Medication item in medicamentos) {
      MedicineCard medicamento =
          MedicineCard(medicamento: item, profile: p1, userid: userid);
      drugs.add(medicamento);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: drugs,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'edit_med', arguments: {'profile': p1});
        },
        //todo Icon border like a button
        child: const Icon(Icons.add),
        tooltip: 'Añade un nuevo medicamento',
        backgroundColor: AppTheme.secondary,
      ),
    );
  }

  // List<Medication> retrieveMedicineCollection({required Profile profile}) {
  //   return profile.toListMedication();
  // }
}
