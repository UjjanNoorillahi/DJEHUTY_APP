import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/health_question_model.dart';

class HealthQuestionsRepository {
  Future<void> submitHealthQuestions(HealthQuestionsModel data) async {
    final url = Uri.parse('https://your-api-endpoint.com/health-questions'); // Replace with actual endpoint
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data.toJson()),
      );

      if (response.statusCode == 200) {
        // Successfully submitted
        print('Data submitted successfully!');
      } else {
        // Handle errors
        print('Failed to submit data: ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }
}
