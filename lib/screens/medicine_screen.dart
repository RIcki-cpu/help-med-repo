import 'package:flutter/material.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:help_med/themes/app_theme.dart';
import 'package:help_med/widgets/widgets.dart';

class MedicationScreen extends StatelessWidget {
  List<Medication> medicamentos = [];
  List<CustomCard2> drugs = [];

  // MedicationScreen({Key? key, required this.medicamentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    medicamentos = arguments['medicamentos'];

    for (Medication item in medicamentos) {
      CustomCard2 medicamento = CustomCard2(medicamento: item);
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
          Navigator.pushNamed(context, 'edit_med',
              arguments: {'medication': null});
        },
        //todo Icon border like a button
        child: const Icon(Icons.add),
        tooltip: 'Añade un nuevo medicamento',
        backgroundColor: AppTheme.secondary,
      ),
    );
  }
}
