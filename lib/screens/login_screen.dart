import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    //campo de email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //contraseña campo
    final passwordField = TextFormField(
      autofocus: false,
      controller: emailController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(195, 5, 230, 177),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(225, 32, 59, 100),
                  fontWeight: FontWeight.bold))),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(181, 6, 111, 223),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Color.fromARGB(225, 32, 59, 100),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[emailField, passwordField, loginButton],
              )),
        )),
      ),
    );
  }
}
