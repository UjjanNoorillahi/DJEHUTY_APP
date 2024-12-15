// import 'package:flutter/material.dart';
// import 'package:getx_mvvm/view/home_screens/home.dart';
// import 'package:getx_mvvm/view/widgets/reusable_button.dart';
//
// class InterviewQuestionsScreen extends StatelessWidget {
//   const InterviewQuestionsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Interview Questions',
//             style: TextStyle(
//               color: Color(0xff000000),
//               fontSize: 20,
//             ),
//           ),
//           centerTitle: true,
//           leading: TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 PageRouteBuilder(
//                   transitionDuration: const Duration(milliseconds: 300),
//                   pageBuilder: (context, animation, secondaryAnimation) =>
//                       const HomeScreen(),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     const begin = Offset(1.0, 0.0); // Start from right
//                     const end =
//                         Offset(0.0, 0.0); // End at the original position
//                     const curve = Curves.ease;
//
//                     var tween = Tween(begin: begin, end: end)
//                         .chain(CurveTween(curve: curve));
//
//                     return SlideTransition(
//                       position: animation.drive(tween),
//                       child: child,
//                     );
//                   },
//                 ),
//               );
//             },
//             child: const Text(
//               'Skip',
//               style: TextStyle(color: Colors.green, fontSize: 14),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.05,
//                   vertical: screenHeight * 0.02,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const AddQuestion(
//                       qNo: 1,
//                       question:
//                           'What significant event(s) do you have coming up in the next six months? i.e., birthday, anniversary, family get-together.',
//                     ), // Question - 1
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       maxLines: 3,
//                       decoration: InputDecoration(
//                         hintText: 'Enter your answer here',
//                         hintStyle: const TextStyle(
//                           color: Color(0xff7b7b7b),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const AddQuestion(
//                       qNo: 2,
//                       question:
//                           'Rate the top challenges that might get in the way of you reaching your goals.',
//                     ), // Question - 2
//                     const SizedBox(height: 10),
//                     Container(
//                       height: 40,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Color(0xff3A9864),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Select Goals',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     const SelectGoals(),
//                     const SizedBox(height: 10),
//                     const AddQuestion(
//                       qNo: 3,
//                       question: 'How many of each do you eat per day?',
//                     ),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Meals:',
//                         style: TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: '',
//                         hintStyle: const TextStyle(
//                           color: Color(0xff7b7b7b),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Sodas:',
//                         style: TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: '',
//                         hintStyle: const TextStyle(
//                           color: Color(0xff7b7b7b),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Snacks:',
//                         style: TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: '',
//                         hintStyle: const TextStyle(
//                           color: Color(0xff7b7b7b),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'On Average, how many meals do you eat out weekly?:',
//                         style: TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: '',
//                         hintStyle: const TextStyle(
//                           color: Color(0xff7b7b7b),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const AddQuestion(
//                       qNo: 4,
//                       question: 'What are your top goals?',
//                     ), //Question - 3
//                     const SizedBox(height: 10),
//                     Container(
//                       height: 40,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Color(0xff3A9864),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Select Goals',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     const QuestionFour(),
//                     const SizedBox(height: 10),
//                     const AddQuestion(
//                       qNo: 5,
//                       question:
//                           'When was the last time you were in the best shape of your life?',
//                     ), // Question - 4
//                     const SizedBox(height: 20),
//                     const QuestionFiveOptions(
//                       title: 'Exercise Knowledge',
//                     ),
//                     const SizedBox(height: 20),
//                     const QuestionFiveOptions(
//                       title: 'Form and Technique',
//                     ),
//                     const SizedBox(height: 20),
//                     const QuestionFiveOptions(
//                       title: 'Self Discipline',
//                     ),
//                     const SizedBox(height: 20),
//                     ReusableButton(
//                       title: 'Submit',
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // The fixed bottom navigation
//             // Padding(
//             //   padding: EdgeInsets.symmetric(
//             //     horizontal: screenWidth * 0.05,
//             //     vertical: screenHeight * 0.02,
//             //   ),
//             //   child: BottomNavigator(
//             //     onPressedForward: () {
//             //       // Navigator.push(
//             //       //   context,
//             //       //   MaterialPageRoute(
//             //       //     builder: (context) => const ReviewInterviewQuestionsScreen(),
//             //       //   ),
//             //       // );
//             //
//             //       Navigator.push(
//             //         context,
//             //         PageRouteBuilder(
//             //           transitionDuration: const Duration(milliseconds: 300),
//             //           pageBuilder: (context, animation, secondaryAnimation) => const ReviewInterviewQuestionsScreen(),
//             //           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             //             const begin = Offset(1.0, 0.0); // Start from right
//             //             const end = Offset(0.0, 0.0); // End at the original position
//             //             const curve = Curves.ease;
//             //
//             //             var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//             //
//             //             return SlideTransition(
//             //               position: animation.drive(tween),
//             //               child: child,
//             //             );
//             //           },
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screens/home.dart';
import '../widgets/reusable_button.dart';
import 'interview_questions_controller.dart';

