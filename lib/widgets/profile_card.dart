import 'package:flutter/material.dart';
import 'package:help_med/model/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:help_med/themes/app_theme.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final TextStyle boldStyle;

  // final  splashColor = {
  //   'cat': Colors.pink[100],
  //   'dog': Colors.blue[100],
  //   'other': Colors.grey[100]};

  ProfileCard({Key? key, required this.profile, required this.boldStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(profile.name, style: boldStyle),
            ),
          ),
          const FaIcon(
            FontAwesomeIcons.user,
            color: AppTheme.primary,
          ),
          SizedBox(width: 20)
          // _getPetIcon(pet.type)
        ],
      ),
      onTap: () {
        Navigator.popAndPushNamed(context, 'home',
            arguments: {'profile': profile});
      },

      splashColor: Colors.brown,
      // splashColor: splashColor[pet.type],
    ));
  }
}
