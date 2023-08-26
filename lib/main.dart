import 'package:flutter/material.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bacrvcbmqedxloniemqk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhY3J2Y2JtcWVkeGxvbmllbXFrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4NjI3OTAsImV4cCI6MjAwODQzODc5MH0.0YPIxoxGLiWBPJGU_EnO_ciutOwdPercYugL3nRRyDI',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
