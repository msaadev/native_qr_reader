// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$qrStringAtom = Atom(name: '_HomeViewModelBase.qrString');

  @override
  String get qrString {
    _$qrStringAtom.reportRead();
    return super.qrString;
  }

  @override
  set qrString(String value) {
    _$qrStringAtom.reportWrite(value, super.qrString, () {
      super.qrString = value;
    });
  }

  final _$readQrAsyncAction = AsyncAction('_HomeViewModelBase.readQr');

  @override
  Future<dynamic> readQr() {
    return _$readQrAsyncAction.run(() => super.readQr());
  }

  @override
  String toString() {
    return '''
qrString: ${qrString}
    ''';
  }
}
