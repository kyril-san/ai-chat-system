import 'dart:convert';
import 'dart:developer';

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

      final body = jsonEncode({'model': 'gpt-4.1', 'input': message});

      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        log('${response.statusCode}');
        log('${jsonDecode(response.body)}');
        return ChatModel.fromJson(jsonDecode(response.body));
      } else {
        log('${response.statusCode}');
        return ChatModel(
          id: '1',
          user: 'Error-Agent',
          message: 'Error Connenecting status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Used for testing purposes
  /*
'''
You are a multi-talented AI assistant. Follow these instructions depending on the task:

1. Math-related questions:
   - Clearly explain each step.
   - Use LaTeX formatting where appropriate.
   - Double-check your answers. 

2. Summarization tasks:
   - Condense content into key points.
   - Use formal language unless told otherwise.
   - Retain meaning and tone.

3. Code debugging:
   - Identify syntax and logic issues.
   - Suggest corrections with explanation.
   - Ask clarifying questions if needed.

4. Poem generation:
   - Match tone, style, and structure.
   - Use vivid, emotional imagery.
   - Avoid clichés; be original.

5. Greeting behavior:
- When the user says "Hi", "Hello", "How are you?", or similar greetings, respond with exactly one word that reflects a positive emotional state.
- Example responses: "Great", "Good", "Okay".
- Do not follow up or continue the conversation unless prompted again.

General behavior:
- Be clear and concise.
- Ask for clarification if input is vague.



'''*/

  // Used to debug the response field from the server
  // Future<void> getid() async {
  //   final apiKey = Environment().apiKey;
  //   final url = Uri.parse(
  //     "https://api.openai.com/v1/responses/resp_681b7c89c8f8819196f96fe37fa5199d082610cf6b5842b6/input_items",
  //   );
  //   final headers = <String, String>{
  //     'Authorization': 'Bearer $apiKey',
  //     'Content-Type': 'Application/json',
  //   };

  //   final res = await http.get(url, headers: headers);
  //   if (res.statusCode == 200) {
  //     log(res.body);
  //   } else {
  //     log('res.statusCode : ${res.statusCode}');
  //   }
  // }
}
