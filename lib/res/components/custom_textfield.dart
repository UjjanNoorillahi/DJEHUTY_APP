import 'package:flutter/material.dart';

import '../../utils/responsive_size_utils.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  double? height = ResponsiveSizeUtil.size60;
  double? width = double.infinity;
  Widget? suffix;
  bool readOnly;
  final Function(String)? onChanged; // Add this line

  CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.height,
    this.width,
    this.suffix,
    this.readOnly = false,
    this.onChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ResponsiveSizeUtil.size10),
        color: const Color(0xFFF0F0F0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSizeUtil.size16,
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: ResponsiveSizeUtil.size15,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: suffix,
            labelText: label,
            labelStyle: TextStyle(
              fontSize: ResponsiveSizeUtil.size15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
