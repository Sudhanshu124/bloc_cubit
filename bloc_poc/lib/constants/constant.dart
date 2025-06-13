import 'package:bloc_poc/ui/view/joke/joke_screen.dart';
import 'package:bloc_poc/ui/view/pet/pet_screen.dart';
import 'package:flutter/material.dart';

Widget getSelectedWidget(int index){
   return switch (index) {
      0 => const PetScreen(),
      1 => const JokeScreen(),
      _ => const SizedBox.shrink(), 
    };
}