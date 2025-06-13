import 'package:bloc_test/bloc_test.dart';
import 'package:counter/view/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';  

void main() {
  group('Counter Cubit Test', () {
    
    test('Initial state should be CounterInitialState with Count 0', () {
      final cubit = CounterCubit();
      expect(cubit.state, isA<CounterInitialState>());
      expect((cubit.state as CounterInitialState).count, equals(0));
      cubit.close();
    });

    blocTest<CounterCubit, CounterState>(
      'should emit CounterIncrementState with count 1 when increment is called',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.increment();
        cubit.increment();
      },
      expect: () => [ 
        CounterIncrementState(count: 1),
        CounterIncrementState(count: 2),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'Should emit Counter Decrement with count -1 when decrement is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(), 
      expect: () => [  
        CounterDecrementState(count: -1),  
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'Should Emit counter reset with count value 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit.reset(), 
      expect: () => [  
        CounterReset(count: 0),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'Should emit multiple decrements correctly',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.decrement();  
        cubit.decrement();  
      },
      expect: () => [
        CounterDecrementState(count: -1),
        CounterDecrementState(count: -2),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'Should reset to 0 after increment operations',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.increment();  // 0 -> 1
        cubit.increment();  // 1 -> 2
        cubit.reset();      // 2 -> 0
      },
      expect: () => [
        CounterIncrementState(count: 1),
        CounterIncrementState(count: 2),
        CounterReset(count: 0),
      ],
    );
  });
}