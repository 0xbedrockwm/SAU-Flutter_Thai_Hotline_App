// ignore_for_file: unused_import

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

  void _onTabChanged(int index) {
    setState(() => _currentIndex = index);
  }

  Widget get _currentPage {
    switch (_currentIndex) {
      case 0:
        return SubAHomeUI(
            currentTabIndex: _currentIndex, onTabChanged: _onTabChanged);
      case 1:
        return SubBHomeUI(
            currentTabIndex: _currentIndex, onTabChanged: _onTabChanged);
      case 2:
        return SubCHomeUI(
            currentTabIndex: _currentIndex, onTabChanged: _onTabChanged);
      case 3:
        return SubDHomeUI(
            currentTabIndex: _currentIndex, onTabChanged: _onTabChanged);
      default:
        return SubAHomeUI(
            currentTabIndex: _currentIndex, onTabChanged: _onTabChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _currentPage;
  }
}
