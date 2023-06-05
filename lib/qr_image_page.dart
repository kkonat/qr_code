import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/cubits.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImagePage extends StatefulWidget {
  const QRImagePage({super.key});

  @override
  QRImagePageState createState() => QRImagePageState();
}

class QRImagePageState extends State<QRImagePage> {
  @override
  Widget build(BuildContext context) {
    final PayloadCubit qrcs = BlocProvider.of<PayloadCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR code'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: [
          Text('Payload: ${qrcs.state.payload}'),
          QrImageView(
              data: qrcs.state.payload,
              size: 280,
              // You can include embeddedImageStyle Property if you
              //wanna embed an image from your Asset folder
              embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(
                100,
                100,
              )))
        ])));
  }
}
