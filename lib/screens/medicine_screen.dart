import 'package:flutter/material.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:help_med/themes/app_theme.dart';
import 'package:help_med/widgets/widgets.dart';
import 'package:help_med/db.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  late List<Medication> drugs;

  cargarLista() async {
    List<Medication> medicamentos = await DB.getallDrugs();
    setState(() {
      drugs = medicamentos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: const [
            CustomCard2(medName: 'ibuprofreno'),
            CustomCard2(medName: 'aspirina'),
            CustomCard2(medName: 'lsd'),
            CustomCard2(medName: 'consilbina'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'edit_med');
        },
        //todo Icon border like a button
        child: const Icon(Icons.add),
        tooltip: 'Añade un nuevo medicamento',
        backgroundColor: AppTheme.primary,
      ),
    );
  }
}
