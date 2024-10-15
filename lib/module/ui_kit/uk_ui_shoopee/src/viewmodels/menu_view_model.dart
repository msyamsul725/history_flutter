import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/models/menu_model.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuViewModel {
  List<MenuModel> getMenus() {
    return [
      MenuModel(
        icon: MdiIcons.home,
        iconSelected: Icons.thumb_up,
        label: "Beranda",
      ),
      MenuModel(
        icon: Icons.filter_none,
        iconSelected: Icons.filter_none,
        label: "Feed",
      ),
      MenuModel(
        icon: MdiIcons.videoOutline,
        iconSelected: MdiIcons.video,
        label: "Shopee Live",
      ),
      MenuModel(
        icon: MdiIcons.bellOutline,
        iconSelected: MdiIcons.bell,
        label: "Notifikasi",
      ),
      MenuModel(
        icon: MdiIcons.accountOutline,
        iconSelected: MdiIcons.account,
        label: "Saya",
      ),
    ];
  }
}
