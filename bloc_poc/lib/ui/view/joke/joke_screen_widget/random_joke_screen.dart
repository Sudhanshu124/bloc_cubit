import 'package:bloc_poc/data/model/random_joke.dart';
import 'package:flutter/material.dart';

class RandomJokeScreen extends StatefulWidget {
  final Joke jokes;
  final Future<void> Function()  callBack;
   const RandomJokeScreen({required this.jokes,required this.callBack,super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
      Text(widget.jokes.setup,textAlign:TextAlign.center,),
      Text(widget.jokes.punchline,textAlign:TextAlign.center,),
      ElevatedButton(onPressed: () async { 
       await widget.callBack();  
        }, child: Text('Next'))
        ],
      ),
    );
  }
}