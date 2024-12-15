// import 'package:flutter/material.dart';
// import 'package:getx_mvvm/view/home_screens/profile_screen/profile_screen_controller.dart';
//
// class ProfileScreen extends StatelessWidget {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String userId;
//
//   const ProfileScreen(
//       {super.key,
//       required this.firstName,
//       required this.lastName,
//       required this.email,
//       required this.userId});
//
//   @override
//   Widget build(BuildContext context) {
//     ProfileController controller = ProfileController();
//
//     controller.fetchUserProfile(userId);
//
//     print('Profile Data...: ${controller.profileData}');
//
//     final screenWidht = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.chevron_left),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const Expanded(
//                       child: Text(
//                         'Profile',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidht * 0.1,
//                     ),
//                   ],
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: const Color(0xff3A9864)),
//                       ),
//                       child: Image.asset('assets/images/profile.png'),
//                     ),
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(17.5),
//                             border: Border.all(color: const Color(0xff3A9864)),
//                           ),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Color(0xff3A9864),
//                           )),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.01,
//                 ),
//                 Text(
//                   '$firstName $lastName',
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff3A9864),
//                   ),
//                 ),
//                 Text(
//                   email,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Color(0xff3A9864),
//                   ),
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.01,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     backgroundColor: const Color(0xff3A9864),
//                   ),
//                   child: const Text(
//                     'Edit Profile',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.01,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Age',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           '25',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Gender',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           'Robot',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Zip Code',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           '26500',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'State',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           'USA',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'City',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           'Sukkur',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Address',
//                         style: TextStyle(
//                           color: Color(0xff3A9864),
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff3A9864).withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff3A9864)),
//                         ),
//                         child: const Text(
//                           'Airport Road Sukkur',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:getx_mvvm/view/home_screens/profile_screen/profile_screen_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String userId;

  const ProfileScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    await controller.fetchUserProfile(widget.userId);
    print('Profile Data...: ${controller.profileData}');
    print(
        'Profile Photo...: ${controller.profileData['data']['profilePhoto']}');

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: const Color(0xff3A9864)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: controller.profileData['data']['profilePhoto'] !=
                                    null &&
                                controller.profileData['data']
                                        ['profilePhoto'] !=
                                    ''
                            ? Image.network(
                                controller.profileData['data']['profilePhoto'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/profile.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/images/profile.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(50),
                    //     border: Border.all(color: const Color(0xff3A9864)),
                    //   ),
                    //   child: Image.asset('assets/images/profile.png'),
                    // ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17.5),
                          border: Border.all(color: const Color(0xff3A9864)),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xff3A9864),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  '${controller.profileData['firstName'] ?? widget.firstName} ${controller.profileData['lastName'] ?? widget.lastName}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3A9864),
                  ),
                ),
                Text(
                  controller.profileData['email'] ?? widget.email,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff3A9864),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xff3A9864),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                _buildInfoSection(
                    'Age', controller.profileData['data']['age'] ?? '25'),
                _buildInfoSection('Gender',
                    controller.profileData['data']['gender'] ?? 'Robot'),
                _buildInfoSection('Zip Code',
                    controller.profileData['data']['zipCode'] ?? '26500'),
                _buildInfoSection(
                    'State', controller.profileData['data']['state'] ?? 'USA'),
                _buildInfoSection(
                    'City', controller.profileData['data']['city'] ?? 'Sukkur'),
                _buildInfoSection(
                    'Address',
                    controller.profileData['data']['address'] ??
                        'Airport Road Sukkur'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff3A9864),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xff3A9864).withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xff3A9864)),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
