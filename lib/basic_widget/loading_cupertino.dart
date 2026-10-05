import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCupertinoWidget() {
  return MaterialApp(
    home: Container(
      margin: const EdgeInsets.only(top: 30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CupertinoButton(
            child: const Text("Contoh button"),
            onPressed: () {},
          ),
          const CupertinoActivityIndicator(),
        ],
      ),
    ),
  );
}