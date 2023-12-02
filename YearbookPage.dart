import 'package:alum_app/pages/WhatsUpPage.dart';
import 'package:flutter/material.dart';

class YearbookPage extends StatelessWidget {
  final int startYear;
  final int endYear;

  YearbookPage({required this.startYear, required this.endYear});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digital Yearbooks")),
      body: ListView.builder(
        itemCount: endYear - startYear + 1,
        itemBuilder: (context, index) {
          final year = endYear - index;
          return ListTile(
            title: Text("Yearbook $year"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhatsUpPage(year)),
              );
            },
          );
        },
      ),
    );
  }
}
