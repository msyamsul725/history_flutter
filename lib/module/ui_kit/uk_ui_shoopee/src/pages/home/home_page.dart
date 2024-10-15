import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/home/widgets/content.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/pages/home/widgets/header.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/theme/contans.dart';


class HomePage extends StatefulWidget {
  final Size size;
  final double paddingBottom;

  HomePage(this.size, this.paddingBottom);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();
  Offset? _position;

  double ?_dxMax;
  double? _dyMax;

  @override
  void initState() {
    _dxMax = widget.size.width - 100;
    _dyMax = widget.size.height - (160 + widget.paddingBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Content(_scrollController),
          Header(_scrollController),
          Positioned(
              left: _position != null
                  ? _position!.dx > widget.size.width / 2 ? _dxMax : 0
                  : _dxMax,
              top: _position != null ? _position!.dy : _dyMax,
              child: Draggable(
                  feedback: _buildDragFAB(),
                  child: _buildDragFAB(),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    setState(() {
                      _position = details.offset;
                    });
                  }))
        ],
      ),
    );
  }

  Stack _buildDragFAB() => Stack(

        children: [
          RawMaterialButton(
            onPressed: () {
              print("Print");
            },
            elevation: 4.0,
            fillColor: Colors.white,
            child: FlutterLogo(
              style: FlutterLogoStyle.stacked,
              size: 50,
            ),
            padding: EdgeInsets.all(8),
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 22,
              height: 22,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: primaryb2b,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -10,
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircleAvatar(
                backgroundColor: primaryb2b,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          )
        ],
      );
}
