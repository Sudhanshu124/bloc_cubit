// Add these methods to each of your state classes

part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitialState extends CounterState {
  final int count;
  CounterInitialState({this.count = 0});

  // ✅ Add these methods for testing
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterInitialState && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterInitialState(count: $count)';
}

final class CounterIncrementState extends CounterState {
  final int count;
  CounterIncrementState({required this.count});

  // ✅ Add these methods for testing
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterIncrementState && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterIncrementState(count: $count)';
}

final class CounterDecrementState extends CounterState {
  final int count;
  CounterDecrementState({required this.count});

  // ✅ Add these methods for testing
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterDecrementState && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterDecrementState(count: $count)';
}

final class CounterReset extends CounterState {
  final int count;
  CounterReset({this.count = 0});

  // ✅ Add these methods for testing
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterReset && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterReset(count: $count)';
}