import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool hasSeenOnboarding = prefs.getBool('seenOnboarding') ?? false;

//   runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
// }

// class MyApp extends StatelessWidget {
//   final bool hasSeenOnboarding;

//   const MyApp({Key? key, required this.hasSeenOnboarding}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: hasSeenOnboarding ? HomeScreen() : OnboardingScreen(),
//     );
//   }
// }

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/slide1.png",
      "title": "Selamat Datang",
      "description": "Aplikasi ini akan membantu Anda mengelola pekerjaan dengan lebih efisien.",
    },
    {
      "image": "assets/slide2.png",
      "title": "Fitur Canggih",
      "description": "Nikmati fitur canggih yang memudahkan tugas harian Anda.",
    },
    {
      "image": "assets/slide3.png",
      "title": "Mulai Sekarang!",
      "description": "Mari mulai petualangan Anda bersama aplikasi kami!",
    },
  ];

  void _finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(_onboardingData[index]["image"]!, height: 250),
                    SizedBox(height: 20),
                    Text(
                      _onboardingData[index]["title"]!,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Indikator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 12 : 8,
                height: _currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Tombol navigasi
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _finishOnboarding,
                  child: Text("Lewati", style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      _finishOnboarding();
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(_currentIndex == _onboardingData.length - 1 ? "Mulai" : "Lanjut"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Selamat datang di aplikasi!")),
    );
  }
}
