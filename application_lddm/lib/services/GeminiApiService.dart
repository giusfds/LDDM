import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiApiService {
  GeminiApiService();

  Future<String?> uploadAndProcessImage(
      File imageFile, String promptText) async {
    final key = dotenv.env['APIKEY']!;
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: key,
    );

    final Uint8List firstImage = await imageFile.readAsBytes();

    final prompt = TextPart(promptText);
    final imageParts = [DataPart('image/jpeg', firstImage)];

    final response = await model.generateContent([
      Content.multi([prompt, ...imageParts])
    ]);
    print(response.text);
    return response.text;
  }
}
