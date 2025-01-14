
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/string_view.dart';

class StringController extends State<StringView> {
  static late StringController instance;
  late StringView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    