import 'package:flutter/material.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:help_med/themes/app_theme.dart';

class CustomCard2 extends StatelessWidget {
  final Medication medicamento;

  const CustomCard2({Key? key, required this.medicamento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            medicamento.name,
            style: const TextStyle(fontSize: 24, color: AppTheme.primary),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'edit_med',
                    arguments: {'medication': medicamento});
              },
              icon: const Icon(
                Icons.edit_attributes_outlined,
                size: 50,
                color: AppTheme.primary,
              ))
        ],
      ),
    ));
  }
}
