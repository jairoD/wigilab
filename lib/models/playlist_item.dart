import 'package:wigilab_test/models/album_model.dart';
import 'package:wigilab_test/models/track.dart';

import 'thumbnail.dart';

class PlaylistItem {
  PlaylistItem({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  DateTime addedAt;
  AddedBy addedBy;
  bool isLocal;
  dynamic primaryColor;
  Track track;
  VideoThumbnail videoThumbnail;

  factory PlaylistItem.fromJson(Map<String, dynamic> json) => PlaylistItem(
        addedAt: DateTime.parse(json["added_at"]),
        addedBy: AddedBy.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: Track.fromJson(json["track"]),
        videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt.toIso8601String(),
        "added_by": addedBy.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track.toJson(),
        "video_thumbnail": videoThumbnail.toJson(),
      };
}
