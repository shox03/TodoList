import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/view/screens/list_part/list_page.dart';
import 'package:todo_app/view/screens/list_part/list_page_tomorrow.dart';
import 'package:todo_app/view/widgets/app_bar.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({Key? key}) : super(key: key);

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarPage().showAppbar(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getW(18.0),
                    top: getH(10.0),
                  ),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: getH(15.0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: getH(300.0), child: ListPage()),
                Padding(
                  padding: EdgeInsets.only(
                    left: getH(18.0),
                    top: getH(10.0),
                  ),
                  child: Text(
                    "Tomorrow",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: getH(15.0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: ListPageTomorrow(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
