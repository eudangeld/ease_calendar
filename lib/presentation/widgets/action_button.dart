import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    required this.buttonType,
    required this.callBack,
    super.key,
  });

  final ButtonType buttonType;
  final VoidCallback callBack;

  final Map<ButtonType, Color> buttonColorBg = {
    ButtonType.cancel: const Color(0xFF626262),
    ButtonType.remove: const Color(0xFFD42222),
    ButtonType.save: const Color(0xFF394ABC)
  };
  final Map<ButtonType, String> buttonLabel = {
    ButtonType.cancel: 'Cancel',
    ButtonType.remove: 'Remove',
    ButtonType.save: 'Save',
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Container(
        width: 128,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: buttonColorBg[buttonType],
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                color: Color(0xFFD1DCF0),
                blurRadius: 28,
                offset: Offset(0, 4)),
          ],
        ),
        child: Center(
          child: Text(
            buttonLabel[buttonType]!,
            style: GoogleFonts.openSans().copyWith(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

enum ButtonType { remove, cancel, save }
