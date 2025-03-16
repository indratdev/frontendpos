import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/presentation/widgets/two_button.dart';
import 'package:frontendpos/shared/utils/app_spacing.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';
import 'package:frontendpos/shared/utils/export.dart';
import 'package:frontendpos/shared/utils/validator.dart';

import '../../../shared/utils/constants.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparan
        elevation: 0, // Hilangkan shadow
        foregroundColor: context.colorWhite,
        title: Text(
          "Masuk",
          style: TextStyle(
              fontSize: AppTextSizes.extraLarge(context),
              fontWeight: FontWeight.w500,
              color: context.colorWhite),
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
                      height: MediaQuery.sizeOf(context).height / 2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Constants.testImage),
                        ),
                      ),
                    ),
                    Container(
                      margin: AppSpacing.topSpacing(context),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextfieldWidget(
                              controller: _emailController,
                              titleTextfield: "Email",
                              hintText: "Ketikan email anda",
                              typeTextField: TypeTextField.email,
                              icon: Icons.person,
                            ),
                            CustomTextfieldWidget(
                              controller: _passwordController,
                              titleTextfield: "Kata Sandi",
                              hintText: "Ketikan kata sandi anda",
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
                              customPadding: EdgeInsets.only(bottom: 0.5),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: context.blueDeep),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            TwoButton(
                              isVisibleSecondButton: false,
                              mainTitleButton: "Masuk",
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
