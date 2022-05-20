class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;
  String profileID;

  UserModel(
      {required this.uid,
      required this.profileID,
      required this.email,
      required this.firstName,
      required this.secondName});
  //recibir data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['UserId'],
      email: map['Email'],
      firstName: map['Nombre'],
      secondName: map['Apellido'],
      profileID: map['Identificación'],
    );
  }
  //sendong data al server
  Map<String, dynamic> toMap() {
    return {
      'UserId': uid,
      'Email': email,
      'Nombre': firstName,
      'Apellido': secondName,
      'Identificación': profileID
    };
  }
}
