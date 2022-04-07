import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //our form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //campo de nombre
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo de apellido
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Apellido",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo de e-mail
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Registro e-mail",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo de contraseña
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nueva Contraseña",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo de confirmar contraseña
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      onSaved: (value) {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar Contraseña",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //boton de registro
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(195, 5, 230, 177),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text("Registrar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(225, 32, 59, 100),
                  fontWeight: FontWeight.bold))),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(181, 6, 111, 223),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          //paso a login
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
                        height: 100,
                        child: Image.asset(
                          "assets/help-med.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmpasswordField,
                    SizedBox(height: 20),
                    signupButton,
                    SizedBox(height: 15),
                  ],
                )),
          ),
        )),
      ),
    );
  }
}
