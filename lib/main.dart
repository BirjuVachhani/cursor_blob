import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return Scaffold(
      body: SizedBox.expand(
        child: CursorBlob(
          child: Stack(
            children: [
              Positioned(
                top: 16,
                right: 16,
                child: TextButton(
                  onPressed: () {
                    launchUrlString(
                        'https://github.com/BirjuVachhani/cursor_blob');
                  },
                  child: const Text('View on Github'),
                ),
              ),
              const Center(
                child: Text(
                  'poppr',
                  style: TextStyle(
                    fontSize: 56,
                    letterSpacing: -4,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16F1D1),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Inspired by ',
                        children: [
                          TextSpan(
                            text: 'poppr.be',
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrlString('https://poppr.be');
                              },
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF16F1D1),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF16F1D1),
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
