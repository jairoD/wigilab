class ResponseModel {
  final dynamic data;
  final int statusCode;

  ResponseModel({
    this.data = const {},
    this.statusCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
      'statusCode': this.statusCode,
    };
  }
}
