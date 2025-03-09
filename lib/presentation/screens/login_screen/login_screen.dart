import 'package:flutter/material.dart';
import 'package:frontendpos/utils/app_spacing.dart';
import 'package:frontendpos/utils/app_textSizes.dart';
import 'package:frontendpos/utils/export.dart';

import '../../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true; // Untuk toggle visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Constants.testImage))),
            ),
            Container(
              margin: AppSpacing.topSpacing(context),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Masuk",
                      style: TextStyle(
                          fontSize: AppTextSizes.extraLarge(context),
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20),

                    // Username Field
                    // TextFormField(
                    //   controller: _usernameController,
                    //   decoration: InputDecoration(
                    //     labelText: "Username",
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Username tidak boleh kosong";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Masukkan Email Anda",
                        prefixIcon: Icon(Icons.person,
                            color: Colors.blue), // Ikon di kiri
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border lebih halus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.blue, width: 2), // Warna saat fokus
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.grey, width: 1), // Warna default
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.red, width: 2), // Warna jika error
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username tidak boleh kosong";
                        } else if (value.length < 4) {
                          return "Username minimal 4 karakter";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Password Field
                    // TextFormField(
                    //   controller: _passwordController,
                    //   decoration: InputDecoration(
                    //     labelText: "Password",
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   obscureText: true,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Password tidak boleh kosong";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscured, // Menyembunyikan teks password
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Masukkan password Anda",
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.blue), // Ikon kunci
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured =
                                  !_isObscured; // Toggle password visibility
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        } else if (value.length < 6) {
                          return "Password minimal 6 karakter";
                        }
                        return null;
                      },
                    ),

                    // SizedBox(height: 16),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Aksi ketika Forgot Password ditekan
                        },
                        child: Text("Forgot Password?"),
                      ),
                    ),

                    // Login Button
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         // Aksi ketika tombol login ditekan
                    //       }
                    //     },
                    //     child: Text("Login"),
                    //   ),
                    // ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: Constants
                                .cornerRadiusBox, // Atur radius sesuai keinginan
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12), // Opsional: atur padding
                        ),
                        onPressed: () {},
                        child: Text(
                          "MASUK",
                          style: TextStyle(

                            fontSize: AppTextSizes.small(context),
                            color: context.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
