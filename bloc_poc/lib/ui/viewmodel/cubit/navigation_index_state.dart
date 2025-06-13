part of 'navigation_index_cubit.dart';
@immutable
sealed class NavigationIndexState {}

final class NavigationIndexInitial extends NavigationIndexState {
 final int selectedScreen;
  NavigationIndexInitial({required this.selectedScreen});
}

