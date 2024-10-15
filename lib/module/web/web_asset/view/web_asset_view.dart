
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/web_asset_controller.dart';

class WebAssetView extends StatefulWidget {
  const WebAssetView({super.key});

  Widget build(context, WebAssetController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web Asset"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<WebAssetView> createState() => WebAssetController();
}
    