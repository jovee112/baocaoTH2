import 'package:flutter/material.dart';
import 'ui/home_screen.dart';
import 'ui/smart_note_theme.dart';

void main() {
  runApp(const SmartNoteApp());
}

class SmartNoteApp extends StatelessWidget {
  const SmartNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Note',
      theme: SmartNoteTheme.theme,
      home: const HomeScreen(),
    );
  }
}
