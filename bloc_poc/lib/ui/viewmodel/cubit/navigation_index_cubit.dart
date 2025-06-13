import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_index_state.dart';

class NavigationIndexCubit extends Cubit<NavigationIndexState> {

  NavigationIndexCubit() : super(NavigationIndexInitial(selectedScreen: 0));

  setSelectedScreen(int index)=>emit(NavigationIndexInitial(selectedScreen: index));
}

