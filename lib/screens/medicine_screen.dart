import 'package:flutter/material.dart';
import 'package:help_med/themes/app_theme.dart';
import 'package:help_med/widgets/widgets.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CustomCard2(medName: 'ibuprofreno'),
          CustomCard2(medName: 'aspirina'),
          CustomCard2(medName: 'lsd'),
          CustomCard2(medName: 'consilbina'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'Añade un nuevo medicamento',
        backgroundColor: AppTheme.secondary,
      ),
    );
  }
}
