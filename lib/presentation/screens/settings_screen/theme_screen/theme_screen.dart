import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Load tema yang tersimpan di SharedPreferences
  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Simpan preferensi tema dan ubah tampilan
  void _toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Tema'),
        centerTitle: true,
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Tema",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            ListTile(
              title: Text("Mode Gelap"),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: _toggleTheme,
                activeColor: context.orange,
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Simpan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDarkMode ? Colors.grey[800] : Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: _isDarkMode ? context.black.withValues(alpha: .5) : Colors.white,
    );
  }
}
