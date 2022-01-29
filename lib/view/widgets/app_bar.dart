import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/app_images.dart';

class AppBarPage {
  showAppbar() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: getH(238.0),
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
                            "Today you have 9 tasks",
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
        Positioned(
          top: getH(120.0),
          left: getW(18.0),
          right: getW(18.0),
          child: Container(
            height: getH(106.0),
            width: getW(339.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getW(5.0),
              ),
              color: Colors.white30,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getW(16.0),
                    top: getH(11.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today Reminder",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getH(20.0),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: getH(10.0),
                      ),
                      Text(
                        "Meeting with client",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getH(11.0),
                        ),
                      ),
                      SizedBox(
                        height: getH(10.0),
                      ),
                      Text(
                        "13.00 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getH(11.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getW(75.0),
                ),
                SizedBox(
                  child: SvgPicture.asset(APPImages.bell
                      // height: getH(86.0),
                      // width: getW(53.0),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
