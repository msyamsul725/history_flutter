import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/web/web_ai/controller/web_ai_controller.dart';

class WebAIView extends StatefulWidget {
  const WebAIView({super.key});

  Widget build(context, WebAIController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebAI"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: QCard(
                  title: "Facerecognition",
                  code: codeRevenue,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              controller.buildPhotoColumn(
                                  "Photo A",
                                  controller.photoABytes,
                                  () => controller.pickPhoto('A')),
                              controller.buildPhotoColumn(
                                  "Photo B",
                                  controller.photoBBytes,
                                  () => controller.pickPhoto('B')),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: controller.comparePhotos,
                            child: const Text(
                              "Check",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          if (controller.result != null)
                            Text(
                              controller.result!['message'],
                              style: TextStyle(
                                fontSize: 20,
                                color: controller.result!['valid']
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WebAIView> createState() => WebAIController();
}
