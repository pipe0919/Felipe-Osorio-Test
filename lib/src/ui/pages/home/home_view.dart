import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/http/charactes_http.dart';
import '../../../data/providers/main_view_provider.dart';

import '../../utilities/responsive.dart';
import '../../widgets/search_delegate_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  MainViewProvider mainViewProvider = MainViewProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainViewProvider = Provider.of<MainViewProvider>(context, listen: false);
      mainViewProvider.obtenerTodosPersonajes(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainViewProvider = Provider.of<MainViewProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: mainViewProvider.isReadyCharapters
            ? ListTile(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate:
                        SearchResultDelegate(mainViewProvider.listaPersonajes),
                  );
                },
                title: const Text('Search'),
              )
            : const Text('Cargando'),
      ),
      body: mainViewProvider.isReadyCharapters
          ? SizedBox(
              height: Adapt.hp(100),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 13.0,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: Adapt.hp(5),
                  mainAxisExtent: Adapt.hp(50),
                ),
                itemBuilder: (BuildContext context, int index) {
                  try {
                    return GestureDetector(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Adapt.hp(1),
                          ),
                          Text(
                            mainViewProvider.listaPersonajes[index].name
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Adapt.hp(1),
                          ),
                          Container(
                            height: Adapt.hp(44),
                            width: Adapt.wp(60),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${mainViewProvider.listaPersonajes[index].thumbnail.path}/portrait_incredible.${mainViewProvider.listaPersonajes[index].thumbnail.extension}'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        final charactersHttp = CharactersHttp();
                        final comics =
                            await charactersHttp.obtenerComicPorPersonajes(
                                mainViewProvider.listaPersonajes[index].id, 0);
                        print(comics);
                      },
                    );
                  } catch (e) {
                    return Container();
                  }
                },
                itemCount: mainViewProvider.listaPersonajes.length,
              ),
            )
          : const Text('Busca tu personaje favorito'),
    );
  }
}
