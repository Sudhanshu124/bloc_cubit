import 'package:bloc_poc/constants/constant.dart';
 import 'package:bloc_poc/ui/view/widgets/bottom_navigation_bar.dart';
import 'package:bloc_poc/ui/viewmodel/cubit/navigation_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: BlocBuilder<NavigationIndexCubit, NavigationIndexState>(
        builder: (context, state) {
           final selectedIndex = switch (state) {
          NavigationIndexInitial(selectedScreen: final screen) => screen,
        };
          return getSelectedWidget(selectedIndex);
        },
      ),
    );
  }
}
