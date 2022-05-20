import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_med/screens/home_screen.dart';
import 'package:help_med/screens/registration_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editar controlador
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //campo de email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Ingresa tu Correo electrónico");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Por favor ingrese un correo válido");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.white),
          focusColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );
    //contraseña campo
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      cursorColor: Colors.white,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Contraseña es requerida para Iniciar");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña válida..(Mínimo 6 caracteres)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(195, 5, 230, 177),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          //direccion a la parte de HOME
          onPressed: () {
            signIn(emailController.text, passwordController.text);
            //Navigator.pushReplacement(context,
            //MaterialPageRoute(builder: ((context) => HomeScreen())));
          },
          child: const Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(225, 32, 59, 100),
                  fontWeight: FontWeight.bold))),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(181, 6, 111, 223),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Color.fromARGB(225, 32, 59, 100),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/help-med.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "¿No tienes Cuenta?",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              " Regístrate Aquí",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 238, 166),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 17),
                            ))
                      ],
                    )
                  ],
                )),
          ),
        )),
      ),
    );
  }

//login function
  void signIn(String email, String password) async {
    // DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('test');
    // _testRef.set('Hola perraaa');
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Inicio de sesión exitoso"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
