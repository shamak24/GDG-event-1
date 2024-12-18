import 'dart:io';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.imageFile});
  final File imageFile;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _textController = TextEditingController();
  bool _loading = false;
  int _retryCount = 0;
  static const maxRetries = 3;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }


  Future<void> _initializeChat() async {
    // Complete the initialization code for the chat here
  }


  Future<bool> _checkConnectivity() async {
    // Complete the connectivity check code here
    return true;
  }


  Future<void> _checkConnectivityAndSendImage() async {
    // Complete the image sending logic based on connectivity here
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('No Internet Connection'),
        content:
        const Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _checkConnectivityAndSendImage(); // Placeholder
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }


  Future<void> _sendWithRetry(Future<void> Function() operation) async {
    // Complete the retry logic here
  }


  Future<void> _sendImage(File imageFile) async {
    // Complete the image sending logic here
  }


  Future<void> _sendMessage(String message) async {
    // Complete the message sending logic here
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    if (message['content'] is File) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber.shade300),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            message['content'],
            width: 280,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: message['isUser']
                ? [Colors.amber.shade400, Colors.amber.shade600]
                : [Colors.amber.shade100, Colors.amber.shade200],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: MarkdownBody(
          data: message['content'],
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              color: message['isUser'] ? Colors.white : Colors.black87,
              fontSize: 16,
              height: 1.4,
            ),
            code: TextStyle(
              backgroundColor: Colors.amber.shade50,
              color: Colors.black87,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Solution',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "SF Pro",
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index)  {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                    alignment: message['isUser']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: _buildMessage(message),
                  ),
                );
              },
            ),
          ),
          if (_loading)
            Container(
              padding: const EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.amber.shade100,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.amber.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.shade100,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Ask follow-up questions...',
                      hintStyle: TextStyle(color: Colors.brown.shade300),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: _sendMessage, // Placeholder
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded),
                    onPressed: () => _sendMessage(_textController.text), // Placeholder
                    color: Colors.brown,
                    splashRadius: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}