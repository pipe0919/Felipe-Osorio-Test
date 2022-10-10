import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/main_view_provider.dart';

import '../home/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainViewProvider>(
          create: (_) => MainViewProvider(),
        ),
      ],
      child: const MaterialApp(
          title: 'Prueba Felipe Osorio',
          debugShowCheckedModeBanner: false,
          home: HomePageView()),
    );
  }
}
