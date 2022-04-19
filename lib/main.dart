import 'package:flutter/material.dart';
import 'package:help_med/screens/medicine_screen.dart';
import 'package:help_med/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:help_med/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: LoginScreen(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'medicamentos': (BuildContext context) => const MedicineScreen(),
        'edit_med': (BuildContext context) => const EditMedicineScreen(),
        // 'alergias': (BuildContext context) => const ListView2Screen(),
        // 'signin': (BuildContext context) => const CardScreen(),
        // 'login': (BuildContext context) => const AlertScreen(),
      },
    );
  }
}
