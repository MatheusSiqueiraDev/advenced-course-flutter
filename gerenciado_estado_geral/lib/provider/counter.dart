import 'package:gerenciado_estado_geral/controllers/change_state.dart';

class Counter extends ChangeState {
  int counterValue = 0;

  void incrementCounter() {
    counterValue++;
    changeState();
  }
}