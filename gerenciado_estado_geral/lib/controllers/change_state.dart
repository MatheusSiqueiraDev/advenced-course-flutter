import 'package:gerenciado_estado_geral/contracts/observable.dart';

class ChangeState implements Observable {
  final List<void Function()> _callbacks = [];

  @override
  void addEventListener(void Function() callback) {
    if(!_callbacks.contains(callback)) _callbacks.add(callback);
  }

  @override
  void removeEventListener(void Function() callback) {
    if(_callbacks.contains(callback)) _callbacks.remove(callback);
  }

  void changeState() {
    for(final void Function() callback in _callbacks) {
      callback.call();
    }
  }
}