import 'package:flutter/material.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        SubAHomeUI(currentTabIndex: _currentIndex, onTabChanged: _onTabChanged),
        SubBHomeUI(currentTabIndex: _currentIndex, onTabChanged: _onTabChanged),
        SubCHomeUI(currentTabIndex: _currentIndex, onTabChanged: _onTabChanged),
        SubDHomeUI(currentTabIndex: _currentIndex, onTabChanged: _onTabChanged),
      ],
    );
  }
}
