import 'package:flutter/material.dart';
import 'package:help_med/model/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help_med/screens/screens.dart';
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
      // onTap: () => Navigator.push<Widget>(
      //   //Still doesn't work
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomeScreen(),
      //   ),
      // ),
      splashColor: Colors.brown,
      // splashColor: splashColor[pet.type],
    ));
  }

  // Widget _getPetIcon(String type) {
  //   Widget petIcon;
  //   if (type == 'cat') {
  //     petIcon = IconButton(
  //       icon: const Icon(Pets.cat, color: Colors.pinkAccent,),
  //       onPressed: () {},
  //     );
  //   } else if (type == 'dog') {
  //     petIcon = IconButton(
  //       icon: const Icon(Pets.dog_seating, color: Colors.blueAccent,),
  //       onPressed: () {},
  //     );
  //   } else {
  //     petIcon = IconButton(
  //       icon: const Icon(Icons.pets, color: Colors.blueGrey,),
  //       onPressed: () {},
  //     );
  //   }
  //   return petIcon;
  // }
}
