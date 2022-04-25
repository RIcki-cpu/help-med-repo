import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:help_med/db.dart';
import 'package:help_med/model/medication_model.dart';

class EditMedicineScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  Medication medication = Medication(
      name: 'name',
      dosage: 'dosage',
      quantity: 0,
      startDate: 'startDate',
      endDate: 'endDate',
      notes: '');

  @override
  Widget build(BuildContext context) {
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
                initialValue: 'Paracetamol',
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
                  initialValue: 'pills',
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
                  name: 'quantity', initialValue: 1, min: 1, max: 100),
              FormBuilderDateTimePicker(
                name: 'init_date',
                // onChanged: _onChanged,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  labelText: 'Fecha de inicio',
                ),
                initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderDateTimePicker(
                name: 'end_date',
                // onChanged: _onChanged,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  labelText: 'Fecha de fin de consumo',
                ),
                //initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderTextField(
                name: 'notes',
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
                      child: Text('limpiar')),
                  // SAVE INFORMATION
                  ElevatedButton(
                      onPressed: () {
                        //VALIDATION Of data
                        _formKey.currentState?.save();
                        final rawname =
                            _formKey.currentState?.fields['medic_name']?.value;
                        final rawndosage =
                            _formKey.currentState?.fields['dosage']?.value;
                        final rawquantity =
                            _formKey.currentState?.fields['quantity']?.value;
                        final rawstartdate =
                            _formKey.currentState?.fields['init_date']?.value;
                        final rawendate =
                            _formKey.currentState?.fields['end_date']?.value;
                        final rawnotes =
                            _formKey.currentState?.fields['notes']?.value;

                        if (rawname == null ||
                            rawndosage == null ||
                            rawquantity == null ||
                            rawstartdate == null ||
                            rawendate == null) {
                          print('no salvar :(');
                        } else {
                          medication.name = rawname;
                          medication.dosage = rawndosage;
                          medication.quantity = rawquantity.round();
                          medication.startDate =
                              rawstartdate.toString().substring(0, 7);
                          medication.endDate =
                              rawendate.toString().substring(0, 7);
                          medication.notes = rawnotes;

                          DB.insert(medication);
                          print('$medication');
                        }
                      },
                      child: Text('guardar')),
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
