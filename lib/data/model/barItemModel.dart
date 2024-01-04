import 'package:flutter/material.dart';

class BarItemModel {
  final String? name;
  final String? buttonName;
  final IconData? icon;
  BarItemModel({
    this.name,
    this.buttonName,
    this.icon,
  });
}

List<BarItemModel> barItemModel = [
  BarItemModel(
      name: "DISPLAY", buttonName: "Benchmarks", icon: Icons.speed_outlined),
  BarItemModel(name: "HARDWARE", buttonName: null, icon: null),
  BarItemModel(
      name: "BATTERY", buttonName: "Benchmarks", icon: Icons.speed_outlined),
  BarItemModel(name: "CAMERA", buttonName: null, icon: null),
  BarItemModel(name: "DESIGN", buttonName: "Size Comparision", icon: null),
  BarItemModel(name: "CELLULAR", buttonName: null, icon: null),
  BarItemModel(name: "MULTIMEDIA", buttonName: null, icon: null),
  BarItemModel(name: "CONNECTIVITY & FEATURES", buttonName: null, icon: null),
  BarItemModel(name: "BUYERS INFORMATION", buttonName: null, icon: null),
  BarItemModel(name: "AVAILABILITY", buttonName: null, icon: null),
];
