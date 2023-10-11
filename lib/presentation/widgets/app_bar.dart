import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: const Color(0xFF303030),
    elevation: 5,
  );
}
