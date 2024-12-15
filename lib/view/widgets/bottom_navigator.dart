import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final VoidCallback onPressedForward;
  const BottomNavigator({super.key, required this.onPressedForward});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Divider(
              color: Color(0xff175232),
              thickness: 2,
            ),
            SizedBox(height:  screenHeight * 0.01
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff175232),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xff175232),
                  child: IconButton(
                    onPressed: onPressedForward,
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
      ],
    );
  }
}