// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> sendEvaluationRequest(
  String assessmentID,
  int creditsUsed,
  int levels,
  int maxLevelScore,
  List<String> toolsUsed,
  List<dynamic> response,
  String authToken,
) async {
  final String url = 'http://24.199.69.208:3333/api/evaluations';

  final Map<String, dynamic> requestBody = {
    "assessmentId": assessmentID,
    "creditsUsed": creditsUsed,
    "levels": levels,
    "maxLevelScore": maxLevelScore,
    "response": response,
    "toolsUsed": toolsUsed,
  };

  try {
    final http.Response httpResponse = await http.post(
      Uri.parse(url),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (httpResponse.statusCode == 200) {
      return httpResponse.body; // Return the raw JSON string
    } else {
      return 'Error: ${httpResponse.statusCode}';
    }
  } catch (e) {
    return 'Error: $e';
  }
}
