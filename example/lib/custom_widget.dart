import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:print_bluetooth_thermal_example/mytable.dart';

class WidgetToImage extends StatefulWidget {
  final GlobalKey<_WidgetToImageState> globalKey =
      GlobalKey<_WidgetToImageState>();

  late final Uint8List? byteData;

  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      getImageBytes2().then((v) {
        widget.byteData = v;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: widget.globalKey,
      child:Directionality(
        textDirection: TextDirection.rtl,
        child: CustomReceipt())
    );
  }

  Future<ui.Image> capturePng() async {
    try {
      RenderRepaintBoundary boundary = widget.globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 1.5);
      return image;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Uint8List?> getImageBytes2() async {
    ui.Image image = await capturePng();
    print("Image:...:${image.toString()}");
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }


}
