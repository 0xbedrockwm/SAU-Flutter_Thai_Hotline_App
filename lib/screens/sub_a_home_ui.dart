import 'package:flutter/material.dart';
import '../widget/hotline_widgets.dart';

class SubAHomeUI extends StatefulWidget {
  final int currentTabIndex;
  final ValueChanged<int> onTabChanged;

  const SubAHomeUI({
    super.key,
    required this.currentTabIndex,
    required this.onTabChanged,
  });

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  static const List<HotlineItem> _items = [
    HotlineItem(
        name: 'ข้อมูลจราจร',
        number: '1197',
        imagePath: 'assets/images/sub_a/traffic_info.png'),
    HotlineItem(
        name: 'ตำรวจทางหลวง',
        number: '1193',
        imagePath: 'assets/images/sub_a/highway_police.png'),
    HotlineItem(
        name: 'ตำรวจท่องเที่ยว',
        number: '1155',
        imagePath: 'assets/images/sub_a/tourist_police.png'),
    HotlineItem(
        name: 'เส้นทางบนทางด่วน',
        number: '1543',
        imagePath: 'assets/images/sub_a/expressway.png'),
    HotlineItem(
        name: 'ขสมก.',
        number: 'XXXX-XXXX',
        imagePath: 'assets/images/sub_a/bmta.png'),
    HotlineItem(
        name: 'บขส.',
        number: 'XXXX-XXXX',
        imagePath: 'assets/images/sub_a/bus.png'),
    HotlineItem(
        name: 'รถไฟ',
        number: 'XXXX-XXXX',
        imagePath: 'assets/images/sub_a/train.png'),
    HotlineItem(
        name: 'สนามบิน',
        number: 'XXXX-XXXX',
        imagePath: 'assets/images/sub_a/airport.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nการเดินทาง',
      items: _items,
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
