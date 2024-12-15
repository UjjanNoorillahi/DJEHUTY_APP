// import 'package:get/get.dart';
//
// import '../../models/health_question_model.dart';
// import '../../repository/health_question_repository.dart';
//
// class HealthQuestionsController extends GetxController {
//   final HealthQuestionsRepository repository = HealthQuestionsRepository();
//   final Rx<HealthQuestionsModel> healthQuestionsModel = HealthQuestionsModel().obs;
//   RxList<bool> options = List.filled(5, false).obs; // Initialize all as false
//
//   final RxBool isLoading = false.obs;
//
//   void updateRisk(String risk, bool value) {
//     switch (risk) {
//       case 'Have dizzy spells':
//         healthQuestionsModel.value.haveDizzySpells = value;
//         break;
//       case 'High Cholesterol':
//         healthQuestionsModel.value.highCholesterol = value;
//         break;
//       case 'Bone of joint problems':
//         healthQuestionsModel.value.boneOfJointProblems = value;
//         break;
//       case 'Hear Problems':
//         healthQuestionsModel.value.heartProblems = value;
//         break;
//       case 'Currently Pregnant':
//         healthQuestionsModel.value.currentlyPregnant = value;
//         break;
//       case 'Diabetes or Thyroid Condition':
//         healthQuestionsModel.value.diabetes = value;
//         healthQuestionsModel.value.thyroid = value;
//         break;
//       case 'Prior Heart Attack or Stroke':
//         healthQuestionsModel.value.heartAttack = value;
//         break;
//       case 'Arthritis':
//         healthQuestionsModel.value.arthritis = value;
//         break;
//       case 'Asthma or Lung Problem':
//         healthQuestionsModel.value.lungProblem = value;
//         break;
//       case 'High Blood Pressure':
//         healthQuestionsModel.value.highBP = value;
//         break;
//       case 'Spine or disc problem':
//         healthQuestionsModel.value.spineOrDiscProblem = value;
//         break;
//       case 'Surgery in the past 6 months':
//         healthQuestionsModel.value.surgeryIn6Months = value;
//         break;
//       default:
//         print('Unknown risk: $risk');
//     }
//     healthQuestionsModel.refresh(); // Update state
//   }
//
//   void updateFamilyHistory(String value) {
//     healthQuestionsModel.value.familyHistoryOfAboveConditions = value;
//     healthQuestionsModel.refresh();
//   }
//
//   Future<void> submit() async {
//     isLoading.value = true;
//     try {
//       await repository.submitHealthQuestions(healthQuestionsModel.value);
//       Get.snackbar('Success', 'Health questionnaire submitted successfully!');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to submit the questionnaire.');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InterviewQuestionsController extends GetxController {
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
  var exerciseKnowledge = 1.obs;
  var formAndTechnique = 1.obs;
  var selfDiscipline = 1.obs;

  // Method to submit the data
  Future<void> submitInterviewQuestions() async {
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

    // Send PUT request to the API
    try {
      final response = await http.put(
        Uri.parse('http://3.141.13.123:3000/api/interview/updateInterviewQuestionByUserId/673ed3615775804943a27fe5'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Interview questions updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update interview questions');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to connect to the server');
    }
  }
}
