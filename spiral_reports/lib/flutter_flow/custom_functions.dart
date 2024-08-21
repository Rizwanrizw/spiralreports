import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

bool workEmailCheck(String email) {
  // List of known free email providers
  List<String> freeEmailProviders = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com',
    'outlook.com'
  ];

  // Extracting the domain from the email
  String domain = email.split('@').last.toLowerCase();

  // Checking if the domain is in the list of free email providers
  if (freeEmailProviders.contains(domain)) {
    return false; // It's a free email provider
  } else {
    return true; // It's a company domain email
  }
}

List<dynamic>? assessmentSearch(
  List<dynamic>? assessmentList,
  String searchString,
) {
  // Search Through the assessmentList JSON for the searchString and return results that has similar strings
  if (assessmentList == null || searchString.isEmpty) {
    return null;
  }

  final List<dynamic> results = [];

  for (final assessment in assessmentList) {
    final String title = assessment['title'] ?? '';
    final String description = assessment['description'] ?? '';

    if (title.toLowerCase().contains(searchString.toLowerCase()) ||
        description.toLowerCase().contains(searchString.toLowerCase())) {
      results.add(assessment);
    }
  }

  return results.isEmpty ? null : results;
}

bool? checkJWTExpiry(String authToken) {
  // Check if the JWT token "authToken" is expired and return true if it is expired
  final parts = authToken.split('.');
  if (parts.length != 3) {
    return null;
  }
  final payload =
      json.decode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  if (payload['exp'] == null) {
    return null;
  }
  final expiry = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
  return DateTime.now().isAfter(expiry);
}

List<OptionsStruct> getFilteredOptions(
  int level,
  List<OptionsStruct> options,
) {
  // take in the "options" and then return the list of options that match the level given as the argument
  return options.where((option) => option.level == level).toList();
}

List<dynamic> convertQuestionSetToJson(List<QuestionSetStruct> questionSet) {
  return questionSet
      .map((qs) => {
            'question': qs.question,
            'options': qs.options
                .map((option) => {
                      'text': option.text,
                      'level': option.level,
                    })
                .toList(),
            'considerScore': qs.considerScore,
          })
      .toList();
}

List<dynamic>? mapResponseStructToJson(List<ResponseStruct>? userResponse) {
  if (userResponse == null) return null;

  // Convert the list of ResponseStruct objects to a list of maps
  List<Map<String, dynamic>> mappedResponse = userResponse.map((response) {
    return {
      'question': response.question,
      'options': response.options
          .map((option) => {
                'text': option.text,
                'level': option.level,
              })
          .toList(),
      'considerScore': response.considerScore,
    };
  }).toList();

  // Return the list of maps (JSON objects)
  return mappedResponse;
}
