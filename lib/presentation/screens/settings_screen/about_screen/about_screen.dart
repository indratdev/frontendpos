import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/app_colors.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Kami"),
        centerTitle: true,
        backgroundColor: context.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.info_outline, size: 80, color: Colors.blueAccent),
                  SizedBox(height: 10),
                  Text(
                    "Aplikasi POS",
                    style: TextStyle(fontSize: AppTextSizes.extraLarge(context), fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Versi 1.0.0",
                    style: TextStyle(fontSize: AppTextSizes.medium(context), color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Tentang Aplikasi",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              "Aplikasi POS ini dirancang untuk membantu bisnis kecil dan menengah dalam mengelola transaksi penjualan dengan mudah dan efisien.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: AppTextSizes.medium(context)),
            ),
            SizedBox(height: 20),
            Text(
              "Visi dan Misi",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              "Kami berkomitmen untuk memberikan solusi teknologi terbaik agar bisnis Anda berkembang lebih cepat dan lebih baik.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: AppTextSizes.medium(context)),
            ),
            SizedBox(height: 20),
            Text(
              "Kontak Kami",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blueAccent),
              title: Text("Email: support@example.com"),
            ),
            ListTile(
              leading: Icon(Icons.web, color: Colors.blueAccent),
              title: Text("Website: www.example.com"),
            ),
            ListTile(
              leading: Icon(Icons.facebook, color: Colors.blueAccent),
              title: Text("Facebook: @AplikasiPOS"),
            ),
            // Expanded(child: Container()),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () => Navigator.pop(context),
            //     child: Text("Kembali"),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
