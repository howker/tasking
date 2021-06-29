import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImageWidget extends StatelessWidget {
  final String qrData;
  const QRImageWidget({
    required this.qrData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: QrImage(
        data: qrData,
        size: 222.0,
      ),
    );
  }
}
