import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioChatScreen extends StatefulWidget {
  const AudioChatScreen({super.key});

  @override
  State<AudioChatScreen> createState() => _AudioChatScreenState();
}

class _AudioChatScreenState extends State<AudioChatScreen> {
  bool micIsOn = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/audio_chat_pic1.png'),
                        Image.asset('assets/images/audio_chat_pic2.png'),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      (!micIsOn)
                          ? 'Hi Mujtaba! How is your day going? Have you done your tasks?'
                          : 'I am not feeling good. Please suggest me more tasks.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0A6532),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: const Color(0xff0A6532),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xff3A9864).withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_alt_outlined,
                        size: 30,
                        color: const Color(0xff3A9864).withOpacity(0.5),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        HapticFeedback.heavyImpact();
                        micIsOn = !micIsOn;
                      });
                    },
                    child: (!micIsOn)
                        ? SvgPicture.asset(
                            'assets/images/mic.svg',
                            height: 100,
                            width: 100,
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mic_off2.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                // top: 0,
                                // right: 0,
                                child:
                                    Image.asset('assets/images/mic_off1.png'),
                              ),
                            ],
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 50,
                      color: const Color(0xff3A9864).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:
                    16), // Bottom padding to ensure spacing at the very bottom
          ],
        ),
      ),
    );
  }
}
