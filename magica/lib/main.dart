import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magica/app/home_widget.dart';
import 'package:magica/app/photos_widget.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final statuses = [Permission.storage].request();
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    final pages = PageView(
      controller: _controller,
      children: [
        HomeWidget(),
        PhotosWidget(),
      ],
    );
    return pages;
  }
}
