part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitialState extends CounterState {
final int count;
  CounterInitialState({this.count=0});
}

final class CounterIncrementState extends CounterState {
  final int count;

  CounterIncrementState({required this.count});
}
final class CounterDecrementState extends CounterState{
   final int count;
  CounterDecrementState({required this.count});
}
final class CounterReset extends CounterState{
   final int count;
  CounterReset({ this.count=0});
}