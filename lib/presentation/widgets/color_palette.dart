import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({required this.onSelectCallback, super.key});

  final Function(String color) onSelectCallback;

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  final List<Color> _colors = [
    const Color(0xFFC8E6C9),
    const Color(0xFFF5DD29),
    const Color(0xFFFFCC80),
    const Color(0xFFEF9A9A),
    const Color(0xFFCD8DE5),
    const Color(0xFF5BA4CF),
    const Color(0xFF6DECA9),
    const Color(0xFFFF8ED4),
    const Color(0xFFBCAAA4),
  ];

  late Color _selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: GoogleFonts.openSans().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xff384042)),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _colors
                .map((Color color) => Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedColor = color;
                          });
                          String hexCode =
                              '#${color.value.toRadixString(16).padLeft(8, '0')}';

                          widget.onSelectCallback(hexCode);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right:
                                  _colors.indexOf(color) != _colors.length - 1
                                      ? 5
                                      : 0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: _selectedColor == color ? 3 : 1,
                                  color: const Color(0xFF312725),
                                ),
                                color: color,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ],
    );
  }
}
