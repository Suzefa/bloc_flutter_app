import 'package:equatable/equatable.dart';

class UserModel extends Equatable {

  final String userId;
  final String firstName;
  final String lastName;
  final String guardianName;
  final String email;
  final String password;
  final String gender;

  const UserModel({
    this.userId = "",
    this.firstName = "",
    this.lastName = "",
    this.guardianName = "",
    this.email = "",
    this.password = "",
    this.gender = "",
  });

  UserModel fromJson(Map<String,dynamic> json){
    return UserModel(
      userId: json["userId"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      guardianName: json["guardianName"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      gender: json["gender"] ?? "",
    );
  }

  UserModel updateCurrentUserModel({
    String? userId,
    String? firstName,
    String? lastName,
    String? guardianName,
    String? email,
    String? password,
    String? gender,
  }){
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      guardianName: guardianName ?? this.guardianName,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "userId" : userId,
      "firstName" : firstName,
      "lastName" : lastName,
      "guardianName" : guardianName,
      "email" : email,
      "gender" : gender,
    };
  }

  @override
  String toString() {
    return 'UserModel{userId: $userId, firstName: $firstName, lastName: $lastName, guardianName: $guardianName, email: $email, password: $password, gender: $gender}';
  }

  @override
  List<Object?> get props => [
    userId,
    firstName,
    lastName,
    guardianName,
    email,
    password,
    gender,
  ];
}