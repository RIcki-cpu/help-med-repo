import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help_med/themes/app_theme.dart';

import '../model/models.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final Profile currentProfile = arguments['profile'];
    return Scaffold(
      //backgroundColor: Color.fromARGB(197, 20, 67, 196),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePicture(),
            Text(
              currentProfile.name,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Edad: ${currentProfile.age} años',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
            const SizedBox(height: 20),
            CustomFieldCard(
                text: currentProfile.id,
                icon: const FaIcon(
                  FontAwesomeIcons.idBadge,
                  color: AppTheme.primary,
                )),
            CustomFieldCard(
                text: currentProfile.height.toString(),
                icon: const FaIcon(
                  FontAwesomeIcons.ruler,
                  color: AppTheme.primary,
                )),
            CustomFieldCard(
                text: currentProfile.weight.toString(),
                icon: const FaIcon(
                  FontAwesomeIcons.weightScale,
                  color: AppTheme.primary,
                )),
            CustomFieldCard(
                text: currentProfile.bloodType,
                icon: const FaIcon(
                  FontAwesomeIcons.droplet,
                  color: AppTheme.primary,
                )),
            CustomFieldCard(
                text: currentProfile.address,
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: AppTheme.primary,
                )),
            CustomFieldCard(
                text: currentProfile.phoneNum,
                icon: const FaIcon(
                  FontAwesomeIcons.phone,
                  color: AppTheme.primary,
                )),
          ],
        ),
      ),
    );
  }
}

class CustomFieldCard extends StatelessWidget {
  final String? text;
  final Widget icon;
  const CustomFieldCard({
    Key? key,
    this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
      child: ListTile(
        leading: icon,
        title: Text(
          (text != null) ? text! : 'Sin datos',
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              color: AppTheme.primary),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 30.0,
      backgroundImage: AssetImage('assets/profile-icon-png.png'),
    );
  }
}
