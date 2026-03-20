import 'package:flutter/material.dart';
import '../widget/hotline_widgets.dart';

class SubCHomeUI extends StatefulWidget {
  final int currentTabIndex;
  final ValueChanged<int> onTabChanged;

  const SubCHomeUI({
    super.key,
    required this.currentTabIndex,
    required this.onTabChanged,
  });

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  static const List<HotlineItem> _items = [
    HotlineItem(
        name: 'ธนาคารกรุงไทย',
        number: '0-2111-1111',
        imagePath: 'assets/images/sub_c/ktb.png'),
    HotlineItem(
        name: 'ธนาคารกรุงเทพ',
        number: '1333',
        imagePath: 'assets/images/sub_c/bbl.png'),
    HotlineItem(
        name: 'ธนาคารกรุงศรีอยุธยา',
        number: '1572',
        imagePath: 'assets/images/sub_c/bay.png'),
    HotlineItem(
        name: 'ธนาคารกสิกรไทย',
        number: '0-2888-8888',
        imagePath: 'assets/images/sub_c/kbank.png'),
    HotlineItem(
        name: 'ธนาคารไทยพาณิชย์',
        number: '02 777 7777',
        imagePath: 'assets/images/sub_c/scb.png'),
    HotlineItem(
        name: 'ธนาคารออมสิน',
        number: '02 299 8000',
        imagePath: 'assets/images/sub_c/gsb.png'),
    HotlineItem(
        name: 'ธนาคาร UOB',
        number: '02 285 1555',
        imagePath: 'assets/images/sub_c/uob.png'),
    HotlineItem(
        name: 'ธนาคาร LH Bank',
        number: '1327',
        imagePath: 'assets/images/sub_c/lhbank.png'),
    HotlineItem(
        name: 'ธนาคาร Citi Bank',
        number: '1877 248 4237',
        imagePath: 'assets/images/sub_c/citibank.png'),
    HotlineItem(
        name: 'ธนาคาร TTB Bank',
        number: '1428',
        imagePath: 'assets/images/sub_c/ttb.png'),
    HotlineItem(
        name: 'ธนาคาร CIMB Bank',
        number: '1428',
        imagePath: 'assets/images/sub_c/cimb.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nธนาคาร',
      items: _items,
      bannerPath: 'assets/images/sub_c/banner.png',
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
