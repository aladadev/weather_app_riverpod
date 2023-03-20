// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  String id;
  String name;
  String email;
  DateTime registerTimme;
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.registerTimme,
  });

  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? registerTimme,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      registerTimme: registerTimme ?? this.registerTimme,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'registerTimme': registerTimme.millisecondsSinceEpoch,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      registerTimme:
          DateTime.fromMillisecondsSinceEpoch(map['registerTimme'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, email: $email, registerTimme: $registerTimme)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.registerTimme == registerTimme;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        registerTimme.hashCode;
  }
}
