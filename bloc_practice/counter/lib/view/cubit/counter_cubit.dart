import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  void increment(){
    final currentCountValue = _getCurrentCountValue();
    emit(CounterIncrementState(count: currentCountValue+1));
  }
   void decrement(){
    final currentCountValue = _getCurrentCountValue();
    emit(CounterDecrementState(count: currentCountValue-1));
  }
   void reset(){
    emit(CounterReset());
  }

  int _getCurrentCountValue(){
    if(state is CounterInitialState)
    {
      return (state as CounterInitialState).count;
    }
    else if(state is CounterIncrementState)
    {
      return (state as CounterIncrementState).count;
    }
    else if(state is CounterDecrementState){
      return (state as CounterDecrementState).count;

    }
   return 0;
  }
}
