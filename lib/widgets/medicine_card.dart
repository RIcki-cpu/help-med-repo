import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help_med/db.dart';
import 'package:help_med/model/models.dart';
import 'package:help_med/themes/app_theme.dart';

class MedicineCard extends StatelessWidget {
  final Medication medicamento;
  final Profile profile;
  final String userid;

  const MedicineCard(
      {Key? key,
      required this.medicamento,
      required this.profile,
      required this.userid})
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
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'edit_med', arguments: {
                      'medication': medicamento,
                      'profile': profile
                    });
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.pencil,
                    color: AppTheme.primary,
                  )),
              IconButton(
                  onPressed: () async {
                    final db = DataRepository(userid: userid);
                    final var1 =
                        await db.removeMedicine(profile, medicamento.toMap());

                    Profile upToDateProfile =
                        await Profile.getUpToDateProfile(userid, profile.id);

                    Navigator.pushNamedAndRemoveUntil(
                        context, 'home', (route) => route.isFirst,
                        arguments: {'profile': upToDateProfile});
                    // Navigator.pushNamed(context, 'medicamentos',
                    //     arguments: {'profile': upToDateProfile});
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
