// ignore_for_file: unused_field

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
        name: 'กรมทางหลวงชนบท',
        number: '1146',
        imagePath: 'assets/images/sub_a/1146.png'),
    HotlineItem(
        name: 'ตำรวจท่องเที่ยว',
        number: '1155',
        imagePath: 'assets/images/sub_a/1155.png'),
    HotlineItem(
        name: 'ตำรวจทางหลวง',
        number: '1193',
        imagePath: 'assets/images/sub_a/1193.png'),
    HotlineItem(
        name: 'ข้อมูลจราจร',
        number: '1197',
        imagePath: 'assets/images/sub_a/1197.png'),
    HotlineItem(
        name: 'ขสมก.',
        number: '1348',
        imagePath: 'assets/images/sub_a/1348.png'),
    HotlineItem(
        name: 'บขส.',
        number: '1490',
        imagePath: 'assets/images/sub_a/1490.png'),
    HotlineItem(
        name: 'เส้นทางบนทางด่วน',
        number: '1543',
        imagePath: 'assets/images/sub_a/1543.png'),
    HotlineItem(
        name: 'กรมทางหลวง',
        number: '1586',
        imagePath: 'assets/images/sub_a/1586.png'),
    HotlineItem(
        name: 'การรถไฟแห่งประเทศไทย',
        number: '1690',
        imagePath: 'assets/images/sub_a/1690.png'),
    HotlineItem(
        name: 'การบินไทย',
        number: '023561111',
        imagePath: 'assets/images/sub_a/023561111.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nการเดินทาง',
      items: _items,
      bannerPath: 'assets/images/sub_a/banner.png',
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
