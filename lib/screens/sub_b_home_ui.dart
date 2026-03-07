import 'package:flutter/material.dart';
import '../widget/hotline_widgets.dart';

class SubBHomeUI extends StatefulWidget {
  final int currentTabIndex;
  final ValueChanged<int> onTabChanged;

  const SubBHomeUI({
    super.key,
    required this.currentTabIndex,
    required this.onTabChanged,
  });

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  static const List<HotlineItem> _items = [
    HotlineItem(name: 'เหตุด่วนเหตุร้าย', number: '191'),
    HotlineItem(name: 'ศูนย์ปลอดภัยคมนาคม', number: '1356'),
    HotlineItem(name: 'หน่วยแพทย์กู้ชีพ', number: '1554'),
    HotlineItem(name: 'ศูนย์เอราวัณ', number: '1646'),
    HotlineItem(name: 'เจ็บป่วยฉุกเฉิน', number: '1669'),
    HotlineItem(name: 'กู้ภัย', number: 'XXXX-XXXX'),
    HotlineItem(name: 'ดับเพลิง', number: '199'),
    HotlineItem(name: 'แจ้งอัคคีภัย', number: '199'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
      items: _items,
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
    );
  }
}
