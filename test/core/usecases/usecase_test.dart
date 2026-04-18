import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growgypt/core/error/failures.dart';
import 'package:growgypt/core/usecases/usecase.dart';

// Fake UseCase for testing
class TestUseCase extends UseCase<String, TestParams> {
  @override
  Future<Either<Failure, String>> call(TestParams params) async {
    return Right(params.value);
  }
}

class TestParams {
  final String value;
  const TestParams(this.value);
}

void main() {
  group('UseCase', () {
    late TestUseCase useCase;

    setUp(() {
      useCase = TestUseCase();
    });

    test('should return Right with value when called', () async {
      final result = await useCase(const TestParams('test'));

      expect(result, const Right('test'));
    });

    test('should return Either type', () async {
      final result = await useCase(const TestParams('hello'));

      result.fold(
        (failure) => fail('should not be failure'),
        (value) => expect(value, 'hello'),
      );
    });
  });

  group('NoParams', () {
    test('two NoParams should be equal', () {
      const params1 = NoParams();
      const params2 = NoParams();

      expect(params1, equals(params2));
    });
  });
}