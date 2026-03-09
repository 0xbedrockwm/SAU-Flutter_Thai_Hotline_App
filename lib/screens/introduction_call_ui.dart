import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'splash_screen_ui.dart';

class IntroductionCallUI extends StatefulWidget {
  const IntroductionCallUI({super.key});

  @override
  State<IntroductionCallUI> createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  void _onDone() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SplashScreenUI()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'สายด่วน THAILAND',
          body: 'แอปพลิเคชันรวมสายด่วนฉุกเฉินของประเทศไทย\nครบครันในที่เดียว',
          image: Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.redAccent[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.phone_in_talk,
                  size: 80, color: Colors.black),
            ),
          ),
        ),
        PageViewModel(
          title: 'สายด่วนการเดินทาง',
          body: 'รวมเบอร์โทรฉุกเฉินด้านการเดินทาง\nตำรวจ ทางหลวง และอื่นๆ',
          image: Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.directions_car,
                  size: 80, color: Colors.grey),
            ),
          ),
        ),
        PageViewModel(
          title: 'สายด่วนฉุกเฉิน',
          body:
              'เบอร์โทรอุบัติเหตุและเหตุฉุกเฉิน\nพร้อมให้บริการตลอด 24 ชั่วโมง',
          image: Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.local_hospital,
                  size: 80, color: Colors.grey),
            ),
          ),
        ),
      ],
      onDone: _onDone,
      onSkip: _onDone,
      showSkipButton: true,
      skip: const Text('ข้าม', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done:
          const Text('เริ่มต้น', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.transparent,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
