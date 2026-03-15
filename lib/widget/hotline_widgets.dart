import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/about_ui.dart';

const Color kPrimary = Color(0xFF2D7D6F); // เขียว
const Color kPrimaryLight = Color(0xFFE8F5F3); // เขียวอ่อน
const Color kAccent = Color(0xFF4CAF93); // เขียวสด
const Color kTextDark = Color(0xFF1A1A2E); // ดำเข้ม
const Color kTextGrey = Color(0xFF888888); // เทา

// ─── Model ───────────────────────────────────────────────────────────────────

class HotlineItem {
  final String name;
  final String number;
  final String? imagePath;

  const HotlineItem({
    required this.name,
    required this.number,
    this.imagePath,
  });
}

// ─── AppBar ───────────────────────────────────────────────────────────────────

PreferredSizeWidget buildHotlineAppBar(
  BuildContext context, {
  VoidCallback? onInfoTap,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.5,
    shadowColor: Colors.black12,
    centerTitle: true,
    leading: Navigator.canPop(context)
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kTextDark),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    title: const Text(
      'สายด่วน THAILAND',
      style: TextStyle(
        color: kTextDark,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.info_outline, color: kPrimary),
        onPressed: onInfoTap ?? () {},
      ),
    ],
  );
}

// ─── Hotline List Tile ────────────────────────────────────────────────────────

class HotlineListTile extends StatelessWidget {
  final HotlineItem item;

  const HotlineListTile({super.key, required this.item});

  Future<void> _makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _makeCall(item.number),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: item.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      item.imagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.phone_in_talk,
                        size: 26,
                        color: kPrimary,
                      ),
                    ),
                  )
                : const Icon(Icons.phone_in_talk, size: 26, color: kPrimary),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kTextDark,
            ),
          ),
          subtitle: Text(
            item.number,
            style: const TextStyle(
              fontSize: 13,
              color: kPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.chevron_right, color: kPrimary, size: 20),
          ),
        ),
      ),
    );
  }
}

// ─── Sub Page Base ────────────────────────────────────────────────────────────

class SubPageBase extends StatelessWidget {
  final String title;
  final List<HotlineItem> items;
  final int currentTabIndex;
  final ValueChanged<int> onTabChanged;
  final String? bannerPath;

  const SubPageBase({
    super.key,
    required this.title,
    required this.items,
    required this.currentTabIndex,
    required this.onTabChanged,
    this.bannerPath,
  });

  static const List<String> _tabLabels = [
    'การเดินทาง',
    'ฉุกเฉิน',
    'ธนาคาร',
    'สาธารณูปโภค',
  ];

  static const List<IconData> _tabIcons = [
    Icons.directions_car_outlined,
    Icons.local_hospital_outlined,
    Icons.account_balance_outlined,
    Icons.electrical_services_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: buildHotlineAppBar(
        context,
        onInfoTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AboutUI()));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            width: double.infinity,
            height: 160,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimary,
              boxShadow: [
                BoxShadow(
                  color: kPrimary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: bannerPath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      bannerPath!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              title.replaceAll('\n', ' '),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextDark,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: items.length,
              itemBuilder: (_, i) => HotlineListTile(item: items[i]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: onTabChanged,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimary,
        unselectedItemColor: kTextGrey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 8,
        items: List.generate(
          4,
          (i) => BottomNavigationBarItem(
            icon: Icon(_tabIcons[i]),
            label: _tabLabels[i],
          ),
        ),
      ),
    );
  }
}
