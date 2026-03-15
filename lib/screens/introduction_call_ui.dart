import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_ui.dart';

class IntroductionCallUI extends StatefulWidget {
  const IntroductionCallUI({super.key});

  @override
  State<IntroductionCallUI> createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  void _onDone() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeUI()),
    );
  }

  Widget _buildImage(String path) {
    return Center(
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF2D7D6F).withOpacity(0.15),
        ),
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          path,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.phone_in_talk,
            size: 80,
            color: Color(0xFF2D7D6F),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          titleWidget: const Text(
            'สายด่วน THAILAND',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D7D6F),
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: const Text(
            'แอปพลิเคชันรวมสายด่วนฉุกเฉินของประเทศไทย\nครบครันในที่เดียว',
            style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
            textAlign: TextAlign.center,
          ),
          image: _buildImage('assets/images/label_app.png'),
        ),
        PageViewModel(
          titleWidget: const Text(
            'สายด่วนการเดินทาง',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D7D6F),
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: const Text(
            'รวมเบอร์โทรฉุกเฉินด้านการเดินทาง\nตำรวจ ทางหลวง และอื่นๆ',
            style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
            textAlign: TextAlign.center,
          ),
          image: _buildImage('assets/images/intro.png'),
        ),
        PageViewModel(
          titleWidget: const Text(
            'สายด่วนฉุกเฉิน',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D7D6F),
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: const Text(
            'เบอร์โทรอุบัติเหตุและเหตุฉุกเฉิน\nพร้อมให้บริการตลอด 24 ชั่วโมง',
            style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
            textAlign: TextAlign.center,
          ),
          image: _buildImage('assets/images/intro.png'),
        ),
      ],
      onDone: _onDone,
      onSkip: _onDone,
      showSkipButton: true,
      skip: const Text('ข้าม',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2D7D6F))),
      next: const Icon(Icons.arrow_forward, color: Color(0xFF2D7D6F)),
      done: const Text('เริ่มต้น',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2D7D6F))),
      dotsDecorator: const DotsDecorator(
        size: Size(8, 8),
        color: Color(0xFFCCCCCC),
        activeColor: Color(0xFF2D7D6F),
        activeSize: Size(22, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
