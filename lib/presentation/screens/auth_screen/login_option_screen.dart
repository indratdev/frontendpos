import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / 20),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Constants.testImage),
        )),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      horizontal: 20, vertical: 12), // Opsional: atur padding
                ),
                onPressed: () => Navigator.pushNamed(context, Routes.login),
                child: Text(
                  "MASUK",
                  style: TextStyle(
                    fontSize: AppTextSizes.medium(context),
                    color: context.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
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
                      horizontal: 20, vertical: 12), // Opsional: atur padding
                ),
                 onPressed: () => Navigator.pushNamed(context, Routes.register),
                child: Text(
                  "DAFTAR",
                  style: TextStyle(
                    fontSize: AppTextSizes.medium(context),
                    color: context.black,
                    fontWeight: FontWeight.w600,
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
