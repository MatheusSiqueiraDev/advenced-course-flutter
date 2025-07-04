import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/core/command/command.dart';
import 'package:mvvm/core/result/result.dart';

void main() {
  group("Should test commands", () {
    test("Should teste Command0 returns Ok", () async {
      final command0 = Command0<String>(getOkResult);

      expect(command0.completed, false);

      expect(command0.running, false);

      expect(command0.error, false);

      expect(command0.result, isNull);

      await command0.execute();

      expect(command0.running, false);

      expect(command0.error, false);

      expect(command0.completed, true);

      expect(command0.result, isNotNull);

      expect(command0.result!.asOk.value, "The operation has Success");
    });

    test("Should teste Command0 returns Error", () async {
      final command0 = Command0<String>(getErrorResult);

      expect(command0.completed, false);

      expect(command0.running, false);

      expect(command0.error, false);

      expect(command0.result, isNull);

      await command0.execute();

      expect(command0.running, false);

      expect(command0.completed, false);

      expect(command0.error, true);

      expect(command0.result, isNotNull);

      expect(command0.result!.asError.error, isA<Exception>());
    });

    test("Should teste Command1 returns Ok", () async {
      final command1 = Command1<String, String>(getOkResult1);

      expect(command1.completed, false);

      expect(command1.running, false);

      expect(command1.error, false);

      expect(command1.result, isNull);

      await command1.execute("Olá, mundo");

      expect(command1.running, false);

      expect(command1.error, false);

      expect(command1.completed, true);

      expect(command1.result, isA<Ok>());

      expect(command1.result!.asOk.value, "Olá, mundo");
    });

    test("Should teste Command1 returns Error", () async {
      final command0 = Command1<bool, String>(getErrorResult1);

      expect(command0.completed, false);

      expect(command0.running, false);

      expect(command0.error, false);

      expect(command0.result, isNull);

      await command0.execute("Olá, mundo");

      expect(command0.running, false);

      expect(command0.completed, false);

      expect(command0.error, true);

      expect(command0.result, isNotNull);

      expect(command0.result!.asError.error, isA<Exception>());
    });

  });
}

Future<Result<String>> getOkResult() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.ok("The operation has Success");
}

Future<Result<String>> getErrorResult() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.error(Exception("Deu erro"));
}

Future<Result<String>> getOkResult1(String message) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.ok(message);
}

Future<Result<bool>> getErrorResult1(String message) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.error(Exception("Deu erro"));
}
