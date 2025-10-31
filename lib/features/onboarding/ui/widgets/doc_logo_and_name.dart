import 'package:complete_app/assets/assets.dart';
import 'package:complete_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsDocLogo),
        SizedBox(width: 10.w,),
        Text('Doc App',
          style: AppStyles.font24W700Black,),
      ],
    );
  }
}
