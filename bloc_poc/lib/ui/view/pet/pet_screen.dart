import 'package:bloc_poc/ui/viewmodel/cubit/dog_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<DogImageCubit>().getImage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.amberAccent),

        child: BlocBuilder<DogImageCubit, DogImageState>(
         
          builder: (context, state) {
            
            if (state is DogImageLoading) {
              return Center(child: CircularProgressIndicator());
            } 
             if (state is DogImageError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              return Text('Center Error');
            }
            else if (state is DogImageLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Center(
                    child: Image.network(
                      state.dogImage.message,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Text("Failed to load image"),
                    ),
                  ),
                  ElevatedButton(onPressed: (){context.read<DogImageCubit>().getImage();}, child: Text("Next"))
                ],
              );
            } else if (state is DogImageError) {
              return Center(child: Text("Error loading image"));
            } else {
              return Center(child: Text("No image yet"));
            }
          },
        ),
      ),
    );
  }
}

