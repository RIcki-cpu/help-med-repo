import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:help_med/db.dart';
import 'package:help_med/model/medication_model.dart';
import 'package:intl/intl.dart' show DateFormat;

class EditMedicineScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Medication medication = Medication(
      name: 'name',
      dosage: 'dosage',
      quantity: 0,
      startDate: 'startDate',
      endDate: 'endDate',
      notes: '');

  List<Medication> drugs = [];

  void displayDialog(BuildContext context, String error) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              title: const Text('ERROR'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error),
                  const SizedBox(height: 10),
                  const Icon(Icons.error)
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)));
        });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Medication? md1 = arguments['medication'];

    DateTime datex;
    DateTime datey;
    Map<String, dynamic> initValues;

    if (md1 == null) {
      datex = DateTime.now();
      datey = DateTime.now();
      initValues = {
        'medic_name': 'nombre medicamento',
        'dosage': 'dosificación_tipo',
        'quantity': 3.3,
        'start_date': datex,
        'end_date': datey,
        'notes': 'información adicional'
      };
    } else {
      datex = dateFormat.parse(md1.startDate);
      datey = dateFormat.parse(md1.endDate);
      initValues = {
        'medic_name': md1.name,
        'dosage': md1.dosage,
        'quantity': md1.quantity.toDouble(),
        'start_date': datex,
        'end_date': datey,
        'notes': md1.notes
      };
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Medicamento',
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'medic_name',
                initialValue: initValues['medic_name'],
                decoration: const InputDecoration(
                  labelText: 'Nombre del medicamento',
                ),
                //enabled: true,
                validator: FormBuilderValidators.required(
                    errorText: 'el campo no puede estar vacio'),
              ),
              FormBuilderChoiceChip(
                  name: 'dosage',
                  decoration: const InputDecoration(
                    labelText: 'Selecciona la Dosificación',
                  ),
                  initialValue: initValues['dosage'],
                  options: const [
                    FormBuilderFieldOption(
                      value: 'pills',
                      child: Text('Pildoras'),
                    ),
                    FormBuilderFieldOption(
                      value: 'ml',
                      child: Text('Miligramos'),
                    ),
                    FormBuilderFieldOption(
                      value: 'pills',
                      child: Text('Mililitros'),
                    ),
                    FormBuilderFieldOption(
                      value: 'pills',
                      child: Text('Gotas'),
                    ),
                    FormBuilderFieldOption(
                      value: 'pills',
                      child: Text('Cucharadas'),
                    ),
                  ]),
              FormBuilderSlider(
                  name: 'quantity',
                  initialValue: initValues['quantity'],
                  min: 1,
                  max: 100),
              FormBuilderDateTimePicker(
                name: 'start_date',
                // onChanged: _onChanged,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  labelText: 'Fecha de inicio',
                ),
                initialValue: initValues['start_date'],
                // enabled: true,
              ),
              FormBuilderDateTimePicker(
                name: 'end_date',
                // onChanged: _onChanged,
                initialValue: initValues['end_date'],
                inputType: InputType.date,
                decoration: const InputDecoration(
                  labelText: 'Fecha de fin de consumo',
                ),
                //initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderTextField(
                name: 'notes',
                initialValue: initValues['notes'],
                decoration: const InputDecoration(
                    labelText: 'indicaciones adicionales'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Reset Form
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF00DCA8)),
                      child: Text('LIMPIAR')),
                  // SAVE INFORMATION
                  ElevatedButton(
                      onPressed: () async {
                        //VALIDATION Of data
                        _formKey.currentState?.save();
                        final rawname =
                            _formKey.currentState?.fields['medic_name']?.value;
                        final rawndosage =
                            _formKey.currentState?.fields['dosage']?.value;
                        final rawquantity =
                            _formKey.currentState?.fields['quantity']?.value;
                        final rawstartdate =
                            _formKey.currentState?.fields['start_date']?.value;
                        final rawendate =
                            _formKey.currentState?.fields['end_date']?.value;
                        final rawnotes =
                            _formKey.currentState?.fields['notes']?.value;

                        if (rawname == null ||
                            rawndosage == null ||
                            rawquantity == null ||
                            rawstartdate == null ||
                            rawendate == null) {
                          displayDialog(context, 'META BIEN LOS DATOS');
                        } else {
                          //ALMACENMAIENTO DE CAMPOS EN EL OBJETO  MEDICATION
                          medication.name = rawname;
                          medication.dosage = rawndosage;
                          medication.quantity = rawquantity.round();
                          medication.startDate =
                              dateFormat.format(rawstartdate);
                          //.toString().substring(0, 7);
                          medication.endDate = dateFormat.format(rawendate);
                          //rawendate.toString().substring(0, 7);
                          medication.notes = rawnotes;
                          //todo update and show full list

                          //--------------------------------------------------------

                          try {
                            //if md1 is empty it means is a new drug. Therefore is an INSERT
                            if (md1 == null) {
                              DB.insert(medication);
                            } else {
                              //otherwise it means its an UPDATE
                              DB.update(medication);
                            }
                          } catch (e) {
                            displayDialog(context, e.toString());
                          }

                          //at the end all drugs must be retrieved once again
                          List<Medication> medicamentos =
                              await DB.getallDrugs();
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'medicamentos', (route) => route.isFirst,
                              arguments: {'medicamentos': medicamentos});
                        }
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF00DCA8)),
                      child: Text('GUARDAR')),
                ],
              ),
            ],
          ),
        ),
        onChanged: () => print('esto ha cambiado tio'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: const {
          'textfield': 'yes',
        },
        //skipDisabled: true,
      ),
    );
  }
}
