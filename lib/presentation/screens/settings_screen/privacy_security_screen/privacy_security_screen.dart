import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/export.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privasi & Keamanan'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian 1: Pengenalan
              _buildSectionTitle(context, "Pengenalan"),
              _buildSectionContent(
                "Kami berkomitmen untuk menjaga privasi dan keamanan data Anda. "
                "Halaman ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda.",
              ),

              // Bagian 2: Pengumpulan Data
              _buildSectionTitle(context, "Pengumpulan Data"),
              _buildSectionContent(
                "Kami mengumpulkan data sebagai bagian dari layanan yang kami berikan, meliputi:\n\n"
                "• **Informasi Akun**: Nama, email, nomor telepon yang Anda berikan saat mendaftar.\n"
                "• **Data Penggunaan**: Aktivitas dalam aplikasi, interaksi, dan preferensi pengguna.\n"
                "• **Data Lokasi** (jika diizinkan): Kami dapat mengakses lokasi perangkat untuk fitur tertentu.\n"
                "• **Data Perangkat**: Jenis perangkat, sistem operasi, dan pengaturan lainnya.",
              ),

              // Bagian 3: Penggunaan Data
              _buildSectionTitle(context, "Penggunaan Data"),
              _buildSectionContent(
                "Data yang kami kumpulkan digunakan untuk tujuan berikut:\n\n"
                "✔️ Memperbaiki dan mengembangkan fitur aplikasi\n"
                "✔️ Menyediakan layanan yang lebih baik bagi pengguna\n"
                "✔️ Menyediakan bantuan pelanggan dan dukungan teknis\n"
                "✔️ Mencegah penyalahgunaan atau aktivitas yang melanggar kebijakan\n"
                "✔️ Menampilkan iklan yang relevan (jika ada)",
              ),

              // Bagian 4: Keamanan Data
              _buildSectionTitle(context, "Keamanan Data"),
              _buildSectionContent(
                "Kami menggunakan langkah-langkah keamanan berikut untuk melindungi data Anda:\n\n"
                "🔹 Enkripsi data saat dikirim melalui jaringan\n"
                "🔹 Sistem keamanan berlapis untuk mencegah akses yang tidak sah\n"
                "🔹 Penggunaan autentikasi PIN atau biometrik untuk melindungi akun\n"
                "🔹 Pemantauan terus-menerus terhadap aktivitas yang mencurigakan",
              ),

              // Bagian 5: Hak Pengguna
              _buildSectionTitle(context, "Hak Anda sebagai Pengguna"),
              _buildSectionContent(
                "Anda memiliki hak untuk:\n\n"
                "✅ Mengakses data pribadi Anda kapan saja\n"
                "✅ Memperbarui atau menghapus informasi pribadi\n"
                "✅ Membatalkan persetujuan untuk berbagi data dengan pihak ketiga\n"
                "✅ Mengajukan permintaan penghapusan akun melalui layanan pelanggan",
              ),

              // Bagian 6: Pihak Ketiga
              _buildSectionTitle(context, "Pihak Ketiga"),
              _buildSectionContent(
                "Kami tidak menjual atau membagikan data pribadi Anda kepada pihak ketiga tanpa izin eksplisit.\n\n"
                "Namun, kami dapat berbagi data dengan:\n"
                "• **Penyedia layanan teknologi** (seperti cloud storage)\n"
                "• **Layanan pembayaran** untuk memproses transaksi\n"
                "• **Otoritas hukum** jika diwajibkan oleh peraturan yang berlaku",
              ),

              // Bagian 7: Perubahan Kebijakan
              _buildSectionTitle(context, "Perubahan Kebijakan"),
              _buildSectionContent(
                "Kebijakan ini dapat diperbarui dari waktu ke waktu. "
                "Kami akan memberi tahu pengguna melalui email atau pemberitahuan dalam aplikasi jika ada perubahan penting.",
              ),

              // Bagian 8: Hubungi Kami
              _buildSectionTitle(context, "Hubungi Kami"),
              _buildSectionContent(
                "Jika Anda memiliki pertanyaan mengenai kebijakan ini, silakan hubungi kami melalui:\n\n"
                "📧 Email: support@example.com\n"
                "📞 Telepon: +62 812 3456 7890",
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat judul bagian
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: TextStyle(
              fontSize: AppTextSizes.large(context),
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  // Fungsi untuk membuat konten teks biasa
  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
