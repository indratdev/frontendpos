import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:frontendpos/shared/utils/app_colors.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: context.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
          child: Column(
            children: [
              // Summary Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSummaryCard(context, "Pendapatan", "Rp 100.500.000",
                      Icons.attach_money, Colors.green),
                  _buildSummaryCard(context, "Mobil Dicuci", "25",
                      Icons.directions_car, Colors.blue),
                ],
              ),
              SizedBox(height: AppSpacing.spacingBetweenContainer(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSummaryCard(context, "Total Transaksi", "30",
                      Icons.receipt, Colors.orange),
                  _buildSummaryCard(context, "Pengeluaran", "Rp 2.000.000.000",
                      Icons.money_off, Colors.red),
                ],
              ),
              SizedBox(height: AppSpacing.spacingBetweenMenu(context)),

              // Mini Chart (Pendapatan per hari)
              Text("Pendapatan Mingguan",
                  style: TextStyle(
                      fontSize: AppTextSizes.large(context),
                      fontWeight: FontWeight.w500)),
              Container(
                color: context.blue.withValues(alpha: .2),
                margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
                padding: EdgeInsets.all(18),
                height: MediaQuery.sizeOf(context).height / 4.5,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(1, 500),
                          const FlSpot(2, 800),
                          const FlSpot(3, 1000),
                          const FlSpot(4, 700),
                          const FlSpot(5, 1500),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.blue,
                        belowBarData: BarAreaData(show: false),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // List Data Operasional
              Container(
                // color: Colors.lightBlue.shade50,
                // padding: EdgeInsets.all(8),
                // height: 200, // **Ganti Expanded dengan height tetap**
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildListTile(context, "Layanan Terlaris", "Cuci + Poles",
                        Icons.local_car_wash),
                    _buildListTile(context, "Pelanggan Baru", "12 Orang",
                        Icons.person_add),
                    _buildListTile(context, "Peak Hours", "10:00 - 12:00 WIB",
                        Icons.access_time),
                    _buildListTile(context, "Booking Hari Ini", "5 pelanggan",
                        Icons.event),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String title, String value,
      IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2.5,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: Constants.iconSizeSmall(context), color: color),
            const SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                    fontSize: AppTextSizes.medium(context),
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: AppTextSizes.large(context),
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing:
          Icon(Icons.arrow_forward_ios, size: Constants.iconSizeSmall(context)),
    );
  }
}
