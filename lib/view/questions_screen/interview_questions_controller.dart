// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class InterviewQuestionsController extends GetxController {
//   // Define all the fields required for the request body
//   var significantEvents = ''.obs;
//   var time = false.obs;
//   var lackOfSupport = false.obs;
//   var money = false.obs;
//   var procrastination = false.obs;
//   var motivation = false.obs;
//   var nutrition = false.obs;
//   var boredom = false.obs;
//   var lackOfExpertise = false.obs;
//   var injury = false.obs;
//   var meals = ''.obs;
//   var sodas = ''.obs;
//   var snacks = ''.obs;
//   var loseFat = false.obs;
//   var improveHealth = false.obs;
//   var lookBetter = false.obs;
//   var knowledge = false.obs;
//   var gainWeight = false.obs;
//   var improveMuscleTone = false.obs;
//   var feelBetter = false.obs;
//   var exerciseKnowledge = 1.obs;
//   var formAndTechnique = 1.obs;
//   var selfDiscipline = 1.obs;
//
//
//   // Reactive map to hold selected risks
//   var selectedRisks = <dynamic, bool>{}.obs;
//
//   // Method to update selected risks, only sending selected (true) values
//   void updateSelectedRisks(Map<dynamic, bool> updatedRisks) {
//     // Filter out the unselected values (those with false)
//     var selectedOnly = Map.fromIterable(
//       updatedRisks.entries.where((entry) => entry.value).map((entry) => entry.key),
//       key: (item) => item,
//       value: (item) => true, // Assign true for selected risks
//     );
//
//     selectedRisks.assignAll(selectedOnly); // Update the reactive map
//   }
//
//
//
//
//
//
//   // Reactive map to store selected health goals
//   var selectedHealthGoals = <String, bool>{}.obs;
//
//   // Method to update the selected health goals
//   void updateSelectedGoals(Map<String, bool> updatedGoals) {
//     // Filter out the unselected values (those with false)
//     var selectedOnly = <String, bool>{};
//
//     updatedGoals.forEach((key, value) {
//       if (value) {
//         selectedOnly[key] = value;
//       }
//     });
//
//     selectedHealthGoals.assignAll(selectedOnly); // Update the reactive map
//   }
//
//
//
//   // Reactive variable to store the selected number for Question 5
//   var selectedNumber = RxInt(-1);
//
//   // Method to update the selected number
//   void updateSelectedNumber(int number) {
//     selectedNumber.value = number;
//   }
//
//
//   // Method to submit the data
//   Future<void> submitInterviewQuestions() async {
//     // Create the request body using the controller values
//     final Map<String, dynamic> requestBody = {
//       "significant_events": significantEvents.value,
//       "time": time.value,
//       "Lack_Of_Support": lackOfSupport.value,
//       "money": money.value,
//       "procrastination": procrastination.value,
//       "motivation": motivation.value,
//       "nutrition": nutrition.value,
//       "boredom": boredom.value,
//       "lack_of_expertise": lackOfExpertise.value,
//       "injury": injury.value,
//       "meals": meals.value,
//       "sodas": sodas.value,
//       "snacks": snacks.value,
//       "lose_fat": loseFat.value,
//       "improve_health": improveHealth.value,
//       "look_better": lookBetter.value,
//       "knowledge": knowledge.value,
//       "gain_weight": gainWeight.value,
//       "improve_muscle_tone": improveMuscleTone.value,
//       "feel_better": feelBetter.value,
//       "exercise_Knowledge": exerciseKnowledge.value,
//       "form_and_technique": formAndTechnique.value,
//       "self_discipline": selfDiscipline.value,
//     };
//
//     // Send PUT request to the API
//     try {
//       final response = await http.put(
//         Uri.parse('http://3.141.13.123:3000/api/interview/updateInterviewQuestionByUserId/675abecfc80c58bbceeba35f'),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(requestBody),
//       );
//
//       print("Request Body: ${json.encode(requestBody)}");
//       print("Response Body: ${json.encode(response.body)}");
//       print("Response StatusCode: ${json.encode(response.statusCode)}");
//       print("Response StatusCode: ${json.encode(response)}");
//
//       if (response.statusCode == 200) {
//         Get.snackbar('Success', 'Interview questions updated successfully');
//       } else {
//         Get.snackbar('Error', 'Failed to update interview questions');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to connect to the server');
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/routes/routes_name.dart';

