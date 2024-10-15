import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:hyper_ui/core.dart';

Future showCustomDialogWidget({
  required String code,
}) async {
  await showDialog<void>(
    context: globalContext,
    builder: (BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 860,
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: code))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          },
                          icon: Icon(
                            MdiIcons.contentCopy,
                            size: 24.0,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    body: SyntaxView(
                        code: code, // Code text
                        syntax: Syntax.DART, // Language
                        syntaxTheme: SyntaxTheme.vscodeDark(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: true, // Enable/Disable container expansion
                        selectable: true // Enable/Disable code text selection
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
