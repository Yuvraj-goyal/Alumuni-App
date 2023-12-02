import 'package:flutter/material.dart';

class SendToFriendsPage extends StatelessWidget {
  final int year;
  final String whatsUpText;

  SendToFriendsPage({required this.year, required this.whatsUpText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send to Friends")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("What's up with the Current Me in Year $year: $whatsUpText"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implement logic to send the "What's up with the Current Me" page to selected friends
              // For example, you can use a modal sheet to select friends
              // and use a backend service to send the page
            },
            child: Text("Send to Friends"),
          ),
        ],
      ),
    );
  }
}
