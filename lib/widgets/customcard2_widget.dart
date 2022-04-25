import 'package:flutter/material.dart';
import 'package:help_med/themes/app_theme.dart';

class CustomCard2 extends StatelessWidget {
  final String medName;

  const CustomCard2({Key? key, required this.medName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            medName,
            style: const TextStyle(fontSize: 24, color: AppTheme.primary),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'edit_med');
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
