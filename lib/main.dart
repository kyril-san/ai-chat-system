import 'package:ai_chat_system/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI CHAT SYSTEM',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.blueGrey[800],
        bottomSheetTheme: BottomSheetThemeData(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          modalElevation: 0,
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,

          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),

      home: const HomePage(),
    );
  }
}
