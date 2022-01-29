import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/model/list_model.dart';
import 'package:todo_app/view/widgets/app_bar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarPage().showAppbar(),
          Padding(
            padding: EdgeInsets.only(
              left: getW(18.0),
              top: getH(10.0),
            ),
            child: Text(
              "Projects",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: getH(15.0),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getH(15.0),
              left: getW(18.0),
              right: getW(18.0),
            ),
            child: SizedBox(
              height: getH(432.0),
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 210,
                    crossAxisSpacing: getW(19.0),
                    mainAxisSpacing: getW(23.0),
                  ),
                  itemCount: Listofcontexts.taskOfprojects.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xffBBBBBB).withOpacity(0.25),
                              offset: const Offset(-2, 6),
                              blurRadius: 4.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          getW(5.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: getH(30.0),
                            backgroundColor:
                                Listofcontexts.colorOFcircle[index],
                            child:
                                SvgPicture.asset(Listofcontexts.icons[index]),
                          ),
                          Text(
                            Listofcontexts.nameOfprojects[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getW(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getH(25.0)),
                          Text(
                            Listofcontexts.taskOfprojects[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getW(10.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
