import 'package:flutter/material.dart';
import 'package:help_med/themes/app_theme.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'medicamentos');
            },
            icon: const Icon(Icons.medication, color: AppTheme.primary),
          ),
          const Text('MEDICINA WHEON'),
        ],
      ),
    ));
  }
}
