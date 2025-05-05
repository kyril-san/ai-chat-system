import 'dart:convert';

import 'package:ai_chat_system/Data/environment/environment.dart';
import 'package:ai_chat_system/Data/models/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatApi {
  Future<ChatModel> sendchatmessage({required String message}) async {
    try {
      final uri = Environment().baseurl;
      final apiKey = Environment().apiKey;
      final url = Uri.parse(uri);

      final headers = <String, String>{
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'Application/json',
      };

      final body = jsonEncode({});

      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print(response);
      }

      return ChatModel(id: '1', user: '0', message: '0');
    } catch (e) {
      throw Exception(e);
    }
  }
}
