import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_med/db.dart';
import 'package:help_med/model/models.dart';
import 'package:help_med/screens/screens.dart';
import 'package:help_med/util/category_card.dart';
import 'package:help_med/util/service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  List<Medication> drugs = [];

  cargarLista() async {
    drugs = await DB.getallDrugs();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(181, 6, 111, 223),
      body: SafeArea(
        child: Column(
          children: [
            //APP BAR
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bienvenido de vuelta",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                )),
                            Text("${loggedInUser.email}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                )),
                          ]),
                      //profile picture
                      Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(195, 5, 230, 177),
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(Icons.person)),
                    ])),
            const SizedBox(height: 25),
            //card-> Como te sientes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(195, 5, 196, 230)),
                  child: Row(
                    children: [
                      //prrsimia animacion
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Image.asset(
                          "assets/help-med.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      //Como estas el diade Hoy?
                      Expanded(
                        child: Column(
                          children: [
                            const Text('¿Cómo va tu día?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                            SizedBox(height: 12),
                            const Text('Registra los cambios en tu historial',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                )),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(195, 5, 230, 177),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                  child: Text('Empezemos!!',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            //Barra desplazadora-info,resumen,agregar
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Secciones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(235, 98, 233, 202),
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    categoryName: 'Resumen',
                    iconImage: 'lib/icons/resumen.png',
                  ),
                  CategoryCard(
                    categoryName: 'Info Personal',
                    iconImage: 'lib/icons/inform.png',
                  ),
                  CategoryCard(
                    categoryName: 'Añadir Miembro',
                    iconImage: 'lib/icons/users.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //lista de registros
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Registro médico',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(235, 98, 233, 202),
                      fontSize: 20,
                    ),
                  ),
                  /*Text(
                    'Ver todos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(218, 98, 233, 202),
                      fontSize: 16,
                    ),
                  ),*/
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            //registro de servicios ofrecido
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Service(
                  serviceImage: 'lib/images/alergia.png',
                  serviceName: 'Alergias',
                  fn: () {},
                ),
                Service(
                  serviceImage: 'lib/images/cirugias.png',
                  serviceName: 'Cirugias',
                  fn: () {},
                ),
                Service(
                  serviceImage: 'lib/images/vacun.png',
                  serviceName: 'Vacunas',
                  fn: () {},
                ),
                Service(
                  serviceImage: 'lib/images/citam.png',
                  serviceName: 'Citas Médicas',
                  fn: () {},
                ),
                Service(
                  serviceImage: 'lib/images/enfer.png',
                  serviceName: 'Enfermedades',
                  fn: () {},
                ),
                Service(
                  serviceImage: 'lib/images/medicamentos.png',
                  serviceName: 'Medicamentos',
                  fn: () async {
                    await cargarLista();
                    Navigator.pushNamed(context, 'medicamentos',
                        arguments: {'medicamentos': drugs});
                  },
                ),
              ],
            )),

            ActionChip(
                label: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  logout(context);
                }),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
