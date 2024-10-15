import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/main/main_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shopee Clone UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPageUib()
    );
  }
}
