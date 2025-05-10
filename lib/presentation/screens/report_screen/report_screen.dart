import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> reports = [
      {'title': 'Laporan Pendapatan', 'icon': Icons.attach_money},
      {'title': 'Laporan Pengeluaran', 'icon': Icons.money_off},
      {'title': 'Laporan Transaksi', 'icon': Icons.receipt},
      {'title': 'Laporan Pelanggan', 'icon': Icons.people},
      {'title': 'Laporan Layanan', 'icon': Icons.car_repair},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan"),
        centerTitle: true,
        backgroundColor: context.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: reports.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(reports[index]['icon'], color: Colors.blue, size: Constants.iconSizeExtraSmall(context),),
                title: Text(reports[index]['title'],
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                trailing:  Icon(Icons.arrow_forward_ios, size: Constants.iconTrailing(context)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportDetailPage(
                        title: reports[index]['title'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReportDetailPage extends StatelessWidget {
  final String title;
  const ReportDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Detail $title akan ditampilkan di sini.",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
