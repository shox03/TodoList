import 'package:flutter/material.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/main_colors.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getW(258.0),
      height: getH(56.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          fixedSize: Size(
            getW(258.0),
            getH(56.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/navbar');
        },
        child: Padding(
          padding: EdgeInsets.only(top: getH(18.0), bottom: getH(25.0)),
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: getH(14.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.7, 1.0],
          colors: [
            // Color.fromRGBO(93, 230, 26, 0.8),
            AppColors.colorofElevated,
            // AppColors.colorofElevated,
            Colors.lightGreen,
          ],
        ),
      ),
    );
  }
}
