import 'package:counter/view/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        final (count, status) = _getCountAndStatus(state);
        
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Current Action is: $status'),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _buildActionButtons(context),
          ],
        );
      },
    );
  }

  (int, String) _getCountAndStatus(CounterState state) {
    return switch (state) {
      CounterInitialState() => (state.count, 'None'),
      CounterIncrementState() => (state.count, 'Increasing'),
      CounterDecrementState() => (state.count, 'Decreasing'),
      CounterReset() => (state.count, 'Reset'),
    };
  }

  Widget _buildActionButtons(BuildContext context, ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().increment(),
          tooltip: 'Increment',
          heroTag: 'increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().decrement(),
          tooltip: 'Decrement',
          heroTag: 'decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().reset(),
          tooltip: 'Reset',
          heroTag: 'reset',
          child: const Icon(Icons.restore),
        ),
      ],
    );
  }
}
