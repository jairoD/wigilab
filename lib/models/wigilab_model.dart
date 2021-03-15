import 'package:wigilab_test/models/respons_aux_model.dart';

class Wigilab {
  Wigilab({
    this.error,
    this.response,
    this.srvNodo,
    this.secs,
    this.server,
  });

  int error;
  Response response;
  String srvNodo;
  String secs;
  String server;

  factory Wigilab.fromJson(Map<String, dynamic> json) => Wigilab(
        error: json["error"],
        response: Response.fromJson(json["response"]),
        srvNodo: json["srv_nodo"],
        secs: json["secs"],
        server: json["server"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "response": response.toJson(),
        "srv_nodo": srvNodo,
        "secs": secs,
        "server": server,
      };
}
