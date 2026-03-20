import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool _isSOSPressed = false;

  static const List<HotlineItem> _items = [
    HotlineItem(
        name: 'ศูนย์ปลอดภัยคมนาคม',
        number: '1356',
        imagePath: 'assets/images/sub_b/safety_center.png'),
    HotlineItem(
        name: 'หน่วยแพทย์กู้ชีพ',
        number: '1554',
        imagePath: 'assets/images/sub_b/medical.png'),
    HotlineItem(
        name: 'ศูนย์เอราวัณ',
        number: '1646',
        imagePath: 'assets/images/sub_b/erawan.png'),
    HotlineItem(
        name: 'เจ็บป่วยฉุกเฉิน',
        number: '1669',
        imagePath: 'assets/images/sub_b/1669.png'),
    HotlineItem(
        name: 'ดับเพลิง',
        number: '199',
        imagePath: 'assets/images/sub_b/fire.png'),
    HotlineItem(
        name: 'แจ้งอัคคีภัย',
        number: '199',
        imagePath: 'assets/images/sub_b/fire.png'),
  ];

  Future<void> _callSOS() async {
    final Uri uri = Uri(scheme: 'tel', path: '191');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SubPageBase(
      title: 'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
      items: _items,
      bannerPath: 'assets/images/sub_b/banner.png',
      currentTabIndex: widget.currentTabIndex,
      onTabChanged: widget.onTabChanged,
      headerWidget: _buildSOSButton(),
    );
  }

  Widget _buildSOSButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'คุณกำลังประสบเหตุ ฉุกเฉินอยู่หรือไม่ ??',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'กดปุ่มด้านล่างเพื่อโทรแจ้งเหตุด่วน',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // SOS Button with ripple effect
          GestureDetector(
            onTapDown: (_) => setState(() => _isSOSPressed = true),
            onTapUp: (_) {
              setState(() => _isSOSPressed = false);
              _callSOS();
            },
            onTapCancel: () => setState(() => _isSOSPressed = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _isSOSPressed ? 90 : 100,
              height: _isSOSPressed ? 90 : 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE53935),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE53935)
                        .withOpacity(_isSOSPressed ? 0.5 : 0.3),
                    blurRadius: _isSOSPressed ? 30 : 20,
                    spreadRadius: _isSOSPressed ? 12 : 8,
                  ),
                  BoxShadow(
                    color: const Color(0xFFE53935).withOpacity(0.15),
                    blurRadius: _isSOSPressed ? 50 : 40,
                    spreadRadius: _isSOSPressed ? 20 : 16,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'โทร 191',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFE53935),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
