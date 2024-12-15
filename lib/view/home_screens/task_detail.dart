import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail',
        style: TextStyle(
          color: Color(0xff3A9864),),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left,
          color: Color(0xff3A9864),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Aug 22 - Sunday',
                style: TextStyle(
                  color: Color(0xff3A9864),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: 100,
                    // color: Color(0xff3A9864),
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/walking.jpg'),
                      //   fit: BoxFit.cover,
                      // ),
                      color: Color(0xff3A9864),
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff3A9864),
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Walking',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        // const SizedBox(height: 10),
                        Text(
                          '02 : 30 PM',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('To complete your morning walk, start by waking up early, around sunrise, and begin your day with a glass of water to hydrate. Wear comfortable shoes and clothing, and do a few light stretches to warm up. Step outside and walk at a steady pace for about 20-30 minutes, breathing deeply and enjoying the peaceful atmosphere. Use this time to clear your mind or reflect on your day ahead. As you finish, slow down your pace and stretch again to cool down. Make this a consistent habit to boost your physical health, mental clarity, and overall well-being.',
                    style: TextStyle(
                      color: Color(0xff3A9864),
                      fontSize: 16,
                    ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(const Color(0xff3A9864)),
                        ), child: const Text('Mark Done',
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),

                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(const Color(0xffFF2E00)),
                        ), child: const Text('Remove',
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),

                        ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
