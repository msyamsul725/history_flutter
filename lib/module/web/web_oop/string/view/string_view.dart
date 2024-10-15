
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/string_controller.dart';

class StringView extends StatefulWidget {
  const StringView({super.key});

  Widget build(context, StringController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("String"),
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
  State<StringView> createState() => StringController();
}
    