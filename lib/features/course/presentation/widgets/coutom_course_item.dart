import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:flutter/material.dart';

class CustomCourseItem extends StatelessWidget {
  const CustomCourseItem({super.key, required this.courseItems});
  final CourseItems courseItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      color: AppColors.primaryHighLight,
      child: Column(
        children: [
          // ********************* image
          Image.network(
            courseItems.pictureUrl,
            height: AppSpace.size1,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: AppSpace.mainSpace),

          // ********************** price
          Text(
            '${courseItems.price}\$',
            style: AppTextStyle.nunitoSans26LightBlackBold,
          ),
          const SizedBox(height: AppSpace.smallSpace),
          //
          Text(
            courseItems.name,
            style: AppTextStyle.nunitoSans22LightBlackBold,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpace.smallSpace),

          // *********************** insturctor name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: AppColors.primaryColor),
              Text(
                courseItems.instructorName,
                style: AppTextStyle.nunitoSans16LightBlackBold,
              )
            ],
          )
        ],
      ),
    );
  }
}
