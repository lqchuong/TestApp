import 'dart:convert';
import 'dart:io';

import 'package:acecook/src/pages/scan/result_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/services.dart' show rootServices;
import 'package:path_provider/path_provider.dart';

class ExampleCameraOverlay extends StatefulWidget {
  const ExampleCameraOverlay({Key? key}) : super(key: key);

  @override
  _ExampleCameraOverlayState createState() => _ExampleCameraOverlayState();
}

class _ExampleCameraOverlayState extends State<ExampleCameraOverlay> {
  OverlayFormat format = OverlayFormat.cardID1;
  int tab = 0;
  final textRecognizer = TextRecognizer();
  ScreenshotController screenshotController = ScreenshotController();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        onTap: (value) {
          setState(() {
            tab = value;
          });
          switch (value) {
            case (0):
              setState(() {
                format = OverlayFormat.cardID1;
              });
              break;
            case (1):
              setState(() {
                format = OverlayFormat.cardID3;
              });
              break;
            case (2):
              setState(() {
                format = OverlayFormat.simID000;
              });
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Bankcard',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'US ID'),
          BottomNavigationBarItem(icon: Icon(Icons.sim_card), label: 'Sim'),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: TextStyle(color: Colors.black),
                  ));
            }
            return CameraOverlay(
              snapshot.data!.first,
              CardOverlay(ratio: 8, cornerRadius: 0.1),
              (XFile file) =>
                  //   // _scanImage(file.path),
                  showDialog(
                context: context,
                barrierColor: Colors.black,
                builder: (context) {
                  screenshotController
                      .capture(delay: Duration(milliseconds: 10))
                      .then((capturedImage) async {
                    _scanImage(capturedImage!);
                    // ShowCapturedWidget(context, capturedImage!);
                  }).catchError((onError) {
                    print(onError);
                  });

                  CardOverlay overlay =
                      CardOverlay(ratio: 8, cornerRadius: 0.1);
                  return Column(
                    children: [
                      AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        backgroundColor: Colors.black,
                        title: const Text('Capture',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                        actions: [
                          OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Icon(Icons.close)),
                          OutlinedButton(
                              onPressed: () {
                                screenshotController
                                    .capture(delay: Duration(milliseconds: 10))
                                    .then((capturedImage) async {
                                  _scanImage(capturedImage!);
                                  // ShowCapturedWidget(context, capturedImage!);
                                }).catchError((onError) {
                                  print(onError);
                                });
                                // _scanImage(file.path);
                              },
                              child: const Icon(Icons.ac_unit))
                        ],
                        content: Screenshot(
                          controller: screenshotController,
                          child: SizedBox(
                              width: double.infinity,
                              child: AspectRatio(
                                aspectRatio: overlay.ratio!,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: FractionalOffset.center,
                                    image: FileImage(
                                      File(file.path),
                                    ),
                                  )),
                                ),
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
              info:
                  'Position your card within the rectangle and ensure the image is perfectly readable.',
              label: 'Scanning Card',
            );
          } else {
            return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fetching cameras',
                  style: TextStyle(color: Colors.black),
                ));
          }
        },
      ),
    ));
  }

  Future<String> convertImageToFile(Uint8List data) async {
    final path =
        '${(await getTemporaryDirectory()).path}/file_name${DateTime.now()}.png';
    File(path).writeAsBytes(data);
    print(path);
    final result = await ImageGallerySaver.saveFile(
        '${(await getTemporaryDirectory()).path}/file_name${DateTime.now()}.png');

    return '${(await getTemporaryDirectory()).path}/file_name${DateTime.now()}.png';
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Column(
          children: [
            Center(child: Image.memory(capturedImage)),
            OutlinedButton(
                onPressed: () async {
                  final path = await convertImageToFile(capturedImage);
                  _scanImage(capturedImage);
                },
                child: const Icon(Icons.close)),
          ],
        ),
      ),
    );
  }

  Future<void> _scanImage(Uint8List data) async {
    //show image with  Uint8List capturedImage
    // Center(child: Image.memory(capturedImage)),
    //get path document
    final directory = await getApplicationDocumentsDirectory();
    //get path image
    final pathOfImage = await File('${directory.path}/legendary.png').create();
    //write data to path image
    await pathOfImage.writeAsBytes(data);

    //get input image
    final inputImage = InputImage.fromFilePath(pathOfImage.path);
    //recognied text
    final recognizedText = await textRecognizer.processImage(inputImage);

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            ResultScreen(text: recognizedText.text),
      ),
    );
  }
}
