import 'package:flutter_test/flutter_test.dart';
import 'package:growgypt/core/error/failures.dart';

void main() {

  group('Server Failure', () {

    
    test('should be a subclass of Failure', () {
      // Arrange
      const failure = ServerFailure();

      // Assert
      expect(failure, isA<Failure>());
    });

      test('should have a default message', () {
        // Arrange
        const failure = ServerFailure();
  
        // Assert
        expect(failure.message, isNotEmpty);

      });

      test ('two ServerFailures with same message should be equal',(){
        // Arrange
        const failure1 = ServerFailure(message: 'error');
        const failure2 = ServerFailure(message: 'error');

        // Assert
        expect(failure1, equals(failure2));
      });
  });

  group('NetworkFailure', () {

    
    test('should be a subclass of Failure', () {
      // Arrange
      const failure = NetworkFailure();

      // Assert
      expect(failure, isA<Failure>());
    });

      test('should have a default message', () {
        // Arrange
        const failure = NetworkFailure();
  
        // Assert
        expect(failure.message, isNotEmpty);

      });

      test ('two NetworkFailures with same message should be equal',(){
        // Arrange
        const failure1 = NetworkFailure(message: 'error');
        const failure2 = NetworkFailure(message: 'error');

        // Assert
        expect(failure1, equals(failure2));
      });
  });

  group('CacheFailure', () {

    
    test('should be a subclass of Failure', () {
      // Arrange
      const failure = CacheFailure();

      // Assert
      expect(failure, isA<Failure>());
    });

      test('should have a default message', () {
        // Arrange
        const failure = CacheFailure();
  
        // Assert
        expect(failure.message, isNotEmpty);

      });

      test ('two CacheFailures with same message should be equal',(){
        // Arrange
        const failure1 = CacheFailure(message: 'error');
        const failure2 = CacheFailure(message: 'error');

        // Assert
        expect(failure1, equals(failure2));
      });
  });
    
}