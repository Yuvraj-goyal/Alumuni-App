import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gtk_flutter/profile_creation.dart';

class YearbookPage extends StatefulWidget {
  const YearbookPage({super.key});

  @override
  State<YearbookPage> createState() => _YearbookPageState();
}

class _YearbookPageState extends State<YearbookPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    // The path in Firebase Storage where the yearbook images are stored
    final ListResult result = await storage.ref('yearbook 2020').listAll();

    for (var file in result.items) {
      final String url = await file.getDownloadURL();
      files.add({
        "url": url,
        "path": file.fullPath,
      });
    }

    return files;
  }

  //send image to profile page
  void _navigateToProfileCreation(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileCreationPage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/reunion-85acb.appspot.com/o/yearbook%202020%2Fimg5.webp?alt=media&token=52ae4bac-a1ef-408c-81bd-d590e3f7081c'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
        future: _loadImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _navigateToProfileCreation(
                        context, snapshot.data![index]['path']),
                    child: Image.network(
                      snapshot.data![index]['url'],
                      fit: BoxFit.cover,
                    ),
                  );
                });
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
