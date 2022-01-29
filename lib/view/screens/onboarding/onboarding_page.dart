import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/app_images.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/view/widgets/onboarding_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: getH(183.0)),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                APPImages.splashScreen,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getH(113.0)),
            Text(
              "Reminders made simple",
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: getH(22.0),
              ),
            ),
            SizedBox(height: getH(171.0)),
            const OnboardingButton(),
          ],
        ),
      ),
    );
  }
}
