import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Repository extends StatelessWidget {
  const Repository({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        Image.asset("assets/images/zen_browser.png", width: 180, fit: BoxFit.contain),
        Text(
          "¡El mejor navegador es zen browser! (aunque solo sea una reskin de firefox)",
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            textBaseline: TextBaseline.alphabetic,
            decoration: TextDecoration.none,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20 
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: QrImageView(
              data: "https://github.com/reiizamo",
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black
              ),
              dataModuleStyle: QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black
              ),
            ),
          ),
        )
      ],
    );
  }
}