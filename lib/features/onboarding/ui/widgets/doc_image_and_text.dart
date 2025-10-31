import 'package:complete_app/assets/assets.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 443.w,
          height: 443.h,
          child: SvgPicture.asset(
            Assets.svgsDocLogoLowOpacity,
          ),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withValues(alpha: 0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 0.7],
            ),
          ),
          child: Image.asset(Assets.docImage),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Best Doctor Appointment App",
              style: AppStyles.font32W700Blue.copyWith(height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
