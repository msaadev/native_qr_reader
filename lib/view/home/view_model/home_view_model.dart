import 'package:mobx/mobx.dart';
import 'package:native_qr_reader/core/init/method_manager/method_manager.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late final MethodManager _manager;
  final String methodName;

  _HomeViewModelBase({required this.methodName}) {
    _manager = MethodManager(methodChannel: methodName);
  }

  @observable
  String qrString = '';

  @action
  Future readQr() async {
    var result = await _manager.invokeMethod<String>(method: 'qr');
    print('$result');
    if (result != null) {
      qrString = result;
    }
  }
}
