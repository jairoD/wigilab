import 'dart:convert';

class FirebaseUserModel {
  String apellido;
  String correo;
  String documento;
  String nombre;
  String uid;
  FirebaseUserModel({
    this.apellido,
    this.correo,
    this.documento,
    this.nombre,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'apellido': apellido,
      'correo': correo,
      'documento': documento,
      'nombre': nombre,
      'uid': uid,
    };
  }

  factory FirebaseUserModel.fromMap(Map<String, dynamic> map) {
    return FirebaseUserModel(
      apellido: map['apellido'],
      correo: map['correo'],
      documento: map['documento'],
      nombre: map['nombre'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUserModel.fromJson(String source) =>
      FirebaseUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseUserModel(apellido: $apellido, correo: $correo, documento: $documento, nombre: $nombre, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseUserModel &&
        other.apellido == apellido &&
        other.correo == correo &&
        other.documento == documento &&
        other.nombre == nombre &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return apellido.hashCode ^
        correo.hashCode ^
        documento.hashCode ^
        nombre.hashCode ^
        uid.hashCode;
  }
}
