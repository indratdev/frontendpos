import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/export.dart';


class TwoButton extends StatelessWidget {
  final void Function() mainButtonvoidCallback;
  final String mainTitleButton;
  final void Function()? secondButtonvoidCallback;
  final String secondTitleButton;
  final bool isVisibleSecondButton;
  final double widthMainDefault;
  final double widthSecondDefault;
  final double heightDefault;
  final Icon? iconSecondButton;

  const TwoButton({
    super.key,
    this.mainTitleButton = "PROSES",
    required this.mainButtonvoidCallback,
    this.secondTitleButton = "BATAL",
    this.secondButtonvoidCallback,
    this.widthMainDefault = 3,
    this.widthSecondDefault = 3,
    this.heightDefault = 17,
    this.isVisibleSecondButton = true,
    this.iconSecondButton,
  });

  // final ButtonStatusWidget widget;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height / heightDefault;

    return Row(
      mainAxisAlignment: (isVisibleSecondButton)
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.center,
      children: [
        (isVisibleSecondButton)
            ? SizedBox(
                width: _width / widthSecondDefault,
                height: _height,
                child: ElevatedButton.icon(
                  icon: (iconSecondButton != null)
                      ? iconSecondButton!
                      : const SizedBox(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.blue,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: (secondButtonvoidCallback == null)
                      ? () => Navigator.pop(context)
                      : secondButtonvoidCallback,
                  label: Text(
                    secondTitleButton,
                    style:  TextStyle(
                      color: context.blue,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: (isVisibleSecondButton)
              ? _width / widthMainDefault
              : _width - 100,
          height: _height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 3,
              backgroundColor: context.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: mainButtonvoidCallback,
            child: Text(mainTitleButton,
                style:  TextStyle(color: context.black)),
          ),
        ),
      ],
    );
  }
}
