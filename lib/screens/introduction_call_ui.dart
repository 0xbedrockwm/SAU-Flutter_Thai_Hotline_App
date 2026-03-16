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
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFF6B35), Color(0xFFE91E8C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          path,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.phone_in_talk,
            size: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF6B35), Color(0xFFE91E8C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: [
          PageViewModel(
            titleWidget: const Text(
              'สายด่วน THAILAND',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            bodyWidget: const Text(
              'แอปพลิเคชันรวมสายด่วนฉุกเฉินของประเทศไทย\nครบครันในที่เดียว',
              style: TextStyle(fontSize: 15, color: Colors.white70),
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
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            bodyWidget: const Text(
              'รวมเบอร์โทรฉุกเฉินด้านการเดินทาง\nตำรวจ ทางหลวง และอื่นๆ',
              style: TextStyle(fontSize: 15, color: Colors.white70),
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
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            bodyWidget: const Text(
              'เบอร์โทรอุบัติเหตุและเหตุฉุกเฉิน\nพร้อมให้บริการตลอด 24 ชั่วโมง',
              style: TextStyle(fontSize: 15, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            image: _buildImage('assets/images/intro.png'),
          ),
        ],
        onDone: _onDone,
        onSkip: _onDone,
        showSkipButton: true,
        skip: const Text('Skip',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        next: const Icon(Icons.arrow_forward, color: Colors.white),
        done: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            'GET STARTED',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFFE91E8C),
              letterSpacing: 1.2,
            ),
          ),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(8, 8),
          color: Colors.white38,
          activeColor: Colors.white,
          activeSize: Size(22, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
    );
  }
}
