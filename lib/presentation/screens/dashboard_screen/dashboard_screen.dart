import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Summary Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSummaryCard("Pendapatan", "Rp 1.500.000",
                      Icons.attach_money, Colors.green),
                  _buildSummaryCard(
                      "Mobil Dicuci", "25", Icons.directions_car, Colors.blue),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSummaryCard(
                      "Total Transaksi", "30", Icons.receipt, Colors.orange),
                  _buildSummaryCard(
                      "Pengeluaran", "Rp 200.000", Icons.money_off, Colors.red),
                ],
              ),
              const SizedBox(height: 20),

              // Mini Chart (Pendapatan per hari)
              const Text("Pendapatan Mingguan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 150,
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
                color: Colors.lightBlue.shade50,
                padding: EdgeInsets.all(8),
                height: 200, // **Ganti Expanded dengan height tetap**
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildListTile("Layanan Terlaris", "Cuci + Poles",
                        Icons.local_car_wash),
                    _buildListTile(
                        "Pelanggan Baru", "12 Orang", Icons.person_add),
                    _buildListTile(
                        "Peak Hours", "10:00 - 12:00 WIB", Icons.access_time),
                    _buildListTile(
                        "Booking Hari Ini", "5 pelanggan", Icons.event),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 5),
            Text(title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(value,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
