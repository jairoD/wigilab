import 'package:wigilab_test/models/external_url_model.dart';
import 'package:wigilab_test/models/image_model.dart';

class ArtistDetailsModel {
  ArtistDetailsModel({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  ExternalUrls externalUrls;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  List<Image> images;
  String name;
  int popularity;
  String type;
  String uri;

  factory ArtistDetailsModel.fromJson(Map<String, dynamic> json) =>
      ArtistDetailsModel(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "followers": followers.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
      };
}

class Followers {
  Followers({
    this.href,
    this.total,
  });

  dynamic href;
  int total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}
