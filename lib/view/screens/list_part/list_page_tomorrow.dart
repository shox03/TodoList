import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/app_icons.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/model/list_model.dart';
import 'package:todo_app/view/cubit/homebody_cubit.dart';

// ignore: must_be_immutable
class ListPageTomorrow extends StatelessWidget {
  ListPageTomorrow({Key? key}) : super(key: key);
  int? value;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => HomebodyCubit(),
      child: BlocBuilder<HomebodyCubit, HomebodyState>(
        builder: (context, state) {
          var _context = context.watch<HomebodyCubit>();
          return ValueListenableBuilder(
            valueListenable: Hive.box("task_box").listenable(),
            builder: (context, Box box, widget) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: getH(10.0)),
                    child: dismissiblePart(_context, index, context, box),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Dismissible dismissiblePart(
      HomebodyCubit _context, int index, BuildContext context, Box box) {
    bool _color = false;
    return Dismissible(
      background: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(APPIcons.pen),
            SizedBox(
              width: getW(6.0),
            ),
            SvgPicture.asset(APPIcons.delete)
          ],
        ),
      ),
      key: ValueKey<int>(_context.items[index]),
      onDismissed: (DismissDirection direction) {
        _context.deleteDismis(index);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffBBBBBB).withOpacity(0.05),
                offset: const Offset(-5, 5),
                blurRadius: 0.8)
          ],
        ),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: getH(100.0),
                ),
                height: getH(55.0),
                width: getW(4.0),
                decoration: BoxDecoration(
                  color: Listofcontexts.colors[index],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
              ),
              Radio(
                  value: index,
                  groupValue: _context.value,
                  onChanged: (v) {
                    context.read<HomebodyCubit>().onchangeingPoint(v);
                  }),
              Text(
                Listofcontexts.clocks[index],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: getH(13.0),
                ),
              ),
              SizedBox(
                width: getW(10.0),
              ),
              SizedBox(
                width: getW(248.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (box.get(index) as Map)["task"].toString(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: getH(16.0),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: getW(20.0),
                    ),
                    InkWell(
                      onTap: () {
                        _color != _color;
                      },
                      child: SvgPicture.asset(APPIcons.smallBells,
                          color: _color == false ? Colors.grey : Colors.yellow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
