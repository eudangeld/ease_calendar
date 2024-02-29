import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'index.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({
    required this.validator,
    required this.hintText,
    required this.textEditController,
    required this.maxChars,
    this.textMask,
    this.readOnly = false,
    this.label,
    this.largeText = false,
    super.key,
  });

  final String? Function(String? value) validator;
  final String hintText;
  final String? label;
  final bool largeText;
  final bool readOnly;
  final int maxChars;
  final MaskTextInputFormatter? textMask;
  final TextEditingController textEditController;

  final BorderSide defaultBorder =
      const BorderSide(width: 1, color: Color.fromRGBO(49, 39, 37, 0.3));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? hintText,
            style: GoogleFonts.openSans().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xff384042)),
          ),
          TextFormField(
            readOnly: readOnly,
            maxLength: maxChars,
            controller: textEditController,
            inputFormatters: textMask != null ? [textMask!] : null,
            minLines: largeText ? 3 : 1,
            maxLines: largeText ? 5 : 1,
            decoration: InputDecoration(
              counterText: '',
              disabledBorder: OutlineInputBorder(
                borderSide: defaultBorder,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: defaultBorder.copyWith(
                    color: const Color.fromRGBO(49, 39, 37, 0.8)),
              ),
              contentPadding: const EdgeInsets.all(12),
              hintText: hintText,
              hintStyle: GoogleFonts.openSans().copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color.fromRGBO(49, 39, 37, 0.3)),
              enabledBorder: OutlineInputBorder(
                borderSide: defaultBorder,
              ),
            ),
            validator: validator,
          )
        ],
      ),
    );
  }
}
