import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

Future showCodeView() async {
  await showModalBottomSheet<void>(
    context: Get.currentContext!,
    builder: (BuildContext context) {
      return const BottomSheetCodeView();
    },
  );
}

class BottomSheetCodeView extends StatefulWidget {
  const BottomSheetCodeView({super.key});

  @override
  State<BottomSheetCodeView> createState() => _BottomSheetCodeViewState();
}

class _BottomSheetCodeViewState extends State<BottomSheetCodeView> {
  bool visible = false;
  updateVisibility() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (e) {
        print(e.velocity.pixelsPerSecond.direction);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            if (visible)
              const SizedBox(
                height: 100,
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Your order was placed!'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
