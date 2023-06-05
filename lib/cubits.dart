import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Settings {
  final int version;
  final bool gapless;
  final int errorCorrectionLevel;
  const Settings(
      {this.version = QrVersions.auto,
      this.gapless = true,
      this.errorCorrectionLevel = QrErrorCorrectLevel.L});
}

class SettingsCubit extends Cubit<Settings> {
  SettingsCubit([super.initialState = const Settings()]);
  updateSettings(Settings n) => emit(Settings(
        version: n.version,
        gapless: n.gapless,
        errorCorrectionLevel: n.errorCorrectionLevel,
      ));
}

class Payload {
  final String payload;
  const Payload(this.payload);
}

class PayloadCubit extends Cubit<Payload> {
  PayloadCubit([super.initialState = const Payload("init")]);
  updatePayload(String newPayload) => emit(Payload(newPayload));
}
