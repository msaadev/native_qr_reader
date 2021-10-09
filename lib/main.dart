import 'package:flutter/material.dart';
import 'package:native_qr_reader/view/home/view/hom_view.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Native QR Reader',
      home: HomeView(),
    );
  }
}