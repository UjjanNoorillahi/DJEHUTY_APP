import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpTextField extends StatefulWidget {
  final int fieldCount; // Number of OTP boxes
  final double fieldWidth; // Width of each box
  final double fieldHeight; // Height of each box
  final Color borderColor; // Color of the border
  final Color focusedBorderColor; // Border color when focused
  final Color cursorColor; // Cursor color
  final TextStyle textStyle; // TextStyle for the entered text
  final ValueChanged<String> onCompleted; // Callback when OTP is completed

  const CustomOtpTextField({
    Key? key,
    this.fieldCount = 6,
    this.fieldWidth = 50,
    this.fieldHeight = 50,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.cursorColor = Colors.black,
    required this.textStyle,
    required this.onCompleted,
  }) : super(key: key);

  @override
  State<CustomOtpTextField> createState() => _CustomOtpTextFieldState();
}

class _CustomOtpTextFieldState extends State<CustomOtpTextField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  String otp = "";

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.fieldCount, (index) => TextEditingController());
    focusNodes = List.generate(widget.fieldCount, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(String value, int index) {
    if (value.isNotEmpty) {
      otp = _getOtpValue();
      if (index < widget.fieldCount - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (otp.length == widget.fieldCount) {
        widget.onCompleted(otp);
      }
    }
  }

  void _onBackspacePressed(int index) {
    if (controllers[index].text.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      controllers[index - 1].clear();
    }
  }

  String _getOtpValue() {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.fieldCount, (index) {
        return Container(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                _onBackspacePressed(index);
              }
            },
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              maxLength: 1,
              cursorHeight: 28,
              textAlign: TextAlign.center,
              style: widget.textStyle,
              cursorColor: widget.cursorColor,
              decoration: InputDecoration(
                counterText: "", // Hides the maxLength counter
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: widget.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: widget.focusedBorderColor),
                ),
              ),
              onChanged: (value) => _onTextChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}
