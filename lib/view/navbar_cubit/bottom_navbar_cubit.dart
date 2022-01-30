import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/view/screens/home_page/home.dart';
import 'package:todo_app/view/screens/taskas_page/tasks_page.dart';

part 'bottom_navbar_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  int pageIndex = 0;
  BottomNavbarCubit() : super(BottonmavBarInitial());

  List pages = [
    HomeBodyPage(),
    // Listofcontexts.names != null ? HomeBodyPage() : NotasksPage(),

    TasksPage(),
  ];
  changePage(int tappedIndex) {
    pageIndex = tappedIndex;

    emit(BottonmavBarInitial());
  }
}
