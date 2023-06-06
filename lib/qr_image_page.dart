import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/cubits.dart';
import 'package:qr_code/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

const ENCRYPT = true;

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
          ENCRYPT // async payload processing, use future builder
              ? FutureBuilder(
                  future: encrypt(qrcs.state.payload),
                  builder: (context, snapshot) => (snapshot.hasData)
                      ? QrImageView(
                          data: snapshot.data.toString(),
                          size: 380,
                        )
                      : const CircularProgressIndicator())
              : QrImageView(data: qrcs.state.payload, size: 380)
        ])));
  }
}
