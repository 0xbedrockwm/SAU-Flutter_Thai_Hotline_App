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
    HotlineItem(
        name: 'การไฟฟ้านครหลวง',
        number: '0-2111-1111',
        imagePath: 'assets/images/sub_d/mea.png'),
    HotlineItem(
        name: 'การไฟฟ้าส่วนภูมิภาค',
        number: '1333',
        imagePath: 'assets/images/sub_d/pea.png'),
    HotlineItem(
        name: 'การไฟฟ้าฝ่ายผลิต',
        number: '1572',
        imagePath: 'assets/images/sub_d/egat.png'),
    HotlineItem(
        name: 'การประปานครหลวง',
        number: '0-2888-8888',
        imagePath: 'assets/images/sub_d/mwa.png'),
    HotlineItem(
        name: 'การประปาส่วนภูมิภาค',
        number: 'XXXX-XXXX',
        imagePath: 'assets/images/sub_d/pwa.png'),
    HotlineItem(
        name: 'True',
        number: '1242',
        imagePath: 'assets/images/sub_d/true.png'),
    HotlineItem(
        name: 'DTAC (AIS)',
        number: '1678',
        imagePath: 'assets/images/sub_d/ais.png'),
    HotlineItem(
        name: 'TOT', number: '1100', imagePath: 'assets/images/sub_d/tot.png'),
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
