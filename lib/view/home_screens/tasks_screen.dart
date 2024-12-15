import 'package:flutter/material.dart';
import 'package:getx_mvvm/view/home_screens/task_detail.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
        children: [
          Container(
            color: const Color(0xff3A9864),
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text('Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      children: [
                        Card(
                            elevation: 5, color: const Color(0xff3A9864),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('August 22',
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down, color: Color(0xffffffff), size: 30
                                          ),
                                        ]
                                    ),
                                    SizedBox(height: height * 0.05),
                                    const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('02 : 30 PM',
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Sunday',
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ]
                                    ),
                                  ]
                              ),
                            )
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                         TaskCards(
                          date: '22',
                          day: 'WEN',
                          event: 'Walking',
                          time: '06 : 30',
                          repeat: 'Week',
                           onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskDetailScreen()));
                           },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                         TaskCards(
                          date: '23',
                          day: 'THU',
                          event: 'Psychiatrist',
                          time: '20 : 00',
                          repeat: 'Once',
                           onPressed: () {},
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TaskCards(
                          date: '24',
                          day: 'FRI',
                          event: 'GYM',
                          time: '22 : 00',
                          repeat: 'Week',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                         TaskCards(
                          date: '25',
                          day: 'SAT',
                          event: 'Yoga',
                          time: '08 : 00',
                          repeat: 'Once',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                         TaskCards(
                          date: '26',
                          day: 'SUN',
                          event: 'Yoga',
                          time: '08 : 00',
                          repeat: 'Once',
                          onPressed: () {},
                        ),

                      ]
                  )
              ),
            ),
          )
        ]
    );
  }
}

class TaskCards extends StatelessWidget {
  final String date, day, event, time, repeat;
  VoidCallback onPressed;
  TaskCards({super.key, required this.date, required this.day, required this.event, required this.time, required this.repeat, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(5),
                  height: 55,
                  decoration: const BoxDecoration(
                      color: Color(0xff3A9864),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.circle, color: Color(0xffffffff), size: 15),
                      // SizedBox(width: 5),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(date,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(day,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff3A9864),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(time,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffffffff),
                            ),),
                        ],
                      ),
                      Image.asset('assets/images/task_card_icon.png',
                        height: 40,
                        width: 40,
                      ),
                      // Column(
                      //   children: [
                      //     Icon(
                      //         Icons.notifications_none, color: Color(0xffffffff), size: 20),
                      //     Text(repeat,
                      //       style: TextStyle(
                      //         color: Color(0xffffffff),
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

