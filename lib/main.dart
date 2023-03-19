import 'package:flutter/material.dart';
import 'cursor_blob.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cursor Blob',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF191919),
        // scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: CursorBlob(
          child: Center(
            child: Text(
              'poppr',
              style: TextStyle(
                fontSize: 56,
                letterSpacing: -4,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16F1D1),
              ),
            ),
          )
          ),
        ),
    );
  }
}
