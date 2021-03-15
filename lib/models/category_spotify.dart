import 'package:wigilab_test/models/icon_model.dart';

class Category {
  Category({
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  String href;
  List<Icon> icons;
  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        href: json["href"],
        icons: List<Icon>.from(json["icons"].map((x) => Icon.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "icons": List<dynamic>.from(icons.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}