class InterviewQuestionsController extends GetxController {
  RxBool loading = false.obs;

  // Define all the fields required for the request body
  var significantEvents = ''.obs;
  var time = false.obs;
  var lackOfSupport = false.obs;
  var money = false.obs;
  var procrastination = false.obs;
  var motivation = false.obs;
  var nutrition = false.obs;
  var boredom = false.obs;
  var lackOfExpertise = false.obs;
  var injury = false.obs;
  var meals = ''.obs;
  var sodas = ''.obs;
  var snacks = ''.obs;
  var loseFat = false.obs;
  var improveHealth = false.obs;
  var lookBetter = false.obs;
  var knowledge = false.obs;
  var gainWeight = false.obs;
  var improveMuscleTone = false.obs;
  var feelBetter = false.obs;
  var exerciseKnowledge = 0.obs;
  var formAndTechnique = 0.obs;
  var selfDiscipline = 0.obs;

  var selectedRisks = <String, bool>{}.obs;
  var selectedHealthGoals = <String, bool>{}.obs;

  // void updateSelectedRisks(
  //     Map<String, bool> updatedRisks, Map<String, String> healthRiskMapping) {
  //   // Filter out the unselected values (those with false)
  //   var selectedOnly = Map.fromEntries(
  //     updatedRisks.entries.where((entry) => entry.value).map((entry) {
  //       var key = entry.key;
  //       var value = healthRiskMapping[key];
  //       return MapEntry(value, true); // Assign true for selected risks
  //     }),
  //   );
  //
  //   print('Selected Risks: $selectedOnly');
  // }

  // void updateSelectedRisksAndSend(
  //     Map<String, String> healthRiskMapping, Map<String, RxBool> boolValues) {
  //   // Create a map for the selected risks
  //   final Map<String, bool> selectedRisks = {};
  //
  //   // Iterate through the boolean values
  //   boolValues.forEach((key, value) {
  //     if (value.value) {
  //       // Check if the value is true
  //       final apiParameter = healthRiskMapping[key]; // Get the API parameter
  //       if (apiParameter != null) {
  //         selectedRisks[apiParameter] = true; // Add to selected risks
  //       }
  //     }
  //   });
  //
  //   // Print or send the selected risks to the API
  //   print('Selected Risks for API: $selectedRisks');
  //
  //   // Update the `obs` values
  //   selectedRisks.forEach((apiKey, isSelected) {
  //     switch (apiKey) {
  //       case 'time':
  //         time.value = isSelected;
  //         break;
  //       case 'Lack_Of_Support':
  //         lackOfSupport.value = isSelected;
  //         break;
  //       case 'money':
  //         money.value = isSelected;
  //         break;
  //       case 'procrastination':
  //         procrastination.value = isSelected;
  //         break;
  //       case 'motivation':
  //         motivation.value = isSelected;
  //         break;
  //       case 'nutrition':
  //         nutrition.value = isSelected;
  //         break;
  //       case 'boredom':
  //         boredom.value = isSelected;
  //         break;
  //       case 'lack_of_expertise':
  //         lackOfExpertise.value = isSelected;
  //         break;
  //       case 'injury':
  //         injury.value = isSelected;
  //         break;
  //       default:
  //         break;
  //     }
  //   });
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  void updateSelectedRisksAndSend(
      Map<String, bool> updatedRisks, Map<String, String> healthRiskMapping) {
    // Filter selected risks and map them to API parameters
    final selectedOnly = updatedRisks.entries
        .where((entry) => entry.value) // Filter selected risks
        .map((entry) => healthRiskMapping[entry.key]) // Map to API parameters
        .whereType<String>() // Remove null values
        .toList();

    print('Selected Risks for API: $selectedOnly');

    // Assign true to corresponding observables
    for (var risk in selectedOnly) {
      switch (risk) {
        case 'time':
          time.value = true;
          break;
        case 'Lack_Of_Support':
          lackOfSupport.value = true;
          break;
        case 'money':
          money.value = true;
          break;
        case 'procrastination':
          procrastination.value = true;
          break;
        case 'motivation':
          motivation.value = true;
          break;
        case 'nutrition':
          nutrition.value = true;
          break;
        case 'boredom':
          boredom.value = true;
          break;
        case 'lack_of_expertise':
          lackOfExpertise.value = true;
          break;
        case 'injury':
          injury.value = true;
          break;
        // Add other cases if needed
        default:
          print('No matching observable for: $risk');
          break;
      }
    }
  }

