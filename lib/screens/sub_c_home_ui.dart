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
    HotlineItem(name: 'ธนาคารกรุงไทย', number: '0-2111-1111'),
    HotlineItem(name: 'ธนาคารกรุงเทพ', number: '1333'),
    HotlineItem(name: 'ธนาคารกรุงศรีอยุธยา', number: '1572'),
    HotlineItem(name: 'ธนาคารกสิกรไทย', number: '0-2888-8888'),
    HotlineItem(name: 'ธนาคารไทยพาณิชย์', number: 'XXXX-XXXX'),
    HotlineItem(name: 'ธนาคารออมสิน', number: 'XXXX-XXXX'),
    HotlineItem(name: 'ธนาคาร UOB', number: 'XXXX-XXXX'),
    HotlineItem(name: 'ธนาคาร LH Bank', number: '1327'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nธนาคาร',
      items: _items,
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
