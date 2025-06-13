import 'package:bloc_poc/ui/viewmodel/cubit/navigation_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationIndexCubit, NavigationIndexState>(
      builder: (context, state) {
        final selectedIndex = switch (state) {
          NavigationIndexInitial(selectedScreen: final screen) => screen,
        };
        return NavigationBar(
          onDestinationSelected: (value) => context.read<NavigationIndexCubit>().setSelectedScreen(value),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.pets_outlined),
              label: 'Image',
              selectedIcon: Icon(Icons.pets),
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Joke',
              selectedIcon: Icon(Icons.favorite),
            ),
          ],
          selectedIndex: selectedIndex,
        );
      },
    );
  }
}


