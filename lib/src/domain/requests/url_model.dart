import '../enums/url_type.dart';
import 'enum_values.dart';

class Url {
  Url({
    required this.type,
    required this.url,
  });

  UrlType type;
  String url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: EnumValues.urlTypeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": EnumValues.urlTypeValues.reverse[type],
        "url": url,
      };
}
