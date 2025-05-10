import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {"title": "Promo Spesial!", "message": "Dapatkan diskon 20% hari ini!", "isRead": false},
    {"title": "Transaksi Berhasil", "message": "Pembayaran Anda telah dikonfirmasi.", "isRead": true},
    {"title": "Pembaruan Aplikasi", "message": "Versi terbaru sekarang tersedia.", "isRead": false},
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification["isRead"] = true;
      }
    });
  }

  void _clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.done_all),
            onPressed: _markAllAsRead,
            tooltip: "Tandai Semua Terbaca",
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearNotifications,
            tooltip: "Hapus Semua",
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                "Tidak ada notifikasi",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return ListTile(
                  leading: Icon(
                    notification["isRead"] ? Icons.notifications_none : Icons.notifications_active,
                    color: notification["isRead"] ? Colors.grey : Colors.blueAccent,
                  ),
                  title: Text(notification["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(notification["message"]),
                  trailing: notification["isRead"]
                      ? null
                      : Icon(Icons.circle, color: Colors.red, size: 10),
                  onTap: () {
                    setState(() {
                      notification["isRead"] = true;
                    });
                  },
                );
              },
            ),
    );
  }
}
