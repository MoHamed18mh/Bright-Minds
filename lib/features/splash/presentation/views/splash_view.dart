import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/splash/cubit/splash_cubit.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';
import 'package:bright/features/splash/presentation/widgets/custom_shimmer_icon.dart';
import 'package:bright/features/splash/presentation/widgets/custom_shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateToBoarding) {
          navigateReplacement(context, '/BoardingView');
        } else if (state is SplashNavigateToLogin) {
          navigateReplacement(context, '/LoginView');
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomShimmerIcon(),
              SizedBox(height: AppSpace.mainSpace),
              CustomShimmerText(),
            ],
          ),
        ),
      ),
    );
  }
}
