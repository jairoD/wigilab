class Usuario {
  Usuario({
    this.nombre,
    this.apellido,
    this.userProfileId,
    this.documentNumber,
    this.documentType,
    this.claveTemporal,
    this.esUsuarioInspira,
    this.esSolicitarRegistro,
    this.esCambioNombreUsuario,
    this.roleId,
    this.tipoClienteId,
    this.tipoUsuarioId,
    this.tokenSso,
    this.fechaUltimoAcceso,
    this.doValidation,
    this.uid,
  });

  String nombre;
  String apellido;
  String userProfileId;
  String documentNumber;
  String documentType;
  int claveTemporal;
  int esUsuarioInspira;
  int esSolicitarRegistro;
  int esCambioNombreUsuario;
  String roleId;
  String tipoClienteId;
  String tipoUsuarioId;
  String tokenSso;
  String fechaUltimoAcceso;
  bool doValidation;
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        apellido: json["apellido"],
        userProfileId: json["UserProfileID"],
        documentNumber: json["DocumentNumber"],
        documentType: json["DocumentType"],
        claveTemporal: json["claveTemporal"],
        esUsuarioInspira: json["esUsuarioInspira"],
        esSolicitarRegistro: json["esSolicitarRegistro"],
        esCambioNombreUsuario: json["esCambioNombreUsuario"],
        roleId: json["roleID"],
        tipoClienteId: json["tipoClienteID"],
        tipoUsuarioId: json["tipoUsuarioID"],
        tokenSso: json["tokenSSO"],
        fechaUltimoAcceso: json["fechaUltimoAcceso"],
        doValidation: json["doValidation"],
        uid: json["UID"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "UserProfileID": userProfileId,
        "DocumentNumber": documentNumber,
        "DocumentType": documentType,
        "claveTemporal": claveTemporal,
        "esUsuarioInspira": esUsuarioInspira,
        "esSolicitarRegistro": esSolicitarRegistro,
        "esCambioNombreUsuario": esCambioNombreUsuario,
        "roleID": roleId,
        "tipoClienteID": tipoClienteId,
        "tipoUsuarioID": tipoUsuarioId,
        "tokenSSO": tokenSso,
        "fechaUltimoAcceso": fechaUltimoAcceso,
        "doValidation": doValidation,
        "UID": uid,
      };
}
