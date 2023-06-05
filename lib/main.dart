import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/payload_page.dart';
import 'package:qr_code/qr_image_page.dart';
import 'package:qr_code/cubits.dart';
import 'package:qr_code/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) => MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PayloadCubit(),
              ),
              BlocProvider(
                create: (context) => SettingsCubit(),
              ),
            ],
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('QR code generator'),
                  centerTitle: true,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.textsms)),
                      Tab(icon: Icon(Icons.qr_code)),
                      Tab(icon: Icon(Icons.settings)),
                    ],
                  ),
                ),
                body: const TabBarView(children: [
                  DataInputPage(),
                  QRImagePage(),
                  SettingsPage(),
                ])),
          )));
}
