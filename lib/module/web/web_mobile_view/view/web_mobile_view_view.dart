import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/constants/code_view_mobile_view.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/main/main_page.dart';
import '../controller/web_mobile_view_controller.dart';

class WebMobileViewView extends StatefulWidget {
  const WebMobileViewView({super.key});

  Widget build(context, WebMobileViewController controller) {
    controller.view = this;

    List views = [
      {"label": "UI B2B", "view": MainPageUib(), "code": codeB2b},
      {
        "label": "Dashboard2",
        "view": const UkDashboard2View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard3",
        "view": const UkDashboard3View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard4",
        "view": const UkDashboard4View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard5",
        "view": const UkDashboard5View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard6",
        "view": const UkDashboard6View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard7",
        "view": const UkDashboard7View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard8",
        "view": const UkDashboard8View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard9",
        "view": const UkDashboard9View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard10",
        "view": const UkDashboard10View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard11",
        "view": const UkDashboard11View(),
        "code": codeViewDBUK11
      },
      {
        "label": "Dashboard12",
        "view": const UkDashboard12View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard13",
        "view": const UkDashboard13View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard14",
        "view": const UkDashboard14View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard15",
        "view": const UkDashboard15View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard16",
        "view": const UkDashboard16View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard17",
        "view": const UkDashboard17View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard18",
        "view": const UkDashboard18View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard19",
        "view": const UkDashboard19View(),
        "code": codeB2b
      },
      {
        "label": "Dashboard20",
        "view": const UkDashboard20View(),
        "code": codeB2b
      },
      //Buatkan Elist1View - Elist10View
      {"label": "List1", "view": const Elist1View(), "code": codeB2b},
      {"label": "List2", "view": const Elist2View(), "code": codeB2b},
      {"label": "List3", "view": const Elist3View(), "code": codeB2b},
      {"label": "List4", "view": const Elist4View(), "code": codeB2b},
      {"label": "List5", "view": const Elist5View(), "code": codeB2b},
      {"label": "List6", "view": const Elist6View(), "code": codeB2b},
      {"label": "List7", "view": const Elist7View(), "code": codeB2b},
      {"label": "List8", "view": const Elist8View(), "code": codeB2b},
      {"label": "List9", "view": const Elist9View(), "code": codeB2b},
      {"label": "List10", "view": const Elist10View(), "code": codeB2b},
      //Buatkan Ecategory1View - Ecategory10View
      {"label": "Category1", "view": const Ecategory1View(), "code": codeB2b},
      {"label": "Category2", "view": const Ecategory2View(), "code": codeB2b},
      {"label": "Category3", "view": const Ecategory3View(), "code": codeB2b},
      {"label": "Category4", "view": const Ecategory4View(), "code": codeB2b},
      {"label": "Category5", "view": const Ecategory5View(), "code": codeB2b},
      {"label": "Category6", "view": const Ecategory6View(), "code": codeB2b},
      {"label": "Category7", "view": const Ecategory7View(), "code": codeB2b},
      {"label": "Category8", "view": const Ecategory8View(), "code": codeB2b},
      {"label": "Category9", "view": const Ecategory9View(), "code": codeB2b},
      {"label": "Category10", "view": const Ecategory10View(), "code": codeB2b},
      //Buatkan Elogin1View - Elogin10View
      {"label": "Login1", "view": const Elogin1View(), "code": codeB2b},
      {"label": "Login2", "view": const Elogin2View(), "code": codeB2b},
      {"label": "Login3", "view": const Elogin3View(), "code": codeB2b},
      {"label": "Login4", "view": const Elogin4View(), "code": codeB2b},
      {"label": "Login5", "view": const Elogin5View(), "code": codeB2b},
      {"label": "Login6", "view": const Elogin6View(), "code": codeB2b},
      {"label": "Login7", "view": const Elogin7View(), "code": codeB2b},
      {"label": "Login8", "view": const Elogin8View(), "code": codeB2b},
      {"label": "Login9", "view": const Elogin9View(), "code": codeB2b},
      {"label": "Login10", "view": const Elogin10View(), "code": codeB2b},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebMobileView"),
        actions: const [],
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        bool isTablet = MediaQuery.of(context).size.width < 1100 &&
            MediaQuery.of(context).size.width >= 850;
        bool isDesktop = MediaQuery.of(context).size.width >= 1100;
        bool isMobile = MediaQuery.of(context).size.width < 850;

        if (isMobile) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: views.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = views[index];
              var color =
                  (index + 1) % 3 == 0 ? Colors.grey[200] : Colors.grey[300];
              if ((index + 1) % 2 == 0) {
                color = Colors.grey[400];
              }
              return InkWell(
                onTap: () {
                  Get.to(Scaffold(
                    body: Stack(
                      children: [
                        item["view"],
                        Positioned(
                          right: 12,
                          bottom: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
                child: Container(
                  color: color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${item["label"]}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return QResponsiveView(
          padding: !isMobile ? null : const EdgeInsets.all(0.0),
          children: List.generate(views.length, (index) {
            var item = views[index];
            return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
              bool isTablet = MediaQuery.of(context).size.width < 1100 &&
                  MediaQuery.of(context).size.width >= 850;
              bool isDesktop = MediaQuery.of(context).size.width >= 1100;
              bool isMobile = MediaQuery.of(context).size.width < 850;
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "${item["label"]} / ${item["view"]}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (item['code'] != null) {
                                    await showCustomDialogWidget(
                                      code: item['code'],
                                    );
                                  }
                                },
                                icon: Icon(
                                  MdiIcons.xml,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        DeviceFrame(
                            device: Devices.ios.iPhone13ProMax,
                            isFrameVisible: true,
                            orientation: Orientation.portrait,
                            screen: item["view"]),
                      ],
                    ),
                  ],
                ),
              );
            });
          }),
        );
      }),
    );
  }

  @override
  State<WebMobileViewView> createState() => WebMobileViewController();
}
