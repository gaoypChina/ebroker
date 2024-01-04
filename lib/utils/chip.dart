import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ChipScreen extends StatefulWidget {
  const ChipScreen({super.key});

  @override
  State<ChipScreen> createState() => _ChipScreenState();
}

int selectedIndex = 0;

class _ChipScreenState extends State<ChipScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 0.8,
                  child: mobileAttributes(Icons.calendar_month_outlined,
                      "Released", "Sep 22, 2023", 0)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.1,
                  child: mobileAttributes(
                      Icons.computer, "Hardware", "A16 Bionic 6GB RAM", 1)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.7,
                  child: mobileAttributes(
                      Icons.screenshot_monitor_rounded,
                      "Display",
                      "6.1 inches  2556 x 1179 pixels\n60Hz Refresh rate",
                      2)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: mobileAttributes(
                      Icons.storage, "Storage", "128GB, not expandable", 3)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: mobileAttributes(
                      Icons.battery_full, "Battery", "3349 mAh", 4)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.5,
                  child: mobileAttributes(Icons.camera, "Camera",
                      "48 MP (Dual camera)\n12 MP front", 5)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 0.9,
                  child: mobileAttributes(
                      Icons.phone_iphone, "OS", "iOS 17.x", 6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget mobileAttributes(
      IconData? icon, String? name, String? description, int? index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index ?? 0;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            border: Border.all(
                width: 1.5,
                color: selectedIndex == index
                    ? Colors.blue
                    : Colors.grey.shade400)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      "$name",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                        child: Text(
                      "$description",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
