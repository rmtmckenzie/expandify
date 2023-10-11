import 'package:expandify/expandify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    WidgetsApp(
      pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(builder: builder),
      home: Scaffold(
        body: Expandify(
          direction: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(color: Colors.blue, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
            ],
          ),
        ),
      ),
      color: Colors.white,
    ),
  );
}
