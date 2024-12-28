import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home_screens/audio_chat.dart';
import 'package:getx_mvvm/view/home_screens/chat.dart';
import 'package:getx_mvvm/view/home_screens/doctor.dart';
import 'package:getx_mvvm/view/home_screens/initial_screen.dart';
import 'package:getx_mvvm/view/home_screens/profile_screen/profile_screen.dart';
import 'package:getx_mvvm/view/home_screens/tasks_screen.dart';

import '../../models/user_model.dart';
import '../../user_preference/user_preference_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Add GlobalKey
  int _selectedIndex = -1;

  final List<Widget> _screens = [
    const DoctorsScreen(),
    const TaskScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final UserPreference _userPreference = UserPreference();
  String _firstName = '';
  String _lastName = '';
  String _username = '';
  String _email = '';
  String _userId = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    // Fetch the user details
    UserModel user = await _userPreference.getUser();
    // Update the username
    setState(() {
      _firstName = user.user?.firstname ?? 'Guest';
      _lastName = user.user?.lastname ?? 'Guest';
      _username = user.user?.username ?? 'Guest';
      _email = user.user?.email ?? 'someone@gmail.com';
      _userId = user.user?.id ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey, // Assign the key to Scaffold
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              _scaffoldKey.currentState!
                  .openDrawer(); // Use GlobalKey to open the drawer

              // Get.back();
            },
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xff3A9864),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff3A9864),
                ),
                child: const Icon(Icons.menu, color: Colors.white),
              ),
            ),
          ),
        ),
        body: _selectedIndex == -1
            ? const InitialScreen()
            : _screens[_selectedIndex],
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color(0xff3A9864), size: 30)),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  Image.asset('assets/images/splash.png',
                      height: 100, width: 100),
                ],
              ),
              // const SizedBox(height: 20),
              SizedBox(
                height: screenWidth * 0.1,
              ),
              const Text(
                'Community Health Organization',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff175232),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 20),
              SizedBox(
                height: screenWidth * 0.05,
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: Color(0xff3A9864),
                ),
                title: Text(
                  _firstName,
                  style: const TextStyle(
                    color: Color(0xff1C665E),
                  ),
                ),
                subtitle: Text(
                  _username,
                  style: const TextStyle(
                    color: Color(0xff1C665E),
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xff3A9864),
                ),
                onTap: () {
                  HapticFeedback.mediumImpact();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                firstName: _firstName,
                                lastName: _lastName,
                                email: _email,
                                userId: _userId,
                              )));
                },
              ),
              SizedBox(
                height: screenWidth * 0.05,
              ),
              ListTile(
                title: const Text(
                  'Chat History',
                  style: TextStyle(
                    color: Color(0xff175232),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.pop(context);
                  HapticFeedback.mediumImpact();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ChatsScreen(),
                      ));
                },
                leading: const Icon(Icons.list_alt, color: Color(0xff175232)),
              ),
              // const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'Manage Form',
                  style: TextStyle(
                    color: Color(0xff175232),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
                leading: const Icon(Icons.note_alt_outlined,
                    color: Color(0xff175232)),
              ),
              // const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'About Us',
                  style: TextStyle(
                    color: Color(0xff175232),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
                leading:
                    const Icon(Icons.info_outline, color: Color(0xff175232)),
              ),
              // const SizedBox(height: 20),

              // const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'Help and Support',
                  style: TextStyle(
                    color: Color(0xff175232),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
                leading:
                    const Icon(Icons.question_mark, color: Color(0xff175232)),
              ),
              // const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'SignOut',
                  style: TextStyle(
                    color: Color(0xff175232),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  // Clear the saved user data
                  await _userPreference.removeUser();

                  HapticFeedback.mediumImpact();

                  // Navigate to the login screen
                  Get.offNamedUntil(RoutesName.loginScreen, (route) => false);
                },
                leading: const Icon(Icons.logout, color: Color(0xff175232)),
              ),
              // ... Additional ListTiles
            ],
          ),
        ),
        // Modified BottomNavigationBar inside a styled Container
        bottomNavigationBar: Container(
          height: 75,
          margin: EdgeInsets.only(
              left: screenWidth * 0.2, right: screenWidth * 0.2, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.transparent, // Background color of the container
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow effect
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: BottomAppBar(
              color: const Color(0xff3A9864),
              shape: const CircularNotchedRectangle(),
              notchMargin: 6.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildNavItem('assets/images/doctor_icon.svg', 0),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AudioChatScreen()));
                    }, // Call the bottom sheet
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/images/mic.svg',
                        height: 70,
                        width: 60,
                      ),
                    ),
                  ),
                  // buildNavItem('assets/images/mic.svg', 1),
                  buildNavItem('assets/images/task_icon.svg', 1),
                  // buildNavItem('assets/images/profile_icon.svg', 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(String icon, int index) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _onItemTapped(index);
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index
              ? Colors.white.withOpacity(0.4)
              : Colors.transparent,
        ),
        // child: Image.asset(icon, height: 30, width: 30),
        child: Center(child: SvgPicture.asset(icon, height: 40, width: 40)),
      ),
    );
  }
}
