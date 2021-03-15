import 'package:wigilab_test/models/external_url_model.dart';
import 'package:wigilab_test/models/image_model.dart';
import 'package:wigilab_test/models/owner_model.dart';
import 'package:wigilab_test/models/tracks_model.dart';

class PlayListCategory {
  PlayListCategory({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  dynamic primaryColor;
  dynamic public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  factory PlayListCategory.fromJson(Map<String, dynamic> json) =>
      PlayListCategory(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toJson(),
        "type": type,
        "uri": uri,
      };
}
