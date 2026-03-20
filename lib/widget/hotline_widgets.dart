import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/about_ui.dart';

const Color kPrimaryStart = Color.fromARGB(255, 107, 45, 22);
const Color kPrimaryEnd = Color.fromARGB(255, 71, 15, 46);
const Color kPrimary = Color.fromARGB(255, 68, 21, 47);
const Color kPrimaryLight = Color.fromARGB(255, 255, 246, 235);
const Color kAccentRed = Color.fromARGB(255, 201, 61, 58);
const Color kTextDark = Color.fromARGB(255, 49, 49, 77);
const Color kTextGrey = Color.fromARGB(255, 34, 28, 28);

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

// ─── Gradient AppBar ──────────────────────────────────────────────────────────

PreferredSizeWidget buildHotlineAppBar(
  BuildContext context, {
  VoidCallback? onInfoTap,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryStart, kPrimaryEnd],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: onInfoTap ?? () {},
          ),
        ],
      ),
    ),
  );
}

// ─── Hotline List Tile ────────────────────────────────────────────────────────

class HotlineListTile extends StatefulWidget {
  final HotlineItem item;

  const HotlineListTile({super.key, required this.item});

  @override
  State<HotlineListTile> createState() => _HotlineListTileState();
}

class _HotlineListTileState extends State<HotlineListTile> {
  bool _isPressed = false;

  Future<void> _makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () => _makeCall(widget.item.number),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: _isPressed ? kPrimaryLight : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isPressed ? kPrimary : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isPressed
                  ? kPrimary.withOpacity(0.15)
                  : Colors.black.withOpacity(0.06),
              blurRadius: _isPressed ? 16 : 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: _isPressed
                  ? const LinearGradient(
                      colors: [kPrimaryStart, kPrimaryEnd],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _isPressed ? null : kPrimaryLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: widget.item.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      widget.item.imagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.phone_in_talk,
                        size: 26,
                        color: _isPressed ? Colors.white : kPrimary,
                      ),
                    ),
                  )
                : Icon(
                    Icons.phone_in_talk,
                    size: 26,
                    color: _isPressed ? Colors.white : kPrimary,
                  ),
          ),
          title: Text(
            widget.item.name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _isPressed ? kPrimary : kTextDark,
            ),
          ),
          subtitle: Text(
            widget.item.number,
            style: TextStyle(
              fontSize: 13,
              color: _isPressed ? kPrimaryEnd : kPrimaryStart,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: _isPressed
                  ? const LinearGradient(
                      colors: [kPrimaryStart, kPrimaryEnd],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _isPressed ? null : kPrimaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.chevron_right,
              color: _isPressed ? Colors.white : kPrimary,
              size: 20,
            ),
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
  final Widget? headerWidget;

  const SubPageBase({
    super.key,
    required this.title,
    required this.items,
    required this.currentTabIndex,
    required this.onTabChanged,
    this.bannerPath,
    this.headerWidget,
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
      backgroundColor: const Color(0xFFF7F7F7),
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
          Container(
            width: double.infinity,
            height: 160,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [kPrimaryStart, kPrimaryEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryEnd.withOpacity(0.3),
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: items.length + (headerWidget != null ? 1 : 0),
              itemBuilder: (_, i) {
                if (headerWidget != null && i == 0) return headerWidget!;
                final item = items[headerWidget != null ? i - 1 : i];
                return HotlineListTile(item: item);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (i) {
                final bool selected = currentTabIndex == i;
                return GestureDetector(
                  onTap: () => onTabChanged(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      horizontal: selected ? 16 : 12,
                      vertical: selected ? 8 : 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: selected
                          ? const LinearGradient(
                              colors: [kPrimaryStart, kPrimaryEnd],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: kPrimaryEnd.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _tabIcons[i],
                          color: selected ? Colors.white : kTextGrey,
                          size: selected ? 28 : 22,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          _tabLabels[i],
                          style: TextStyle(
                            fontSize: selected ? 11 : 10,
                            fontWeight:
                                selected ? FontWeight.w700 : FontWeight.w400,
                            color: selected ? Colors.white : kTextGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
