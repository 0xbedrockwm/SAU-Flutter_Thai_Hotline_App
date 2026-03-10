import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/about_ui.dart';

const Color kPrimaryColor = Colors.lightBlueAccent;
const Color kNumberColor = Color(0xFFFF6600);

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

// ─── Shared AppBar ────────────────────────────────────────────────────────────

PreferredSizeWidget buildHotlineAppBar(
  BuildContext context, {
  VoidCallback? onInfoTap,
}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    centerTitle: true,
    leading: Navigator.canPop(context)
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    title: const Text(
      'สายด่วน THAILAND',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.info_sharp, color: Colors.black),
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: item.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.imagePath!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image,
                            size: 28, color: Colors.redAccent),
                      ),
                    )
                  : const Icon(Icons.image, size: 28, color: Colors.grey),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.number,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kNumberColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.phone_android_rounded,
                  color: Colors.black54),
              onPressed: () => _makeCall(item.number),
            ),
          ],
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
    'อุบัติเหตุ-เหตุฉุกเฉิน',
    'ธนาคาร',
    'สาธารณูปโภค',
  ];

  static const List<IconData> _tabIcons = [
    Icons.directions_car,
    Icons.local_hospital,
    Icons.account_balance,
    Icons.electrical_services,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: buildHotlineAppBar(
        context,
        onInfoTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AboutUI()));
        },
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: bannerPath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      bannerPath!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image,
                          size: 48, color: Colors.brown),
                    ),
                  )
                : const Icon(Icons.image, size: 48, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
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
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 10,
        unselectedFontSize: 10,
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
