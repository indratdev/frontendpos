import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun"),
        centerTitle: true,
        leading: BackButton(), // Tombol back default di AppBar
        backgroundColor: Colors.transparent, // Biar tidak terlihat
        elevation: 0, // Hilangkan bayangan
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: MediaQuery.sizeOf(context).height / 2.5,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    Constants.testImage,
                    height: MediaQuery.sizeOf(context).height / 3.2,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 60,
                  child: Container(
                    color: Colors.blue,
                    height: MediaQuery.sizeOf(context).height / 6,
                    width: MediaQuery.sizeOf(context).height / 6,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 60,
                  child: Container(
                    color: Colors.red,
                    height: MediaQuery.sizeOf(context).height / 6,
                    width: MediaQuery.sizeOf(context).height / 6,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Text("data");
              },
            ),
          ))
        ],
      ),
    );
  }
}
