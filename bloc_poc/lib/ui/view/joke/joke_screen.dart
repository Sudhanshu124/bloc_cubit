import 'package:bloc_poc/ui/view/joke/joke_screen_widget/random_joke_screen.dart';
import 'package:bloc_poc/ui/viewmodel/cubit/joke_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JokeCubit>().getJokes();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeCubit, JokeState>(
      builder: (context, state) {
        switch(state){
          case JokeLoadingState():
            return Scaffold(
             body: Center(child: Text('Loading...')),
          );
          case ErrorInLoadingJoke():
            return Scaffold(
             body: Center(child: Text(state.errorMessage)),
          );
          case FetchRandomJoke():
           return  Scaffold(
             body: RandomJokeScreen(jokes: state.randomJoke, callBack:()=>context.read<JokeCubit>().getJokes(),)
          );
        
        }
       
      },
    );
  }
}
