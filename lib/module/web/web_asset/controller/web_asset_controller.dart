
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/web_asset_view.dart';

class WebAssetController extends State<WebAssetView> {
  static late WebAssetController instance;
  late WebAssetView view;

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
    