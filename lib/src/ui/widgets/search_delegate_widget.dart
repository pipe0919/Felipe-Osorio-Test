// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';

import '../../domain/requests/result_model.dart';

class SearchResultDelegate extends SearchDelegate<Result> {
  final List<Result> resultados;

  List<Result> _filter = [];

  SearchResultDelegate(this.resultados);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title:
              GestureDetector(onTap: () {}, child: Text(_filter[index].name)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = resultados.where((resultado) {
      return resultado.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: GestureDetector(
              onTap: () {
                print('2');
              },
              child: Text(_filter[index].name)),
        );
      },
    );
  }
}
