import 'package:flutter/material.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'package:intent/flag.dart';

class PhotosWidget extends StatefulWidget {
  @override
  _PhotosWidgetState createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget> {
  @override
  Widget build(BuildContext context) {
    final children = new Scaffold(
      body: new Image.asset(
        'assets/images/image2.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
    return new GestureDetector(
      onTap: openGalery,
      child: children,
    );
  }
}

openGalery() {
  print("opening");
  android_intent.Intent()
    ..setAction(android_action.Action.ACTION_VIEW)
    ..setType("image/*")
    ..addFlag(Flag.FLAG_ACTIVITY_NEW_TASK)
    ..startActivity().catchError((e) => print("Mensagem de ero foi essa: $e"));
}
