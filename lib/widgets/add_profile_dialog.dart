import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

import '../db.dart';
import '../model/models.dart';

class AddProfileDialog extends StatefulWidget {
  const AddProfileDialog({
    Key? key,
  }) : super(key: key);

  @override
  _AddProfileDialogState createState() => _AddProfileDialogState();
}

class _AddProfileDialogState extends State<AddProfileDialog> {
  String? profileName;
  String? profileid;
  int age = 25;

  User? user = FirebaseAuth.instance.currentUser;

  // String character = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Añadir Miembro'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              //NAME INPUT
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Introducir el nombre'),
                onChanged: (text) => profileName = text,
              ),
              //AGE INPUT
              SizedBox(
                  width: 150.0,
                  child: ElevatedButton(
                    child: const Text('Selecciona tu edad'),
                    onPressed: () => showMaterialNumberPicker(
                      context: context,
                      //title: '',
                      maxNumber: 100,
                      minNumber: 1,
                      step: 1,
                      confirmText: 'Confirmar',
                      cancelText: 'Cancelar',
                      selectedNumber: age,
                      onChanged: (value) => setState(() => age = value),
                    ),
                  )),
              //Id input
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Introducir la identificación'),
                onChanged: (text) => profileid = text,
              ),

              // RadioListTile(
              //   title: const Text('Cat'),
              //   value: 'cat',
              //   groupValue: character,
              //   onChanged: (value) {
              //     setState(() {
              //       character = (value ?? '') as String;
              //     });
              //   },
              // ),
              // RadioListTile(
              //   title: const Text('Dog'),
              //   value: 'dog',
              //   groupValue: character,
              //   onChanged: (value) {
              //     setState(() {
              //       character = (value ?? '') as String;
              //     });
              //   },
              // ),
              // RadioListTile(
              //   title: const Text('Other'),
              //   value: 'other',
              //   groupValue: character,
              //   onChanged: (value) {
              //     setState(() {
              //       character = (value ?? '') as String;
              //     });
              //   },
              // )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                final DataRepository repository =
                    DataRepository(userid: user!.uid);

                if (profileName != null && profileName != null) {
                  final newProfile =
                      Profile(name: profileName!, age: age, id: profileid!);
                  repository.addProfileID(newProfile);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Añadir')),
        ]);
  }
}
