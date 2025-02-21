import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/auth/presentation/widgets/auth_head_widget.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/prsentation/widgets/customs/custom_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final boardingCubit = context.read<BoardingCubit>();

    return BlocListener<BoardingCubit, BoardingState>(
      listener: (context, state) {
        if (state is BoardingCompleted) {
          navigateReplacement(context, RouteKey.loginView);
        }
      },
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.meduimSpace1)),
              SliverToBoxAdapter(
                // text button for skip boarding
                child: TextButtonWidget(
                  alignment: Alignment.centerRight,
                  onPressed: () => boardingCubit.navigateToLogin(context),
                  text1: AppStrings.skip,
                  fontSize: 20,
                ),
              ),

              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.mainSpace)),
              SliverToBoxAdapter(child: AuthHeadWidget()),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.meduimSpace2)),

              // the body of the screen
              SliverToBoxAdapter(child: CustomBoardingBody()),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.mainSpace)),

              // button for the next screen in boarding
              SliverToBoxAdapter(
                child: MaterialButtonWidget(
                  onPressed: () {
                    boardingCubit.nextBoardingView(context);
                  },
                  text: AppStrings.next,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
