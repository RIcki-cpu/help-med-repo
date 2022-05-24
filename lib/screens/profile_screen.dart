import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:help_med/themes/app_theme.dart';
import '../db.dart';
import '../model/models.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the arguments from Switch Account push
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    Profile currentProfile = arguments['profile'];
    String userid = arguments['userid'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edita información Personal'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ProfileDetail(profile: currentProfile, userid: userid),
      ),
    );
  }

  void saveProfile() {}
}

class ProfileDetail extends StatefulWidget {
  final Profile profile;
  final String userid;

  const ProfileDetail({Key? key, required this.profile, required this.userid})
      : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  late DataRepository repository;
  final _formKey = GlobalKey<FormState>();
  //final dateFormat = DateFormat('yyyy-MM-dd');

  late List<CategoryOption> bloodTypes;
  // late String type;

  late Profile currentProfile;
  bool removebuttonState = true;

  final heightEditingController = TextEditingController();
  final weightEditingController = TextEditingController();

  @override
  void initState() {
    repository = DataRepository(userid: widget.userid);
    currentProfile = widget.profile;
    // type = currentProfile.bloodType!;

    //bloodTypes = ['O-', 'O+', 'B-', 'A-', 'A+', 'AB-', 'AB+'];
    bloodTypes = [
      CategoryOption(
          type: 'O+', name: 'O+', isSelected: currentProfile.bloodType == 'O+'),
      CategoryOption(
          type: 'O-', name: 'O-', isSelected: currentProfile.bloodType == 'O-'),
      CategoryOption(
          type: 'B+', name: 'B+', isSelected: currentProfile.bloodType == 'B+'),
      CategoryOption(
          type: 'B-', name: 'B-', isSelected: currentProfile.bloodType == 'B-'),
      CategoryOption(
          type: 'A+', name: 'A+', isSelected: currentProfile.bloodType == 'A+'),
      CategoryOption(
          type: 'A-', name: 'A-', isSelected: currentProfile.bloodType == 'A-'),
      CategoryOption(
          type: 'AB+',
          name: 'AB+',
          isSelected: currentProfile.bloodType == 'AB+'),
      CategoryOption(
          type: 'AB-',
          name: 'AB-',
          isSelected: currentProfile.bloodType == 'AB-'),
    ];

    // id is the current id it cant be removed
    if (widget.userid == currentProfile.id) {
      removebuttonState = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      height: double.infinity,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              //Name
              UserTextField(
                name: 'Nombre del Miembro:',
                initialValue: currentProfile.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escribe tu nombre nombre';
                  }
                },
                inputType: TextInputType.name,
                onChanged: (value) =>
                    currentProfile.name = value ?? currentProfile.name,
              ),
              const SizedBox(height: 20.0),
              //ID
              UserTextField(
                name: 'Identificación:',
                initialValue: currentProfile.id,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escribe tu identificación';
                  }
                },
                inputType: TextInputType.number,
                onChanged: (value) =>
                    currentProfile.id = value ?? currentProfile.id,
              ),

              //Estatura
              const SizedBox(height: 20.0),
              TextFormField(
                  autofocus: false,
                  controller: heightEditingController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    RegExp regex = RegExp('^[0-9]');

                    if (!regex.hasMatch(value!)) {
                      return ("Favor solo ingresar numeros");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    heightEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: CustomDecoration(
                      'Ingrese estatura en cm', 'Estatura en cm:')),
              //peso
              TextFormField(
                  autofocus: false,
                  controller: weightEditingController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    RegExp regex = RegExp('^[0-9]');

                    if (!regex.hasMatch(value!)) {
                      return ("Favor solo ingresar numeros");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weightEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: CustomDecoration(
                      'Ingrese estatura en libras', 'Peso en lb:')),
              const SizedBox(height: 20.0),
              //Age selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('Selecciona edad'),
                    onPressed: () => showMaterialNumberPicker(
                      context: context,
                      title: 'Selecciona tu edad',
                      maxNumber: 100,
                      minNumber: 1,
                      step: 1,
                      confirmText: 'Confirmar',
                      cancelText: 'Cancelar',
                      selectedNumber: currentProfile.age,
                      onChanged: (value) =>
                          setState(() => currentProfile.age = value),
                    ),
                    // style: const ButtonStyle(
                    //   backgroundColor: AppTheme.secondary,
                    // ),
                  ),
                  //SizedBox(width: 40),
                  Text("${currentProfile.age}")
                ],
              ),

              //Blood TyPE
              ChooseType(
                title: 'Tipo de sangre',
                options: bloodTypes,
                onOptionTap: (value) {
                  setState(() {
                    bloodTypes.forEach((element) {
                      currentProfile.bloodType = value.type;
                      element.isSelected = element.type == value.type;
                    });
                  });
                },
              ),

              //Dirección
              const SizedBox(height: 20.0),
              UserTextField(
                name: 'Direccion Completa:',
                initialValue: currentProfile.address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escribe tu dirección completa';
                  }
                },
                inputType: TextInputType.streetAddress,
                onChanged: (value) =>
                    currentProfile.address = value ?? currentProfile.address,
              ),

              //Numero de Telefono

              const SizedBox(height: 20.0),
              UserTextField(
                name: 'Numero de contacto',
                initialValue: currentProfile.phoneNum,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escribe tu numero de contacto';
                  }
                },
                inputType: TextInputType.phone,
                onChanged: (value) =>
                    currentProfile.phoneNum = value ?? currentProfile.phoneNum,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //REMOVE PROFILE
                  MaterialButton(
                      color: AppTheme.secondary,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (route) => route.isFirst);
                        repository.deleteProfile(currentProfile);
                      },
                      child: const Text(
                        'Eliminar Miembro',
                        style:
                            TextStyle(color: AppTheme.primary, fontSize: 12.0),
                      )),
                  //UPDATE PROFILE
                  MaterialButton(
                    color: AppTheme.secondary,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        currentProfile.height =
                            int.parse(heightEditingController.text) + .0;

                        currentProfile.weight =
                            int.parse(weightEditingController.text) + .0;
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (route) => route.isFirst,
                            arguments: {'profile': currentProfile});
                        //currentProfile.bloodType = type;
                        repository.updateProfile(currentProfile);
                      }
                    },
                    child: const Text(
                      'Guardar Cambios',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration CustomDecoration(String hintext, String lab) {
    return InputDecoration(
      label: Text(lab),
      hintText: hintext,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.0,
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.0,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  // Widget buildRow(Vaccination vaccination) {
  //   return Row(
  //     children: <Widget>[
  //       Expanded(
  //         flex: 1,
  //         child: Text(vaccination.vaccination),
  //       ),
  //       Text(dateFormat.format(vaccination.date)),
  //       Checkbox(
  //         value: vaccination.done ?? false,
  //         onChanged: (newValue) {
  //           setState(() {
  //             vaccination.done = newValue;
  //           });
  //         },
  //       )
  //     ],
  //   );
  //}

  // void _addVaccination(Pet pet, Function callback) {
  //   showDialog<Widget>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AddVaccination(pet: pet, callback: callback);
  //       });
  // }
}

// if (arguments['profile'] != null) {
//       currentProfile = arguments['profile'];
//     } else {
//       //the initial data from the DefaultProfile

