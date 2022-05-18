class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({this.uid, this.email, this.firstName, this.secondName});
  //recibir data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['UserId'],
      email: map['Email'],
      firstName: map['Nombre'],
      secondName: map['Apellido'],
    );
  }
  //sendong data al server
  Map<String, dynamic> toMap() {
    return {
      'UserId': uid,
      'Email': email,
      'Nombre': firstName,
      'Apellido': secondName
    };
  }
}
