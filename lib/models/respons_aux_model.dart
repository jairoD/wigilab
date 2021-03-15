import 'package:wigilab_test/models/cuenta_model.dart';
import 'package:wigilab_test/models/usuario_model.dart';

class Response {
  Response({
    this.usuario,
    this.cuentas,
  });

  Usuario usuario;
  List<Cuenta> cuentas;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        usuario: Usuario.fromJson(json["usuario"]),
        cuentas:
            List<Cuenta>.from(json["cuentas"].map((x) => Cuenta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "cuentas": List<dynamic>.from(cuentas.map((x) => x.toJson())),
      };
}
