import 'package:flutter/material.dart';

import '../../domain/repositories/main_view_provider_repository.dart';
import '../../domain/requests/result_model.dart';
import '../../domain/requests/service_model.dart';
import '../http/charactes_http.dart';

class MainViewProvider extends ChangeNotifier with MainViewProviderRepository {
  final charactersHttp = CharactersHttp();

  List<Result> _listaPersonajes = [];

  List<Result> get listaPersonajes => _listaPersonajes;

  set listaPersonajes(List<Result> valor) {
    _listaPersonajes = valor;
    notifyListeners();
  }

  bool _isReadyCharapters = false;

  bool get isReadyCharapters => _isReadyCharapters;

  set isReadyCharapters(bool valor) {
    _isReadyCharapters = valor;
    notifyListeners();
  }

  @override
  void obtenerTodosPersonajes(offset) async {
    Service personajes = await charactersHttp.obtenerTodosPersonajes(offset);
    listaPersonajes.addAll(personajes.data.results);
    offset += 100;
    if (personajes.data.total > offset) {
      obtenerTodosPersonajes(offset);
    } else {
      isReadyCharapters = true;
    }
  }
}
