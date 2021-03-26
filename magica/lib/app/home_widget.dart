import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final children = new Scaffold(
      body: new Image.asset(
        'assets/images/image1.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
    return new GestureDetector(
      onTapDown: _onTapDown,
      child: children,
    );
  }
}

_onTapDown(TapDownDetails details) {
  var x = details.globalPosition.dx;
  var y = details.globalPosition.dy;

  print(details.localPosition);

  int dx = (x / 80).floor();
  int dy = ((y - 180) / 100).floor();
  int posicao = dy * 5 + dx;
  print("results: x=$x y=$y $dx $dy $posicao");
  _save(posicao);
}

_save(int posicao) async {
  var appDocDir = await getTemporaryDirectory();
  String savePath = appDocDir.path + "/efeito-$posicao.jpg";
  print(savePath);
  await Dio().download(
      "https://raw.githubusercontent.com/otnielgusta/magica2/main/arq/efeito-$posicao.jpeg",
      savePath);
  print("saved");
  final result = await ImageGallerySaver.saveFile(savePath);
  print(result);
}
