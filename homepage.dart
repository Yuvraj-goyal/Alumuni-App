import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gallerywidget.dart';

const whitecolor = Colors.white;
const blackcolor = Colors.black;
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    'assets/images/a.jpg',
    'assets/images/b.jpg',
    'assets/images/c.jpg',
    'assets/images/d.jpg',
  ];
  var transformedImages = [];

  Future<dynamic> getSizeOfImages() async {
    transformedImages = [];
    for (int i = 0; i < urlImages.length; i++) {
      final imageObject = {};
      await rootBundle.load(urlImages[i]).then((value) => {
        imageObject['path'] = urlImages[i],
        imageObject['size'] = value.lengthInBytes,
      });
      transformedImages.add(imageObject);
    }
  }
  @override
  void initState() {
    getSizeOfImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whitecolor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: blackcolor),
        ),
        iconTheme: const IconThemeData(color: blackcolor),
      ),
      // Body area
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: const BoxDecoration(
                        color: whitecolor,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return RawMaterialButton(
                            child: InkWell(
                              child: Ink.image(
                                image: AssetImage(transformedImages\[index\]['path']),
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GalleryWidget(
                                        urlImages: urlImages,
                                        index: index,
                                      )));
                            },
                          );
                        },
                        itemCount: transformedImages.length,
                      )))
            ],
          )),
    );
  }
}