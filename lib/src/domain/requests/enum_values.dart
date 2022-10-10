import '../enums/item_type.dart';
import '../enums/url_type.dart';

class EnumValues<T> {
  static final urlTypeValues = EnumValues({
    "comiclink": UrlType.COMICLINK,
    "detail": UrlType.DETAIL,
    "wiki": UrlType.WIKI
  });

  static final itemTypeValues = EnumValues(
      {"cover": ItemType.COVER, "interiorStory": ItemType.INTERIOR_STORY});
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
