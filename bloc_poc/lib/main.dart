import 'package:bloc_poc/domain/repository_impl/dog_detail_repo_impl.dart';
import 'package:bloc_poc/domain/repository_impl/jokes_repo_impl.dart';
import 'package:bloc_poc/ui/view/home.dart';
import 'package:bloc_poc/ui/viewmodel/cubit/dog_image_cubit.dart';
import 'package:bloc_poc/ui/viewmodel/cubit/joke_cubit.dart';
import 'package:bloc_poc/ui/viewmodel/cubit/navigation_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
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
      home:  MultiBlocProvider(
        providers: [
          BlocProvider<DogImageCubit>(create: (_)=>DogImageCubit(DogDetailRepoImpl())),
          BlocProvider<NavigationIndexCubit>(create: (_)=>NavigationIndexCubit()),
          BlocProvider<JokeCubit>(create:(_)=> JokeCubit(JokesRepoImpl()) ),
        ],
        child: const Home()));
    
  }
}
