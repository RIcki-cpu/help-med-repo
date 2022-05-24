import 'package:flutter/material.dart';
import 'package:help_med/screens/medicine_screen.dart';
import 'package:help_med/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:help_med/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initalize Firebase before the app
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Email y contraseña Login',
      theme: AppTheme.darkTheme,
      initialRoute: 'login',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'profile': (BuildContext context) => ProfileScreen(),
        'medRec': (BuildContext context) => MedicalRecord(),
        'medicamentos': (BuildContext context) => MedicationScreen(),
        'edit_med': (BuildContext context) => EditMedicineScreen(),
        'switchAcc': (BuildContext context) => SwitchAccount(),
        // 'vaccines': (BuildContext context) => const ListView2Screen(),
        'signin': (BuildContext context) => RegistrationScreen(),
        'login': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
