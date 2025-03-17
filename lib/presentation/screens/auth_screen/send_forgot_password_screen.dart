import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/presentation/widgets/textfield.dart';
import 'package:frontendpos/presentation/widgets/two_button.dart';

import 'package:frontendpos/shared/utils/export.dart';
import 'package:frontendpos/shared/utils/validator.dart';

import '../../../shared/utils/constants.dart';

class SendForgotPasswordScreen extends StatefulWidget {
  @override
  _SendForgotPasswordScreenState createState() =>
      _SendForgotPasswordScreenState();
}

class _SendForgotPasswordScreenState extends State<SendForgotPasswordScreen> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // bool _isObscured = true; // Untuk toggle visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparan
        elevation: 0, // Hilangkan shadow
        foregroundColor: Colors.grey,
        title: Text(
          "",
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text("Email berhasil dikirim",
                            style: TextStyle(
                              fontSize: AppTextSizes.large(context),
                              fontWeight: FontWeight.w500
                            )),
                      ),
                      Text(
                        "Silakan periksa kotak masuk Anda dan klik tautan terima untuk mengatur ulang kata sandi",
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade600),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: MediaQuery.sizeOf(context).height / 2.8,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TwoButton(
                              isVisibleSecondButton: false,
                              mainTitleButton: "MASUK",
                              mainButtonvoidCallback: () =>
                                  Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.loginOption,
                                ModalRoute.withName(Routes.login),
                              ), // Hapus semua sampai halaman login ),
                            ),
                          ],
                        ),
                      ),

                      // Spacer(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tidak menerima link ?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginOption,
                      ModalRoute.withName(Routes.login),
                    ), // Hapus semua sampai halaman login ,
                    child: Text(
                      "Kirim Ulang",
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
