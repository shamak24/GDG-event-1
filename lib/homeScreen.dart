import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    // Placeholder code: Image picking will happen here during the event

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "SF Pro",
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),
          const Text(
            'Upload Math Question',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                    // during event
                  ),
                  SizedBox(width: isSmallScreen ? 12 : 20),
                  Expanded(
                    child: SizedBox(),
                    // during event
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}