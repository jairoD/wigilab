class Cuenta {
  Cuenta({
    this.lineOfBusiness,
    this.accountId,
    this.alias,
    this.token,
  });

  String lineOfBusiness;
  String accountId;
  String alias;
  String token;

  factory Cuenta.fromJson(Map<String, dynamic> json) => Cuenta(
        lineOfBusiness: json["LineOfBusiness"],
        accountId: json["AccountId"],
        alias: json["alias"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "LineOfBusiness": lineOfBusiness,
        "AccountId": accountId,
        "alias": alias,
        "token": token,
      };
}
