import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:native_qr_reader/core/init/method_manager/method_manager.dart';
import 'package:native_qr_reader/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(methodName: 'qr_reader');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.readQr();
        },
        child: const Icon(Icons.qr_code),
      ),
      body: Center(
          child: Observer(
              builder: (_) => Text('QR result is = ${viewModel.qrString}'))),
    );
  }
}
