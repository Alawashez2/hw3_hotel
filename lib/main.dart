import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project2/screens/auth/log_in_screen.dart';
import 'package:project2/screens/auth/sign_up_screen.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/services/supabase.dart';
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool canGoHome = false;
  StreamSubscription? listen;

  @override
  void initState() {
        SupabaseService.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        canGoHome = true;
        setState(() {});
      }

      if (event == AuthChangeEvent.signedOut) {
        canGoHome = false;
        setState(() {});
      }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
