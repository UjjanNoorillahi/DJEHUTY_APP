import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/widgets/reusable_button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HealthQuestionsScreen extends StatefulWidget {
  const HealthQuestionsScreen({super.key});

  @override
  _HealthQuestionsScreenState createState() => _HealthQuestionsScreenState();
}

class _HealthQuestionsScreenState extends State<HealthQuestionsScreen> {
  // Map of UI-friendly labels to API-required keys
  final Map<String, String> healthRiskMapping = {
    'Have dizzy spells': 'Have_dizzy_spells',
    'High Cholesterol': 'High_cholesterol',
    'Bone or joint problems': 'Bone_of_joint_problems',
    'Heart Problems': 'Heart_Problems',
    'Currently Pregnant': 'Currently_pregnant',
    'Diabetes': 'Diabetes',
    'Thyroid': 'Thyroid',
    'Prior Heart Attack or Stroke': 'Heart_attack',
    'Arthritis': 'Arthritis',
    'Asthma or Lung Problem': 'lung_problem',
    'High Blood Pressure': 'High_BP',
    'Spine or disc problem': 'Spine_or_disc_problem',
    'Surgery in the past 6 months': 'Surgery_in_6_months',
  };

  final Map<String, bool> selectedRisks = {};
  final TextEditingController familyHistoryController = TextEditingController();

  String userId = '';
  void getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString('userId')!;
    debugPrint('User ID: $userId');
  }

  bool isLoading = false;
  // Retrieve user details
  @override
  void initState() {
    super.initState();
    getUser();
    // Initialize risk selections to false
    for (var key in healthRiskMapping.keys) {
      selectedRisks[key] = false;
    }
  }

  Future<void> _updateHealthQuestions() async {
    setState(() {
      isLoading = true;
    });
    const String baseURL = AppUrl.baseUrl;
    String endpoint = '$baseURL/health/updateHealthQuestionByUserId/$userId';

    // Prepare data for the API call. Include only risks that are selected (true).
    final Map<String, dynamic> healthData = {
      for (var entry in healthRiskMapping.entries)
        if (selectedRisks[entry.key] ?? false)
          entry.value: true, // Include only selected risks
    };

    // Add family history to the health data if it is not empty.
    if (familyHistoryController.text.isNotEmpty) {
      healthData['Family_history_of_above_conditions'] =
          familyHistoryController.text;
    }

    try {
      // Convert the healthData map to a JSON-encoded string
      final jsonBody = jsonEncode(healthData);

      // API Call
      final response = await http.put(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'}, // JSON content type
        body: jsonBody, // Send the JSON-encoded body
      );

      // Debug logs
      print("Request Body: $jsonBody");
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Handle response
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //       content: Text('Health questions updated successfully!')),
        // );

        // SnackBar(
        //   content: Text('Health questions updated successfully!'),
        // );

        Get.snackbar('Success', 'Health questions updated successfully!');
        Get.offNamedUntil(RoutesName.interviewQuestions, (route) => false);
        familyHistoryController.clear();
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to update health questions: ${response.body}')),
        );
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Health Questions'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please check any of the following health risks you currently have now or have had in the past.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: healthRiskMapping.keys.map((label) {
                    return CheckboxListTile(
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
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Do you have any family history of the above conditions?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: familyHistoryController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'If yes, explain:',
                    hintStyle: const TextStyle(color: Color(0xff7b7b7b)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ReusableButton(
                  onPressed: _updateHealthQuestions,
                  isLoading: isLoading,
                  title: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
