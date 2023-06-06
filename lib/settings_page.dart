import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/cubits.dart';

class EditValue extends TextFormField {
  EditValue(String label, initialValue, Function(String) onChanged, {super.key})
      : super(
          initialValue: initialValue.toString(),
          decoration: InputDecoration(labelText: label),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          onChanged: onChanged,
        );
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit qrcs = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings page'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
              child: Column(children: [
            const Text('QR Code settings'),
            EditValue('Version', qrcs.state.version, (String value) {
              qrcs.updateSettings(Settings(version: int.parse(value)));
            }),
            EditValue('Error correction', qrcs.state.errorCorrectionLevel, (String value) {
              qrcs.updateSettings(Settings(errorCorrectionLevel: int.parse(value)));
            }),
          ])),
        ));
  }

  // int errorCorrectionLevel = QrErrorCorrectLevel.L,
  // bool constrainErrorBounds = true,
  // bool gapless = true,
  // String semanticsLabel = 'qr code',
  // QrEyeStyle eyeStyle = const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
  // QrDataModuleStyle dataModuleStyle = const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: Colors.black),
}
