import 'package:flutter/material.dart';

class DownloadAnimation extends StatefulWidget {
  const DownloadAnimation({super.key});

  @override
  State<DownloadAnimation> createState() => _DownloadAnimationState();
}

class _DownloadAnimationState extends State<DownloadAnimation> {
  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isDownloading = !isDownloading;
            });
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              // padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              width: isDownloading ? size.width * 0.18 : size.width * 0.44,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue, width: 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: isDownloading
                    ? const Icon(Icons.get_app)
                    : const Text("Download",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
              )),
        ),
      ),
    );
  }
}
