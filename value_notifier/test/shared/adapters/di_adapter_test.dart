import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

class DependecyMock {}

void main() {
  late DiAdapter sut;
  setUpAll(() {
    sut = DiAdapter();
  });

  test(
    'should properly register and recover dependency',
    () async {
      // arrange
      final dependency = DependecyMock();
      // act
      sut.register(() => dependency);
      final retrievedDependency = sut.get<DependecyMock>();
      // assert
      expect(dependency.hashCode, equals(retrievedDependency.hashCode));
    },
  );
}
