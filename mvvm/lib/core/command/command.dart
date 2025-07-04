import 'package:flutter/material.dart';
import 'package:mvvm/core/result/result.dart';

typedef CommandAction0<Output> = Future<Result<Output>> Function(); 

typedef CommandAction1<Output, Input extends Object> = Future<Result<Output>> Function(Input);

abstract class Command<Output> extends ChangeNotifier {
  bool _running = false;

  bool get running => _running;
  
  Result<Output>? _result;

  Result<Output>? get result => _result;

  bool get completed => _result is Ok;

  bool get error => _result is Error;

  Future<void> _execute(CommandAction0<Output> action) async {
    if(_running) return;

    _running = true;
    _result = null;

    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<Output> extends Command<Output> {
  final CommandAction0<Output> action;

  Command0(this.action);

  Future<void> execute() async {
    await _execute(() => action());
  }
}

class Command1<Output, Input extends Object> extends Command<Output> {
  final CommandAction1<Output, Input> action;

  Command1(this.action);

  Future<void> execute(Input params) async {
    await _execute(() => action(params));
  }
}