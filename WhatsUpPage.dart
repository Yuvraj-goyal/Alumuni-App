import 'package:alum_app/pages/SendToFriendsPage.dart';
import 'package:flutter/material.dart';

class WhatsUpPage extends StatefulWidget {
  final int year;

  WhatsUpPage(this.year);

  @override
  _WhatsUpPageState createState() => _WhatsUpPageState();
}

class _WhatsUpPageState extends State<WhatsUpPage> {
  final TextEditingController _whatsUpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What's Up with the Current Me")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Selected Photo for Year ${widget.year}"),
            const SizedBox(height: 16),
            TextField(
              controller: _whatsUpController,
              decoration: InputDecoration(labelText: "What's up with the Current Me"),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendToFriendsPage(
                      year: widget.year,
                      whatsUpText: _whatsUpController.text,
                    ),
                  ),
                );
              },
              child: Text("Next: Send to Friends"),
            ),
          ],
        ),
      ),
    );
  }
}
