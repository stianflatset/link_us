import 'package:flutter/material.dart';

// UI for GPS

class GpsView extends StatefulWidget {
  @override
  _GpsViewState createState() => _GpsViewState();
}

class _GpsViewState extends State<GpsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Text('Du er på GPS'),
    );
  }
}
