import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:help_med/screens/home_screen.dart';
import 'package:help_med/screens/registration_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class personal_info extends StatelessWidget {
  //personal_info({key? key}) : super(key: key);

  final _edituser = FirebaseDatabase.instance;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0x9C0052AB),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/profile-icon-png.png'),
              ),
              Text(
                'Juan Carlos Sarabia',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '29',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                width: 150.0,
                height: 20.0,
                child: Divider(
                  color: Color(0xFF00DCA8),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.perm_identity,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    '1718142583',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    '17/06/1997',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.group_outlined,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    'Masculino',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Color.fromRGBO(0, 77, 64, 1)),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.local_hospital,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    'O+',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Color(0xFF004D40)),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    'Av. Marina de Jesus N25-100',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xFF00DCA8),
                  ),
                  title: Text(
                    '0999866060',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
                  // Background color
                  primary: Theme.of(context).colorScheme.secondaryContainer,
                ),
                onPressed: onPressed,
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Color(0xFF00DCA8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/*
  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sendin these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Creación de cuenta exitosa :)");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }*/
}
