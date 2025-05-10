import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/app_colors.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bantuan & Layanan"),
        centerTitle: true,
        backgroundColor: context.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pertanyaan Umum (FAQ)",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text("Bagaimana cara membuat akun?"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Anda dapat membuat akun dengan mendaftar menggunakan email atau nomor telepon."),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Bagaimana cara menghubungi layanan pelanggan?"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Anda bisa menghubungi kami melalui email support@example.com atau WhatsApp."),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Bagaimana cara mereset password saya?"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Anda bisa mereset password melalui halaman login dengan memilih 'Lupa Password'."),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Hubungi Kami",
              style: TextStyle(fontSize: AppTextSizes.large(context), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email, color: context.blue),
              title: Text("Email: support@example.com"),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: context.blue),
              title: Text("Telepon: +62 812-3456-7890"),
            ),
            ListTile(
              leading: Icon(Icons.chat, color: context.blue),
              title: Text("WhatsApp: +62 812-3456-7890"),
            ),
            // Expanded(child: Container()),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text("Hubungi Layanan Bantuan"),
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
