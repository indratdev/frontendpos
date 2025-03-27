import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/shared/utils/export.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "Nama Pengguna");
  final TextEditingController _emailController =
      TextEditingController(text: "user@example.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "+628123456789");
  final TextEditingController _passwordController =
      TextEditingController(text: "********");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/profile_placeholder.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Edit Profil",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            CustomTextfieldWidget(
              controller: _nameController,
              hintText: "Nama",
              titleTextfield: "Nama",
            ),    
            SizedBox(height: 10),

             CustomTextfieldWidget(
              controller: _emailController,
              hintText: "Email",
              titleTextfield: "Email",
            ),                
            SizedBox(height: 10),

             CustomTextfieldWidget(
              controller: _phoneController,
              hintText: "Nomor Telepon",
              titleTextfield: "Nomor Telepon",
            ),               
            SizedBox(height: 10),

             CustomTextfieldWidget(
              controller: _passwordController,
              hintText: "Kata Sandi",
              titleTextfield: "Kata Sandi",
              obscureText: true,

            ),               
            SizedBox(height: 20),

            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika simpan perubahan di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Perubahan disimpan!")),
                  );
                },
                child: Text("Simpan Perubahan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
