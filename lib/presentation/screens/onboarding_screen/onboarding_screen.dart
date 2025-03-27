import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/screens/auth_screen/login_option_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/utils/export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding_01.jpg",
      "title": "Selamat Datang",
      "description":
          "Aplikasi ini akan membantu Anda mengelola pekerjaan dengan lebih efisien.",
    },
    {
      "image": "assets/images/onboarding_01.jpg",
      "title": "Fitur Canggih",
      "description": "Nikmati fitur canggih yang memudahkan tugas harian Anda.",
    },
    {
      "image": "assets/images/onboarding_01.jpg",
      "title": "Mulai Sekarang!",
      "description": "Mari mulai petualangan Anda bersama aplikasi kami!",
    },
  ];

  void _finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginOptionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height /
                            1.4, // Ubah ukuran gambar
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(_onboardingData[index]["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _onboardingData[index]["title"]!,
                      style: TextStyle(
                        fontSize: AppTextSizes.extraLarge(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: AppTextSizes.medium(context)),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? context.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    "Lewati",
                    style: TextStyle(
                      color: context.orange,
                      fontSize: AppTextSizes.medium(context),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      _finishOnboarding();
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Mulai"
                        : "Lanjut",
                    style: TextStyle(
                      color: context.blueDeep,
                      fontSize: AppTextSizes.medium(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
