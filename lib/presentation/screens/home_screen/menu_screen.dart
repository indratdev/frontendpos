import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 4 / 3,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(
                  //   'https://via.placeholder.com/100',
                  //   width: 60,
                  //   height: 60,
                  // ),
                  const SizedBox(height: 8),
                  Text("Menu ${index + 1}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
