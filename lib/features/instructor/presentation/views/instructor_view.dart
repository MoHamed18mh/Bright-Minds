import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/coustom/custom_header_image.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/instructor/cubit/instructor_cubit.dart';
import 'package:bright/features/instructor/cubit/instructor_state.dart';
import 'package:bright/features/instructor/presentation/widgets/customs/custom_instructor_item.dart';
import 'package:bright/features/instructor/presentation/widgets/customs/custom_instructor_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructorView extends StatelessWidget {
  const InstructorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructorCubit, InstructorState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomHeaderImage(
                  title: AppStrings.instructors,
                  imagePath: Assets.assetsImagesTeam1,
                ),
              ),

              SliverToBoxAdapter(
                child: CustomSectionHeader(
                  title: AppStrings.instructors,
                  subTitle: AppStrings.expertInstructors,
                ),
              ),

              // *************** instructor items
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppSpace.size5,
                    mainAxisExtent: AppSpace.size5),
                itemBuilder: (context, index) {
                  if (state is InstructorSuccessState) {
                    return CustomInstructorItem(
                        instructorItem: state.instructorModel.instructorData
                            .instructorItem[index]);
                  } else {
                    return CustomInstructorShimmer();
                  }
                },
                itemCount: (state is InstructorSuccessState)
                    ? state.instructorModel.instructorData.instructorItem.length
                    : 3,
              ),
              //
              SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.meduimSpace2),
              ),
            ],
          ),
        );
      },
    );
  }
}
