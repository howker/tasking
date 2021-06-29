import 'package:flutter/material.dart';

class AllowUsersCheckBox extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color textColor;
  final Color borderColor;
  final Color checkBoxActiveColor;
  final Color checkBoxCheckColor;
  final double scale;
  final double boxWidth;
  final double boxHeight;

  const AllowUsersCheckBox({
    required this.text,
    this.textStyle = const TextStyle(),
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.checkBoxActiveColor = Colors.white,
    this.checkBoxCheckColor = Colors.black,
    this.scale = 1.0,
    this.boxWidth = 24,
    this.boxHeight = 24,
    Key? key,
  }) : super(key: key);

  @override
  _AllowUsersCheckBoxState createState() => _AllowUsersCheckBoxState();
}

class _AllowUsersCheckBoxState extends State<AllowUsersCheckBox> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor),
              ),
              width: widget.boxWidth,
              height: widget.boxHeight,
              child: Transform.scale(
                scale: widget.scale,
                child: Checkbox(
                  activeColor: widget.checkBoxActiveColor,
                  checkColor: widget.checkBoxCheckColor,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 11),
        Text(
          widget.text,
          style: widget.textStyle.copyWith(
            color: widget.textColor,
          ),
        ),
      ],
    );
  }
}
