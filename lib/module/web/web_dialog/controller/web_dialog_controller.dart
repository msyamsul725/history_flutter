
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/web_dialog_view.dart';

class WebDialogController extends State<WebDialogView> {
  static late WebDialogController instance;
  late WebDialogView view;

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
    