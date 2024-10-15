import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/models/main_menu_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/viewmodels/main_menu_view_model.dart';

class MainMenu extends StatelessWidget {
  final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final MainMenuModel menu = _menus[index];
          return Column(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.center,
                child: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14.0), // Perbaikan di sini
    border: Border.all(
      color: Colors.black12, // Perbaikan di sini
    ),
  ),


         
              
                  child: Image.network(
                    menu.image!,
                    color: menu.color,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                menu.title!,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        },
        itemCount: _menus.length,
      ),
    );
  }
}
