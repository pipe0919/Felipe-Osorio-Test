import '../consts/const.dart';

class Env {
  static const String _marvelApi =
      "https://gateway.marvel.com:443/v1/public/characters";
  static get marvelApi => _marvelApi;
  static final String _marvelApitsAndHash =
      "&ts=${Consts.ts}&apikey=${Consts.apikey}&hash=${Consts.hash}";
  static get marvelApitsAndHash => _marvelApitsAndHash;
}
