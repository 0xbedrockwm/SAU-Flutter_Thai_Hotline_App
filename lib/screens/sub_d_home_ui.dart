import 'package:flutter/material.dart';
import '../widget/hotline_widgets.dart';

class SubDHomeUI extends StatefulWidget {
  final int currentTabIndex;
  final ValueChanged<int> onTabChanged;

  const SubDHomeUI({
    super.key,
    required this.currentTabIndex,
    required this.onTabChanged,
  });

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  static const List<HotlineItem> _items = [
    HotlineItem(name: 'การไฟฟ้านครหลวง', number: '0-2111-1111'),
    HotlineItem(name: 'การไฟฟ้าส่วนภูมิภาค', number: '1333'),
    HotlineItem(name: 'การไฟฟ้าฝ่ายผลิต', number: '1572'),
    HotlineItem(name: 'การประปานครหลวง', number: '0-2888-8888'),
    HotlineItem(name: 'การประปาส่วนภูมิภาค', number: 'XXXX-XXXX'),
    HotlineItem(name: 'True', number: '1242'),
    HotlineItem(name: 'DTAC (AIS)', number: '1678'),
    HotlineItem(name: 'TOT', number: '1100'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nสาธารณูปโภค',
      items: _items,
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
