import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/presentation/widgets/two_button.dart';
import 'package:frontendpos/shared/utils/app_spacing.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';
import 'package:frontendpos/shared/utils/export.dart';
import 'package:frontendpos/shared/utils/validator.dart';

import '../../../shared/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final _formKeyRegister = GlobalKey<FormState>();
  bool _isObscured = true; // Untuk toggle visibility
  bool _isObscured2 = true; // Untuk toggle visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.blue,
        elevation: 0, // Hilangkan shadow
        foregroundColor: context.colorWhite,

        title: Text(
          "Daftar",
          style: TextStyle(
            fontSize: AppTextSizes.extraLarge(context),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: AppSpacing.topSpacing(context),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKeyRegister,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextfieldWidget(
                              controller: _nameController,
                              hintText: "Nama lengkap anda",
                              typeTextField: TypeTextField.general,
                              icon: Icons.person,
                            ),
                            CustomTextfieldWidget(
                              controller: _branchNameController,
                              hintText: "Nama bisnis anda",
                              typeTextField: TypeTextField.general,
                              icon: Icons.business,
                            ),
                            CustomTextfieldWidget(
                              controller: _emailController,
                              hintText: "Email anda",
                              typeTextField: TypeTextField.email,
                              icon: Icons.email,
                            ),
                            CustomTextfieldWidget(
                              controller: _passwordController,
                              hintText: "Kata sandi anda",
                              typeTextField: TypeTextField.password,
                              icon: Icons.lock,
                              obscureText: _isObscured,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                              useValidator: true,
                            ),
                            CustomTextfieldWidget(
                                controller: _rePasswordController,
                                hintText: "Ulangi kata sandi anda",
                                typeTextField: TypeTextField.password,
                                icon: Icons.lock,
                                obscureText: _isObscured2,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscured2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured2 = !_isObscured2;
                                    });
                                  },
                                ),
                                useValidator: true,
                                customPadding:
                                    AppSpacing.bottomSpacing(context)),
                            TwoButton(
                              isVisibleSecondButton: false,
                              mainTitleButton: "Daftar",
                              mainButtonvoidCallback: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Container di bagian bawah
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width / 1.5,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Dengan menekan daftar anda menyetujui ",
                    style: TextStyle(color: context.black),
                    children: [
                      TextSpan(
                        text: "syarat & ketentuan",
                        style: TextStyle(color: context.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
