import 'package:flutter/material.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:help_med/themes/app_theme.dart';

class CustomCard2 extends StatelessWidget {
  final Medication medicamento;
  final String profileID;

  const CustomCard2(
      {Key? key, required this.medicamento, required this.profileID})
      : super(key: key);

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
                Navigator.pushNamed(context, 'edit_med', arguments: {
                  'medication': medicamento,
                  'profileid': profileID
                });
              },
              icon: const Icon(
                Icons.edit_attributes_outlined,
                size: 50,
                color: AppTheme.primary,
              )),
          IconButton(
              onPressed: () {
                //todo erase medicament and reload page
              },
              icon: const Icon(
                Icons.remove_circle,
                size: 50,
                color: AppTheme.primary,
              )),
        ],
      ),
    ));
  }
}