  String userId = '';
  void getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString('userId')!;
    debugPrint('User ID: $userId');
  }

  // Method to update the selected health goals
  void updateSelectedGoals(
      Map<String, bool> updatedRisks, Map<String, String> healthRiskMapping) {
    // Filter selected risks and map them to API parameters
    final selectedOnly = updatedRisks.entries
        .where((entry) => entry.value) // Filter selected risks
        .map((entry) => healthRiskMapping[entry.key]) // Map to API parameters
        .whereType<String>() // Remove null values
        .toList();

    print('Selected Risks for API: $selectedOnly');
    // Assign true to corresponding observables
    for (var risk in selectedOnly) {
      switch (risk) {
        case 'lose_fat':
          loseFat.value = true;
          break;
        case 'improve_health':
          improveHealth.value = true;
          break;
        case 'look_better':
          lookBetter.value = true;
          break;
        case 'knowledge':
          knowledge.value = true;
          break;
        case 'gain_weight':
          gainWeight.value = true;
          break;
        case 'improve_muscle_tone':
          improveMuscleTone.value = true;
          break;
        case 'feel_better':
          feelBetter.value = true;
          break;
        // Add other cases if needed
        default:
          print('No matching observable for: $risk');
          break;
      }
    }
  }

  // Reactive variable to store the selected number for Question 5
  var selectedNumber = RxInt(-1);

  // Method to update the selected number
  void updateSelectedNumber(int number, String title) {
    // selectedNumber.value = number;
    if (title == 'Exercise Knowledge') {
      exerciseKnowledge.value = number + 1;
    } else if (title == 'Form and Technique') {
      formAndTechnique.value = number + 1;
    } else if (title == 'Self Discipline') {
      selfDiscipline.value = number + 1;
    }
  }

  // Method to submit the data
  Future<void> submitInterviewQuestions() async {
    loading.value = true;
    // Create the request body using the controller values
    final Map<String, dynamic> requestBody = {
      "significant_events": significantEvents.value,
      "time": time.value,
      "Lack_Of_Support": lackOfSupport.value,
      "money": money.value,
      "procrastination": procrastination.value,
      "motivation": motivation.value,
      "nutrition": nutrition.value,
      "boredom": boredom.value,
      "lack_of_expertise": lackOfExpertise.value,
      "injury": injury.value,
      "meals": meals.value,
      "sodas": sodas.value,
      "snacks": snacks.value,
      "lose_fat": loseFat.value,
      "improve_health": improveHealth.value,
      "look_better": lookBetter.value,
      "knowledge": knowledge.value,
      "gain_weight": gainWeight.value,
      "improve_muscle_tone": improveMuscleTone.value,
      "feel_better": feelBetter.value,
      "exercise_Knowledge": exerciseKnowledge.value,
      "form_and_technique": formAndTechnique.value,
      "self_discipline": selfDiscipline.value,
    };

    print("Request Body from API: ${json.encode(requestBody)}");

    var url =
        "${AppUrl.baseUrl}/interview/updateInterviewQuestionByUserId/$userId";

    print("URL: $url");

    // Send PUT request to the API
    try {
      final response = await http.put(
        Uri.parse(
            "${AppUrl.baseUrl}/interview/updateInterviewQuestionByUserId/$userId"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      print("Request Body: ${json.encode(requestBody)}");

      print("StatusCode: ${response.statusCode}");
      print("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Success', 'Interview questions updated successfully');

        Get.offNamedUntil(RoutesName.homeScreen, (route) => false);
      } else {
        loading.value = false;
        Get.snackbar('Error', 'Failed to update interview questions');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Error', 'Failed to connect to the server');
    }
  }
}
