import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/main_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: getH(106.0),
                  width: getW(375.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/appbarBack.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: getH(40.0),
                      left: getW(25.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello Brenda",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getH(18.0),
                                  ),
                                ),
                                Text(
                                  "Today you have 0 tasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getH(18.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: getW(91.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: CircleAvatar(
                                radius: getH(19.0),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Image.asset(
                  "assets/images/Ellipse_big.png",
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  "assets/images/Ellipse_small.png",
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getH(150.0),
              bottom: getH(70.0),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/noTasks.svg",
                height: getH(164.0),
                width: getW(120.0),
              ),
            ),
          ),
          Text(
            "No Tasks ",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: getH(22.0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
