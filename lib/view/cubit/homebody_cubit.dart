import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/list_model.dart';

part 'homebody_state.dart';

class HomebodyCubit extends Cubit<HomebodyState> {
  final _items = List.generate(50, (int index) => index);
  int value = 1;

  HomebodyCubit() : super(HomebodyInitial());

  onchangeingPoint(v) {
    value = v;
    emit(HomebodyInitial());
  }

  deleteDismis(int index) {
    _items.removeAt(index);
    emit(HomebodyInitial());
  }

  List get items => _items;
}
