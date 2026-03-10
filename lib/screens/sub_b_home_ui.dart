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
    HotlineItem(
        name: 'เหตุด่วนเหตุร้าย',
        number: '191',
        imagePath: 'assets/images/sub_b/emergency.png'),
    HotlineItem(
        name: 'แจ้งไฟไหม สัตว์เข้าบ้าน',
        number: '199',
        imagePath: 'assets/images/sub_b/safety_center.png'),
    HotlineItem(
        name: 'สายด่วนรถหาย(ตำรวจแห่งชาติ)',
        number: '1192',
        imagePath: 'assets/images/sub_b/medical.png'),
    HotlineItem(
        name: 'อุบัติเหตุทางน้ำ',
        number: '1196',
        imagePath: 'assets/images/sub_b/erawan.png'),
    HotlineItem(
        name: 'แจ้งคนหาย',
        number: '1300',
        imagePath: 'assets/images/sub_b/ambulance.png'),
    HotlineItem(
        name: 'ศูนย์ปลอดภัยคมนาคม',
        number: '1356',
        imagePath: 'assets/images/sub_b/rescue.png'),
    HotlineItem(
        name: 'หน่วยแพทย์กู้ชีพ',
        number: '1554',
        imagePath: 'assets/images/sub_b/fire.png'),
    HotlineItem(
        name: 'ศูนย์เอราวัณ',
        number: '1649',
        imagePath: 'assets/images/sub_b/fire_alert.png'),
    HotlineItem(
        name: 'เจ็บป่วยฉุกเฉิน',
        number: '1669',
        imagePath: 'assets/images/sub_b/fire_alert.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
        title: 'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
        items: _items,
        bannerPath: 'assets/images/sub_b/banner.png',
        currentTabIndex: widget.currentTabIndex,
        onTabChanged: widget.onTabChanged);
  }
}
