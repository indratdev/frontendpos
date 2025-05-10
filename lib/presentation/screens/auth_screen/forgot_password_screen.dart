import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/presentation/widgets/two_button.dart';

import 'package:frontendpos/shared/utils/export.dart';
import 'package:frontendpos/shared/utils/validator.dart';

import '../../../shared/utils/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // bool _isObscured = true; // Untuk toggle visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparan
        elevation: 0, // Hilangkan shadow
        foregroundColor: context.colorWhite,
        title: Text(
          "Lupa Kata Sandi",
          style: TextStyle(
              fontSize: AppTextSizes.extraLarge(context),
              fontWeight: FontWeight.w500,
              color: context.colorWhite),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height / 2,
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
                                hintText: "Email anda",
                                typeTextField: TypeTextField.email,
                                icon: Icons.email,
                                customPadding: EdgeInsets.only(bottom: 0),
                              ),
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).height / 20),
                              TwoButton(
                                isVisibleSecondButton: false,
                                mainTitleButton: "KIRIM",
                                mainButtonvoidCallback: () => Navigator.pushNamed(
                                    context, Routes.sendForgotPassword),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ingat kata sandi ?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginOption,
                      ModalRoute.withName(Routes.login),
                    ), // Hapus semua sampai halaman login ,
                    child: Text(
                      "Masuk",
                      style: TextStyle(color: context.blueDeep),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
