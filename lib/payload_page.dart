import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/cubits.dart';

class DataInputPage extends StatefulWidget {
  const DataInputPage({super.key});
  @override
  DataInputPageState createState() => DataInputPageState();
}

class DataInputPageState extends State<DataInputPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(context) {
    final PayloadCubit qrcs = BlocProvider.of<PayloadCubit>(context);
    controller.text = qrcs.state.payload;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payload'),
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter data'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                qrcs.updatePayload(controller.text);
                DefaultTabController.of(context).animateTo(1);
              },
              child: const Text('Update'))
        ]));
  }
}
