import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  String get baseurl => dotenv.env['BASEURL'] ?? '';
  String get apiKey => dotenv.env['API_KEYS'] ?? '';
}
