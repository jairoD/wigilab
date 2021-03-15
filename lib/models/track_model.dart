import 'package:wigilab_test/models/albun_model.dart';
import 'package:wigilab_test/models/external_id.dart';
import 'package:wigilab_test/models/thumbnail.dart';

class Track {
  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Album album;
  List<AddedBy> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool episode;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  String name;
  int popularity;
  String previewUrl;
  bool track;
  int trackNumber;
  TrackType type;
  String uri;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json["album"]),
        artists:
            List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
        availableMarkets:
            List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        episode: json["episode"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        track: json["track"],
        trackNumber: json["track_number"],
        type: trackTypeValues.map[json["type"]],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "episode": episode,
        "explicit": explicit,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track": track,
        "track_number": trackNumber,
        "type": trackTypeValues.reverse[type],
        "uri": uri,
      };
}
