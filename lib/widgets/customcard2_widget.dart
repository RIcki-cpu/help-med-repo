import 'package:flutter/material.dart';
import 'package:help_med/themes/app_theme.dart';

class CustomCard2 extends StatelessWidget {
  final String medName;

  const CustomCard2({Key? key, required this.medName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            medName,
            style: const TextStyle(fontSize: 20, color: AppTheme.primary),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppTheme.primary,
              ))
        ],
      ),
    ));
  }
}