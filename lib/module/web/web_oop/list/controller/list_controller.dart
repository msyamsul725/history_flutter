import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/list_view.dart';

class ListController extends State<ListViewOop> {
  static late ListController instance;
  late ListViewOop view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  List sendTemplate = ["Apakah Stock Masih ada?", "Bisa dikirim sekarang?"];
  String getPreviewText(String item) {
    List<String> words = item.split(" ");
    return words.length > 2 ? "${words[0]} ${words[1]}..." : item;
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
