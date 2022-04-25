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
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Help med'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Has modificado el texto todas estas veces: ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red,
          )
        ],
      )),
=======
      debugShowCheckedModeBanner: false,
      title: 'Email y contraseña Login',
      theme: AppTheme.darkTheme,
      home: LoginScreen(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'medicamentos': (BuildContext context) => const MedicationScreen(),
        'edit_med': (BuildContext context) => EditMedicineScreen(),
        // 'alergias': (BuildContext context) => const ListView2Screen(),
        // 'signin': (BuildContext context) => const CardScreen(),
        'login': (BuildContext context) => LoginScreen(),
      },
>>>>>>> 7c2c748e5e894db6a281b8c01f36fe424eb745f9
    );
  }
}
