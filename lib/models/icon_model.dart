class Icon {
  Icon({
    this.height,
    this.url,
    this.width,
  });

  int height;
  String url;
  int width;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
