import 'dart:convert';

import '../../domain/repositories/characters_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/requests/comics_detail_model.dart';
import '../../domain/requests/service_model.dart';
import '../consts/const.dart';
import '../env/enviroment.dart';

class CharactersHttp extends CharactersRepository {
  @override
  Future<Service> obtenerPersonajes() async {
    final url =
        '${Env.marvelApi}/characters?ts=${Consts.ts}&apikey=${Consts.apikey}&hash=${Consts.hash}';

    final res = await http.get(
      Uri.parse(url),
    );

    Service service = Service.fromJson(json.decode(res.body));

    return service;
  }

  @override
  Future<Service> obtenerTodosPersonajes(int offset) async {
    final url =
        '${Env.marvelApi}?limit=100&offset=$offset${Env.marvelApitsAndHash}';

    final res = await http.get(
      Uri.parse(url),
    );

    Service service = Service.fromJson(json.decode(res.body));

    return service;
  }

  @override
  Future obtenerComicPorPersonajes(idPersonaje, offset) async {
    final url =
        '${Env.marvelApi}/$idPersonaje/comics?limit=100&offset=$offset${Env.marvelApitsAndHash}';
    final res = await http.get(
      Uri.parse(url),
    );

    ComicDetailModel comicDetail =
        ComicDetailModel.fromJson(json.decode(res.body)['data']);

    return comicDetail;
  }
}
