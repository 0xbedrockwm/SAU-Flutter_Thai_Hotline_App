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
    HotlineItem(name: 'ข้อมูลจราจร', number: '1197'),
    HotlineItem(name: 'ตำรวจทางหลวง', number: '1193'),
    HotlineItem(name: 'ตำรวจท่องเที่ยว', number: '1155'),
    HotlineItem(name: 'เส้นทางบนทางด่วน', number: '1543'),
    HotlineItem(name: 'ขสมก.', number: 'XXXX-XXXX'),
    HotlineItem(name: 'บขส.', number: 'XXXX-XXXX'),
    HotlineItem(name: 'รถไฟ', number: 'XXXX-XXXX'),
    HotlineItem(name: 'สนามบิน', number: 'XXXX-XXXX'),
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
