import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  const ReusableButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.87,
        height: 60,
        decoration: BoxDecoration(
          color: isLoading ? Colors.grey : const Color(0xff3A9864),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            strokeWidth: 5,

            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff3A9864)),

          )
              : Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
