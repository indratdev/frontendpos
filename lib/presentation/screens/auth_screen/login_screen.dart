import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/presentation/widgets/two_button.dart';

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
          "MASUK",
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
                      height: MediaQuery.sizeOf(context).height / 1.6,
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
                              // titleTextfield: "Email",
                              hintText: "Email anda",
                              typeTextField: TypeTextField.email,
                              icon: Icons.person,
                            ),
                            CustomTextfieldWidget(
                              controller: _passwordController,
                              // titleTextfield: "Kata Sandi",
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
                              customPadding: EdgeInsets.only(bottom: 0.5),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.pushNamed(context, Routes.forgotPassword),
                                child: Text(
                                  "Lupa Kata Sandi?",
                                  style: TextStyle(color: context.blueDeep),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            TwoButton(
                              isVisibleSecondButton: false,
                              mainTitleButton: "MASUK",
                              mainButtonvoidCallback: () => Navigator.pushNamed(context, Routes.home),
                            ),
                          ],
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
