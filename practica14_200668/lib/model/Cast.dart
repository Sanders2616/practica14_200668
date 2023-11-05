import 'package:practica14_200668/common/Util.dart';
import 'package:practica14_200668/common/MediaProvider.dart';
import 'package:practica14_200668/model/Media.dart';

class Cast{
  int id;
  String name;
  String profilePath;

  String getCastUrl()=> getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap, MediaType mediaType) {
    try {
      return Cast.deserialize(jsonMap, mediaType);
    } catch (ex) {
      throw ex;
    }
  }
  Cast.deserialize(Map jsonMap, MediaType mediaType):
    id = jsonMap["cast_id"].toInt(),
    name = jsonMap["name"],
    profilePath = jsonMap["profile_path"]??"assets/img.png";

} 