import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  bool isVisiting = false;

  void visitDoctor(){
    isVisiting = true;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 10,
              ),

              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xff3A9864),
              ),
              const Row(
                children: [
                  Text('Nearby Places',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff3A9864),
                        fontSize: 25
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        nearbyPlaces(),
        nearbyPlaces(),
      ],
    );
  }
  Widget nearbyPlaces(){
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/nearby.png'),
            SizedBox(
              // height: 10,
              height: screenWidth * 0.05,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Apollo International Hospital',
                     style: TextStyle(
                       color: Color(0xff3A9864),
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                  Text(
                    'Multi Super Speciality Hospital',
                    style: TextStyle(
                      color: Color(0xff1C665E),
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, color: Color(0xff333333), size: 15,),
                      Text('West Ham North, England',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 10,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                   Row(
                     children: [
                       Icon(Icons.cable_sharp, color: Color(0xff333333), size: 15,),
                       Text('5 km away from your location',
                         style: TextStyle(
                           color: Color(0xff333333),
                           fontSize: 10,
                           // fontWeight: FontWeight.bold,
                         ),
                       ),
                     ],
                   )
                 ],
               ) ,
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/images/locationCard.svg', height: 50, width: 50),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget DoctorsCard(){
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xffC5C3C3).withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/doctor.png', height: 100, width: 100),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dr.Name',
                style: TextStyle(
                  color: Color(0xff3A9864),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              //
              // ),
              Text('MBBS, MD',
                style: TextStyle(
                  color: Color(0xff1C665E),
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Text('Cardiologist',
                style: TextStyle(
                  color: Color(0xff1C665E),
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '42 Year Experience',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on_rounded, color: Color(0xff333333), size: 15,),
                  Text('Apollo hospital, west ham',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 10,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Image.asset('assets/images/steth.png', height: 60, width: 60),
              ElevatedButton(onPressed: (){
                visitDoctor();
              },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color(0xff3A9864)),
                ), child: const Text('Visit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class DoctorsCard extends StatelessWidget {
//   const DoctorsCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
//
