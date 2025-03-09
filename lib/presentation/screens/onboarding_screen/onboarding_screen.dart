import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/export.dart';

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
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_onboardingData[index]["image"]!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      height: MediaQuery.sizeOf(context).height / 1.8,
                      margin: AppSpacing.bottomSpacing(context),
                    ),
                    Text(
                      _onboardingData[index]["title"]!,
                      style: TextStyle(
                          fontSize: AppTextSizes.extraLarge(context),
                          fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: AppTextSizes.medium(context)),
                      ),
                    ),
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
                width: _currentIndex == index
                    ? 16
                    : 8, // Lebar lebih besar untuk oval
                height: 8, // Tinggi tetap
                decoration: BoxDecoration(
                  color: _currentIndex == index ? context.blue : Colors.grey,
                  borderRadius:
                      BorderRadius.circular(8), // Membuat sudut melengkung
                ),
              ),
            ),
          ),
          // SizedBox(height: 20),

          // Tombol navigasi
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _finishOnboarding,
                  child: Text("Lewati",
                      style: TextStyle(
                          color: context.orange,
                          fontSize: AppTextSizes.medium(context))),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      _finishOnboarding();
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Mulai"
                        : "Lanjut",
                    style: TextStyle(
                        color: context.blueDeep,
                        fontSize: AppTextSizes.medium(context)),
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
