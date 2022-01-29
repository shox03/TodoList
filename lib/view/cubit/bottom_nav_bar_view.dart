import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/constants/app_icons.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/view/cubit/bottom_navbar_cubit.dart';
import 'package:todo_app/view/widgets/modal_bottom_sheet.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavbarCubit(),
      child: BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
        builder: (context, State) {
          var _context = context.watch<BottomNavbarCubit>();
          return Scaffold(
            body: _context.pages[_context.pageIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _context.pageIndex,
              // selectedItemColor: AppColors.greenColor,
              // unselectedItemColor: AppColors.greyColor,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    APPIcons.home,
                    color: _context.pageIndex == 0
                        ? Color(0xFF5F87E7)
                        : Colors.grey,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    APPIcons.grid,
                    color: _context.pageIndex == 1
                        ? Color(0xFF5F87E7)
                        : Colors.grey,
                  ),
                  label: "",
                ),
              ],
              onTap: (int index) {
                context.read<BottomNavbarCubit>().changePage(index);
              },
            ),
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.ellipseColor,
              onPressed: () {
                // workWithHive();
                // showbottom(context);
                // showModalBottomSheet();
                showbottom(context);
              },
              child: SvgPicture.asset(APPIcons.plus),
            ),
          );
        },
      ),
    );
  }
}