class AddQuestion extends StatelessWidget {
  final int qNo;
  final String question;

  const AddQuestion({super.key, required this.qNo, required this.question});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(top: 2, right: 5),
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xff3A9864),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              'Q.$qNo ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: widthScreen * 0.05),
        Expanded(
          flex: 6,
          child: Text(question),
        ),
      ],
    );
  }
}

// Question - 2

class SelectGoals extends StatefulWidget {
  @override
  _SelectGoalsState createState() => _SelectGoalsState();
}

class _SelectGoalsState extends State<SelectGoals> {
  final Map<String, String> healthRisksMap = {
    '• TIME': 'time',
    '• LACK OF SUPPORT': 'Lack_Of_Support',
    '• MONEY': 'money',
    '• PROCRASTINATION': 'procrastination',
    '• MOTIVATION': 'motivation',
    '• NUTRITION': 'nutrition',
    '• BOREDOM': 'boredom',
    '• LACK OF EXPERTISE': 'lack_of_expertise',
    '• INJURY': 'injury',
  };

  final Map<String, bool> selectedRisks = {};

  @override
  void initState() {
    super.initState();

    // Initialize selectedRisks with false for all health risks
    healthRisksMap.keys.forEach((key) {
      selectedRisks[key] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Get the controller instance
    final InterviewQuestionsController controller =
        Get.find<InterviewQuestionsController>();

    return Container(
      width: double.infinity,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff3A9864),
          width: 2,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: healthRisksMap.keys.map((label) {
          return Column(
            children: [
              CheckboxListTile(
                title: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                  ),
                ),
                value: selectedRisks[label],
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    selectedRisks[label] = value ?? false;
                  });

                  // Send only the selected risks to the controller
                  controller.updateSelectedRisksAndSend(
                      selectedRisks, healthRisksMap);
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// class SelectGoals extends StatefulWidget {
//   const SelectGoals();
//
//   @override
//   State<SelectGoals> createState() => _SelectGoalsState();
// }
//
// class _SelectGoalsState extends State<SelectGoals> {
//   final List<String> healthRisks = [
//     '• TIME',
//     '• LACK OF SUPPORT',
//     '• DISCIPLINE/ACCOUNTABILITY',
//     '• MONEY',
//     '• PROCRASTINATION',
//     '• MOTIVATION',
//     '• NUTRITION',
//     '• BOREDOM',
//     '• LACK OF EXPERTISE',
//     '• INJURY',
//   ];
//
//   final Map<String, String> healthRisksMap = {
//     '• TIME': 'time',
//     '• LACK OF SUPPORT': 'Lack_Of_Support',
//     '• DISCIPLINE/ACCOUNTABILITY': 'discipline_accountability',
//     '• MONEY': 'money',
//     '• PROCRASTINATION': 'procrastination',
//     '• MOTIVATION': 'motivation',
//     '• NUTRITION': 'nutrition',
//     '• BOREDOM': 'boredom',
//     '• LACK OF EXPERTISE': 'lack_of_expertise',
//     '• INJURY': 'injury',
//   };
//
//   final Map<String, bool> selectedRisks = {};
//
//   @override
//   void initState() {
//     super.initState();
//     for (var key in healthRisksMap.keys) {
//       selectedRisks[key] = false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     // Get the controller instance
//     final InterviewQuestionsController controller =
//         Get.find<InterviewQuestionsController>();
//
//     return Container(
//       width: double.infinity,
//       height: screenHeight * 0.3,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: const Color(0xff3A9864),
//           width: 2,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(15),
//           bottomRight: Radius.circular(15),
//         ),
//       ),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: healthRisksMap.keys.map((label) {
//           return Column(
//             children: [
//               CheckboxListTile(
//                 title: Text(
//                   label,
//                   style: const TextStyle(
//                     color: Color(0xff000000),
//                     fontSize: 16,
//                   ),
//                 ),
//                 value: selectedRisks[label],
//                 checkboxShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 onChanged: (bool? value) {
//                   setState(() {
//                     selectedRisks[label] = value ?? false;
//                   });
//
//                   // Send only the selected risks to the controller
//                   controller.updateSelectedRisksAndSend(
//                       selectedRisks, healthRisksMap);
//                 },
//               ),
//             ],
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// Question - 4

class QuestionFour extends StatefulWidget {
  const QuestionFour();

  @override
  State<QuestionFour> createState() => _QuestionFourState();
}

class _QuestionFourState extends State<QuestionFour> {
  final Map<String, String> healthRisksMap = {
    '• LOSE FAT': 'lose_fat',
    '• IMPROVE HEALTH': 'improve_health',
    '• LOOK BETTER': 'look_better',
    '• KNOWLEDGE': 'knowledge',
    '• GAIN WEIGHT': 'gain_weight',
    '• IMPROVE MUSCLE TONE': 'improve_muscle_tone',
    '• FEEL BETTER': 'feel_better',
  };

  final Map<String, bool> selectedRisks = {};

  @override
  void initState() {
    super.initState();

    // Initialize selectedRisks with false for all health risks
    healthRisksMap.keys.forEach((key) {
      selectedRisks[key] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final controller =
        Get.find<InterviewQuestionsController>(); // Get the controller

    return Container(
      width: double.infinity,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff3A9864),
          width: 2,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: healthRisksMap.keys.map((label) {
          return Column(
            children: [
              CheckboxListTile(
                title: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                  ),
                ),
                value: selectedRisks[label],
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    selectedRisks[label] = value ?? false;
                  });

                  // Send only the selected risks to the controller
                  controller.updateSelectedGoals(selectedRisks, healthRisksMap);
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// Question - 5
class QuestionFiveOptions extends StatefulWidget {
  final String title;
  const QuestionFiveOptions({super.key, required this.title});

  @override
  State<QuestionFiveOptions> createState() => _QuestionFiveOptionsState();
}

class _QuestionFiveOptionsState extends State<QuestionFiveOptions> {
  int selectedNumber = -1; // State to track the selected number

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller =
        Get.find<InterviewQuestionsController>(); // Get the controller

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${widget.title}:',
            style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 25, // Define height for the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNumber = index; // Set the selected number
                  });
                  controller.updateSelectedNumber(
                      index, widget.title); // Update controller
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedNumber == index
                        ? const Color(0xff3a9864) // Green if selected
                        : Colors.transparent, // Transparent otherwise
                    border: Border.all(
                      color: const Color(0xff000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: selectedNumber == index
                          ? Colors.white // White text if selected
                          : const Color(0xff3a9864), // Green text otherwise
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class InterviewQuestionsScreen extends StatelessWidget {
  InterviewQuestionsScreen({super.key});

  TextEditingController mealsController = TextEditingController();
  TextEditingController sodasController = TextEditingController();
  TextEditingController snacksController = TextEditingController();

  final _logInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final InterviewQuestionsController controller =
        Get.put(InterviewQuestionsController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Interview Questions',
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Start from right
                    const end =
                        Offset(0.0, 0.0); // End at the original position
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Form(
                  key: _logInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question - 1
                      const AddQuestion(
                        qNo: 1,
                        question:
                            'What significant event(s) do you have coming up in the next six months? i.e., birthday, anniversary, family get-together.',
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLines: 3,
                        onChanged: (value) {
                          controller.significantEvents.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your answer here',
                          hintStyle: const TextStyle(
                            color: Color(0xff7b7b7b),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your answer';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const AddQuestion(
                        qNo: 2,
                        question:
                            'Rate the top challenges that might get in the way of you reaching your goals.',
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff3A9864),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Select Goals',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SelectGoals(),
                      const SizedBox(height: 10),
                      const AddQuestion(
                        qNo: 3,
                        question: 'How many of each do you eat per day?',
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Meals:',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Question - 3
                      TextFormField(
                        controller: mealsController,
                        onChanged: (value) {
                          controller.meals.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: const TextStyle(
                            color: Color(0xff7b7b7b),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your answer';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sodas:',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: sodasController,
                        onChanged: (value) {
                          controller.sodas.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: const TextStyle(
                            color: Color(0xff7b7b7b),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your answer';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Snacks:',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: snacksController,
                        onChanged: (value) {
                          controller.snacks.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: const TextStyle(
                            color: Color(0xff7b7b7b),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your answer';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const AddQuestion(
                        qNo: 4,
                        question: 'What are your top goals?',
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff3A9864),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Select Goals',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const QuestionFour(),
                      const SizedBox(height: 10),
                      const AddQuestion(
                        qNo: 5,
                        question:
                            'When was the last time you were in the best shape of your life?',
                      ),
                      const SizedBox(height: 20),
                      const QuestionFiveOptions(
                        title: 'Exercise Knowledge',
                      ),
                      const SizedBox(height: 20),
                      const QuestionFiveOptions(
                        title: 'Form and Technique',
                      ),
                      const SizedBox(height: 20),
                      const QuestionFiveOptions(
                        title: 'Self Discipline',
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => ReusableButton(
                          title: 'Submit',
                          onPressed: () {
                            if (_logInFormKey.currentState!.validate()) {
                              controller.submitInterviewQuestions();
                            }
                          },
                          isLoading: controller.loading.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
