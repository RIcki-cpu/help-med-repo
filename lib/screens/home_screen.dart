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
  User? user = FirebaseAuth.instance
      .currentUser; // get user from current Instance ... could be no user :'(
  UserModel? loggedInUser;

  //this profile will be sent as argument to the next screens
  //TODO when switch profile is implemented the current profile would be retrieve from SwitchProfileScreen in base of id
  Profile? currentProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(
          value.data()); // Map authenticate user to our Model user
      setState(() {});
    });

    //JUST FOR Testing Purpose. If there isn't profile add some test data
    //change as you wish
    currentProfile ??= Profile(
        name: 'TestName',
        id: '123567',
        age: 55,
        address: 'av Springfield',
        phoneNum: '0893213123');
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
                            Text(currentProfile!.name,
                                // "${loggedInUser?.firstName} ${loggedInUser?.secondName}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                )),
                            Text("${loggedInUser?.email}",
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
                    //Send the List of Medications and the userid for writing purposes
                    Profile testProfile = await getDefaultProfile();
                    Navigator.pushNamed(context, 'medicamentos', arguments: {
                      'profile': testProfile,
                    });
                    //readData(); JUST for testing Purposes
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

  void readData() async {
    // final db = DataRepository(userid: loggedInUser!.uid);

    //READ.......................................................

    // final docsnap = await db.getProfile('1234567');
    // final profileMap = docsnap.data();

    // // PARSE The Map to Profile object even with null fields
    // Profile px = Profile.fromFiresore(profileMap as Map<String, dynamic>);

    // print('La INFO ES......');
    // print(px.phoneNum);

    //CREATE Profile---------------------------------------------
    // p1 = Profile(
    //     name: 'Juanita',
    //     id: '21312321',
    //     age: 12,
    //     address: 'de la suarez',
    //     phoneNum: 'dsasadasdasd');

    // db.addProfile(p1);

    //CREATE profile with the given id-------------------------------

    // p1 = Profile(
    //     name: 'tu mama la zorra',
    //     id: '782312',
    //     age: 99,
    //     address: 'de la dddd',
    //     phoneNum: '0231233');

    // db.addProfileID(p1);

    //ERASE ------------------------------------------------------------
    // p1 = Profile(
    //     name: 'tu mama la zorra',
    //     id: '782312',
    //     age: 99,
    //     address: 'de la dddd',
    //     phoneNum: '0231233');

    //UPDATE --------------------------------------------------------

    // Profile p1 = Profile(
    //     name: 'gERARDO EL CACAS',
    //     id: '1234567',
    //     weight: 124,
    //     age: 44,
    //     address: 'de la uiiiiiii',
    //     phoneNum: '0231233');

    // db.updateProfile(p1);

    //CRUD With medicine
    //
    //1.- Retrieve Profile and send the List<Medicine>, userid, profileid(ci)
    //2.- Display all Medicines if there exists
    //A => Create a new one
    //3.- push screen edit and send (userid,profileid)
    //4.- Create a object Medicine
    //5.- Parse the Medicine to Map
    //4.- add the Element to th array though and update

    // B=> Edit one
    // 3.- Push screem edit and send (Medicine, userid, profileid)
    // 4.- Update the object Medicine and toMap
    // 5.- Remove the old Medicine from the array with ===== doc().update() .... arrayRemove(objecttOErase)
    // 6.- Add the Medicine to the array with ====> doc().update().....arrayUnion(ObjectToAdd)
    //  Retrieve the List<Map<String,dynamic> field with ======= doc().get().data()
    //  Pop 2 screens and send the List Parsed to MedicineScreen

    //  // Add a new document with a generated ID
    //   db.collection("users").add(user).then((DocumentReference doc) =>
    //       print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<Profile> getDefaultProfile() async {
    final db = DataRepository(userid: loggedInUser!.uid);
    final docsnap = await db.getDefaultProfile(loggedInUser!.profileID);
    final profileMap = docsnap.data();

    return Profile.fromFiresore(profileMap as Map<String, dynamic>);
  }
}
