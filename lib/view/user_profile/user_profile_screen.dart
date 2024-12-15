// import 'package:flutter/material.dart';
// import 'package:getx_mvvm/view/widgets/reusable_button.dart';
//
// import '../questions_screen/health_questions.dart';
//
// class UserProfileScreen extends StatelessWidget {
//   const UserProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric( horizontal: screenWidth * 0.05,
//                 vertical: screenHeight * 0.02),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // const SizedBox(height: 40),
//                 SizedBox(height: screenHeight * 0.02),
//                 const Text('User Profile',
//                   style: TextStyle(
//                     color: Color(0xff000000),
//                     fontSize: 18,
//                   ),),
//                 SizedBox(height: screenHeight * 0.02),
//                 Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff3A9864),
//                     borderRadius: BorderRadius.circular(75),
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       const Icon(Icons.person,
//                         color: Colors.white,
//                         size: 90,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                             color: const Color(0xffffffff),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: const Color(0xff3A9864),
//                               width: 1,
//                             ),
//                           ),
//                           child: const Icon(Icons.camera_alt_outlined,
//                             color: Color(0xff3A9864),
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.03),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Phone Number',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Address',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Country',
//                     suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
//                       color: Color(0xff7b7b7b),
//                     ),
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'State',
//                     suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
//                       color: Color(0xff7b7b7b),
//                     ),
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'City',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Zip Code',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Height',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//
//                     ),
//
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Gender',
//                     suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
//                       color: Color(0xff7b7b7b),
//                     ),
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Current Weight',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Goal Weight',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Current Body Fat',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Goal Body Fat',
//                     hintStyle: const TextStyle(
//                       color: Color(0xff7b7b7b),
//                     ),
//                     suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
//                       color: Color(0xff7b7b7b),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 SizedBox(height: screenHeight * 0.02),
//                 ReusableButton(title: 'Save', onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HealthQuestionsScreen()));
//                 }),
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }
//
// //

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/user_profile/user_profile_controller.dart';
import 'package:getx_mvvm/view/widgets/reusable_button.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    'User Profile',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Obx(() => GestureDetector(
                        onTap: () => showImagePickerDialog(context),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: const Color(0xff3A9864),
                          backgroundImage: controller
                                  .profilePhoto.value.isNotEmpty
                              ? FileImage(File(controller.profilePhoto.value))
                              : null,
                          child: controller.profilePhoto.value.isEmpty
                              ? const Icon(Icons.person,
                                  size: 90, color: Colors.white)
                              : null,
                        ),
                      )),
                  SizedBox(height: screenHeight * 0.03),
                  buildTextField(
                      controller.phoneNumberController, 'Phone Number', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.addressController, 'Address', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.countryController, 'Country', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.stateController, 'State', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.cityController, 'City', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                      controller.zipCodeController, 'Zip Code', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.ageController, 'Age', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.heightController, 'Height', true),
                  SizedBox(height: screenHeight * 0.02),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedGender.value,
                      onChanged: (value) =>
                          controller.selectedGender.value = value!,
                      items: controller.genderList
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.currentWeightController,
                      'Current Weight', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                      controller.goalWeightController, 'Goal Weight', true),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(controller.currentBodyFatController,
                      'Current Body Fat', true),

                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                      controller.goalBodyFatController, 'Goal Body Fat', true),

                  SizedBox(height: screenHeight * 0.02),
                  // Obx(() => ElevatedButton(
                  //
                  //
                  //
                  //   onPressed: controller.isLoading.value ? null : controller.saveProfile,
                  //   child: controller.isLoading.value
                  //       ? const CircularProgressIndicator(color: Colors.white)
                  //       : const Text('Save'),
                  // )
                  //
                  //
                  //
                  // ),

                  Obx(() => ReusableButton(
                      title: 'Save',
                      onPressed: controller.saveProfile,
                      isLoading: controller.isLoading.value)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String hint, bool isRequired) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      validator: isRequired
          ? (value) =>
              value == null || value.isEmpty ? '$hint is required' : null
          : null,
    );
  }

  void showImagePickerDialog(BuildContext context) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () => controller.pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () => controller.pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
