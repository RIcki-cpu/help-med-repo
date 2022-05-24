import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_med/db.dart';
import 'package:help_med/model/profile_model.dart';
import 'package:help_med/model/user_model.dart';
import 'package:help_med/screens/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  //our form key
  final _formKey = GlobalKey<FormState>();
  //editing controller

  final firstNameEditingController = new TextEditingController();

  final secondNameEditingController = new TextEditingController();

  final emailEditingController = new TextEditingController();

  final passwordEditingController = new TextEditingController();

  final confirmpasswordEditingController = new TextEditingController();

  final identificationEditingController = new TextEditingController();

  final ageEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //campo de nombre
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Su Nombre no puede quedar vacío");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese su nombre para registrarse..");
        }
        return null;
      },
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
      style: TextStyle(color: Colors.white),
    );
    //campo de apellido
    final secondNameField = TextFormField(
      autofocus: false,
      cursorColor: Colors.white,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Su Apellido no puede quedar vacío");
        }
        return null;
      },
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
      style: TextStyle(color: Colors.white),
    );
    //campo de e-mail
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Registro e-mail",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );
    //campo de contraseña
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      cursorColor: Colors.white,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Registre su Contraseña");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña válida..(Mínimo 6 caracteres)");
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nueva Contraseña",
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );

    //campo de confirmar contraseña
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      cursorColor: Colors.white,
      validator: (value) {
        if (confirmpasswordEditingController.text !=
            passwordEditingController.text) {
          return "Contraseñas no coinciden";
        }
        return null;
      },
      onSaved: (value) {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar Contraseña",
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );
    //campo de identificación
    final idField = TextFormField(
      autofocus: false,
      controller: identificationEditingController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp('^[0-9]');
        if (value!.isEmpty) {
          return ("Es obligatorio el campo de identificación para el registro");
        }
        if (!regex.hasMatch(value)) {
          return ("Favor solo ingresar numeros");
        }
        return null;
      },
      onSaved: (value) {
        identificationEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.crop_landscape_outlined, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Numero de Identificación",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );

    //campo de identificación
    final ageField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp('^[0-9]');
        if (value!.isEmpty) {
          return ("Es obligatorio el campo de identificación para el registro");
        }
        if (!regex.hasMatch(value)) {
          return ("Favor solo ingresar numeros");
        }
        return null;
      },
      onSaved: (value) {
        ageEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.crop_landscape_outlined, color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Edad",
          hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      style: TextStyle(color: Colors.white),
    );

    //boton de registro
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(195, 5, 230, 177),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            singUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text("Registrar",
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
                    idField,
                    SizedBox(height: 20),
                    ageField,
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

  void singUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sendin these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
        uid: 'testid',
        email: 'anyemail.com',
        firstName: 'FirstName',
        secondName: 'SecondName',
        profileID: '12345678');

    Profile defaultProfile = Profile(
        name:
            '${firstNameEditingController.text} ${secondNameEditingController.text}',
        id: identificationEditingController.text,
        age: int.parse(ageEditingController.text));
    //writing all the values
    userModel.email = user!.email!;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.profileID = identificationEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Creación de cuenta exitosa :)");

    final db = DataRepository(userid: user.uid);
    db.addProfileID(defaultProfile);

    Navigator.popAndPushNamed(context, 'home');
  }
}
