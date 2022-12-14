import 'package:flutter/material.dart';

import 'src/ui/pages/main/main_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}
