import 'package:ebroker/data/model/barItemModel.dart';
import 'package:ebroker/utils/chip.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class detailCardScreen extends StatefulWidget {
  const detailCardScreen({super.key});

  @override
  State<detailCardScreen> createState() => _detailCardScreenState();
}

class _detailCardScreenState extends State<detailCardScreen> {
  final ScrollController outerController = ScrollController();
  final ScrollController innerController = ScrollController();

  double get innerHeaderHeight =>
      50.0; // Replace with your actual header height

  @override
  void initState() {
    super.initState();
    outerController.addListener(() {
      if (outerController.position.pixels >=
          outerController.position.maxScrollExtent) {
        double offset = MediaQuery.of(context).size.height - innerHeaderHeight;
        innerController.jumpTo(offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StickyHeader(
            header: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.label_important,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "SPECIFICATION",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ChipScreen(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StickyHeader(
              header: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "DESCRIPTION & PROS",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              content: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Text(
                      "The IPhone 15 comes with 6.1-inch OLED display and Apple Bionic 16 processor. On the Back there is a dual camera setup with 48MP main camera and 12MP Ultra-wide sensor.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  ListTile(
                    leading: MyBullet(),
                    title: Text(
                      '5G ready',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  ListTile(
                    leading: MyBullet(),
                    title: Text(
                      'High screen-to-body ratio (86.38 %)',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StickyHeader(
                  header: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.blue.shade600,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SPEC",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.black,
                                  )),
                              width: width * 0.3,
                              height: height * 0.04,
                              child: Center(
                                  child: Text(
                                "Compare",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: false,
                        reverse: false,
                        controller: innerController,
                        itemCount: barItemModel.length,
                        itemBuilder: (context, index) {
                          BarItemModel currentItem = barItemModel[index];
                          return StickyHeader(
                            header: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildBarItem('${currentItem.name}',
                                    currentItem.buttonName, currentItem.icon),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                            content: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    buildSpecItemsForName(currentItem.name!),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  List<Widget> buildSpecItemsForName(String name) {
    switch (name) {
      case 'DISPLAY':
        return [
          buildSpecItem('Size', '6.1 inches', 0),
          buildSpecItem(
              'Resolution', '2556 x 1179 pixels, 19.5:9 ratio, 461 PPI', 1),
          buildSpecItem('Technology', 'OLED', 2),
          buildSpecItem('Refresh rate', '60Hz', 3),
          buildSpecItem('Screen-to-body', '86.38%', 4),
          buildSpecItem('Peak brightness', '2000 cd/m² (nit)', 5),
          buildSpecItem(
              'Features',
              'Super Retina XDR, HDR support, Oleophobic coating, Scratch-resistant glass (Ceramic Shield), Ambient light sensor, Proximity sensor',
              6),
        ];
      case 'HARDWARE':
        return [
          buildSpecItem('System chip', 'A16 Bionic (4 nm)', 0),
          buildSpecItem('Processor', 'Hexa-core', 1),
          buildSpecItem('GPU:', 'Apple GPU 5-core', 2),
          buildSpecItem('RAM', '6GB LPDDR5', 3),
          buildSpecItem('Internal storage', '128GB, not expandable', 4),
          buildSpecItem('Device type', 'Smartphone', 5),
          buildSpecItem('OS', 'iOS (17.x)', 6),
        ];
      case 'BATTERY':
        return [
          buildSpecItem('Capacity', '3349 mAh', 0),
          buildSpecItem('Type', 'Not user replaceable', 1),
          buildSpecItem(
              'Charging:', 'Fast charging, MagSafe wireless charging', 2),
          buildSpecItem('Max charge speed', 'Wireless: 15.0W', 3),
        ];
      case 'CAMERA':
        return [
          buildSpecItem('Rear', 'Dual camera', 0),
          buildSpecItem('Main camera', '48 MP (Sensor-shift OIS)', 1),
          buildSpecItem(
              'Specifications',
              'Aperture size: F1.6; Focal length: 26 mm; Pixel size: 2.0 μm',
              2),
          buildSpecItem('Second camera', '12 MP (Ultra-wide)', 3),
          buildSpecItem(
              'Specifications', 'Aperture size: F2.4; Focal Length: 13 mm', 4),
          buildSpecItem('Video recording',
              '3840x2160 (4K UHD) (60 fps), 1920x1080 (Full HD) (240 fps)', 5),
          buildSpecItem('Front', '12 MP (Time-of-Flight (ToF))', 6),
          buildSpecItem('Video capture', '3840x2160 (4K UHD) (60 fps)', 7),
        ];
      case 'DESIGN':
        return [
          buildSpecItem(
              'Dimensions',
              '5.81 x 2.82 x 0.31 inches (147.6 x 71.6 x 7.8 mm), thickness with camera 0.45 inches (11.33 mm)',
              1),
          buildSpecItem('Weight', '6.03 oz (171.0 g)', 2),
          buildSpecItem('Materials', 'Back: Glass; Frame: Aluminum', 3),
          buildSpecItem('Resistance', 'Yes; IP68', 4),
          buildSpecItem('Biometrics', '3D Face unlock', 5),
          buildSpecItem(
              'Keys', 'Left: Volume control, Other; Right: Lock/Unlock key', 6),
          buildSpecItem('Colors', 'Black, Blue, Green, Yellow, Pink', 7),
        ];
      case 'CELLULAR':
        return [
          buildSpecItem(
              '5G',
              'n1, n2, n3, n5, n7, n8, n12, n14, n20, n25, n28, n29, n30, n38, n40, n41, n48, n66, n70, n71, n77, n78, n258, n260, n261, SA, NSA, mmWave, 5G Ready',
              0),
          buildSpecItem(
              '4G (FDD)',
              'Bands 1(2100), 2(1900), 3(1800), 4(AWS-1), 5(850), 7(2600), 8(900), 12(700 a), 13(700 c), 14(700 PS), 17(700 b), 18(800 Lower), 19(800 Upper), 20(800 DD), 25(1900+), 26(850+), 28(700 APT), 29(700 d), 30(2300 WCS), 32(1500 L-band), 66(AWS-3), 71(600)',
              1),
          buildSpecItem(
              '4G (TDD)',
              'Bands 34(2000), 38(2600), 39(1900+), 40(2300), 41(2600+), 42(3500), 46, 48(3600)',
              2),
          buildSpecItem(
              '3G', 'Bands 1(2100), 2(1900), 4(1700/2100), 5(850), 8(900)', 3),
          buildSpecItem('Data Speed', 'LTE-A, HSDPA+ (4G) 42.2 Mbit/s', 4),
          buildSpecItem('SIM type', 'eSIM', 5)
        ];
      case 'MULTIMEDIA':
        return [
          buildSpecItem('Headphones', 'No 3.5mm jack', 0),
          buildSpecItem('Speakers', 'Earpiece, Loudspeaker', 1),
          buildSpecItem('Screen mirroring', 'Wireless screen share', 2),
          buildSpecItem('Additional microphone(s)', 'for Noise cancellation', 3)
        ];
      case 'CONNECTIVITY & FEATURES':
        return [
          buildSpecItem('Bluetooth', '5.3', 0),
          buildSpecItem(
              'Wi-Fi',
              '802.11 a, b, g, n, ac, ax (Wi-Fi 6), Wi-Fi 6E; Wi-Fi Direct, Hotspot',
              1),
          buildSpecItem('USB', 'Type-C (reversible), USB 2.0', 2),
          buildSpecItem('Features', 'Charging', 3),
          buildSpecItem(
              'Location',
              'GPS, A-GPS, Glonass, Galileo, BeiDou, QZSS, Cell ID, Wi-Fi positioning',
              4),
          buildSpecItem(
              'Sensors', 'Accelerometer, Gyroscope, Compass, Barometer', 5),
          buildSpecItem('Other', 'NFC, Ultra Wideband (UWB)', 6),
          buildSpecItem('Hearing aid compatible', 'M3, T4', 7)
        ];
      case 'BUYERS INFORMATION':
        return [
          buildSpecItem('Price', '\$ 799', 0),
        ];
      case 'AVAILABILITY':
        return [
          buildSpecItem('Officially announced', 'Sep 12, 2023', 0),
        ];
      default:
        return [];
    }
  }

  Widget buildBarItem(String name, String? buttonName, IconData? icon) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Spacer(),
            if (buttonName != null)
              GestureDetector(
                onTap: () {
                  print('Button clicked');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          buttonName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        if (icon != null)
                          Icon(
                            icon,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecItem(String label, String value, int index) {
    final isEvenRow = index % 2 == 0;
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: isEvenRow ? Colors.grey.shade100 : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0,
      width: 8.0,
      decoration: new BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}
