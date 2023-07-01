import 'package:flutter/material.dart';

class TileRadioModel {
  final EdgeInsetsGeometry marginRadio;
  final EdgeInsetsGeometry paddingRadio;
  final Color color;
  final double size;

  TileRadioModel({
    required this.marginRadio,
    required this.paddingRadio,
    required this.color,
    required this.size,
  });

  static TileRadioModel initial() {
    return TileRadioModel(
      marginRadio: const EdgeInsets.all(5),
      paddingRadio: EdgeInsets.zero,
      color: const Color(0xffA6B0B9),
      size: 30,
    );
  }

  static TileRadioModel selected() {
    return TileRadioModel(
      marginRadio: const EdgeInsets.all(2),
      paddingRadio: const EdgeInsets.all(8),
      color: const Color(0xffFC7404),
      size: 20,
    );
  }
}
