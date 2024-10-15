import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyper_ui/module/constants/code_view_oop_list.dart';
import 'package:hyper_ui/module/web/web_oop/list/controller/list_controller.dart';
import 'package:hyper_ui/module/web/web_oop/list/widget/any&where.dart';
import 'package:hyper_ui/module/web/web_oop/list/widget/first_where.dart';
import 'package:hyper_ui/module/web/web_oop/list/widget/index_where.dart';
import 'package:hyper_ui/module/web/web_oop/list/widget/short.dart';
import 'package:hyper_ui/shared/widget/card/card.dart';
import 'package:hyper_ui/shared/widget/responsive/q_responsive_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListViewOop extends StatefulWidget {
  const ListViewOop({super.key});

  Widget build(context, ListController controller) {
    controller.view = this;
    return Scaffold(
        appBar: AppBar(
          title: const Text("List"),
          actions: const [],
        ),
        body: QResponsiveView(
          children: [
            QCard(
              title: "Summarize Text",
              code: codeSummarizeText,
              children: [
                Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        child: Row(
                          children: List.generate(
                            controller.sendTemplate.length,
                            (index) {
                              var item = controller.sendTemplate[index];
                              bool selected = index == 0;

                              return Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                child: Text(
                                  controller.getPreviewText(item),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            QCard(title: 'Index Where', code: codeIndexWhere, children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const IndexWherePage())
            ]),
            QCard(title: 'First Where', code: codeFirstWhere, children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const FirstWherePage())
            ]),
            QCard(title: 'Any & Where', code: anywhere, children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const AnyWherePage())
            ]),
            QCard(title: 'Short', code: codeSortList, children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const SortOrderPage())
            ]),
          ],
        ));
  }

  @override
  State<ListViewOop> createState() => ListController();
}
