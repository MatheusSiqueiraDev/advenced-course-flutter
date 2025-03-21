import 'package:gerenciado_estado_geral/contracts/observable_state.dart';
import 'package:gerenciado_estado_geral/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState {
    T _state;

    @override
    T get state => _state;

    set state(T newState) {
      _state = newState;
      changeState();
    }

    StateObservable(this._state);
}