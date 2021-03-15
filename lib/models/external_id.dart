import 'package:wigilab_test/models/external_url_model.dart';

enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues =
    EnumValues({"day": ReleaseDatePrecision.DAY});

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  String isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}
