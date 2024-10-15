import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/models/menu_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/feed/feed_page.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/home/home_page.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/live/live_page.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/notification/notification_page.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/profile/profile_page.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/viewmodels/menu_view_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/theme/contans.dart';


class MainPageUib extends StatefulWidget {
  @override
  _MainPageUibState createState() => _MainPageUibState();
}

class _MainPageUibState extends State<MainPageUib> {
  final List<MenuModel> _menuViewModel = MenuViewModel().getMenus();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _menuViewModel.length,
      child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              HomePage(MediaQuery.of(context).size,
                  MediaQuery.of(context).padding.bottom,),
              FeedPage(),
              LivePage(),
              NotificationPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1.5,
                  spreadRadius: 0.5,
                ),
              ],
              color: Colors.white,
            ),
            child: SafeArea(
              child: CustomTabBar(
                menuViewModel: _menuViewModel,
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          )),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final List<MenuModel> ?menuViewModel;
  final int ?selectedIndex;
  final Function(int)? onTap;

  const CustomTabBar({
    Key? key,
    this.menuViewModel,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      indicatorPadding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      tabs: menuViewModel!
          .asMap()
          .map(
            (int index, MenuModel menuModel) {
              final isSelect = index == selectedIndex;

              final color = isSelect ? primaryb2b : Colors.black54;

              String text = menuModel.label!;

              if (!isSelect && index == 0) {
                text = "Beranda";
              }

              return MapEntry(
                index,
                Tab(
                  iconMargin: EdgeInsets.all(0),
                  icon: SizedBox(),
                  child: Column(
                    children: [
                      _buildIcon(
                        icon:
                     menuModel.icon,
                        
                        color: color,
                        index: index,
                      ),
                      _buildLabel(
                        text: text,
                        color: color,
                        wrapText: menuViewModel![0].label == text,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }

  Stack _buildIcon({IconData ?icon, Color? color, int? index}) => Stack(
    
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          if (index == 3)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: primaryb2b,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  '123',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      );

  Baseline _buildLabel({String? text, Color? color, bool? wrapText}) => Baseline(
        baselineType: TextBaseline.alphabetic,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 9,
            color: color,
            letterSpacing: wrapText! ? -1.0 : null,
          ),
        ),
        baseline: 12,
      );
}
