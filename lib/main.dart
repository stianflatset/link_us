import 'package:flutter/material.dart';
import 'package:link_us/views/home_view.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_view(),
    );
  }
}
