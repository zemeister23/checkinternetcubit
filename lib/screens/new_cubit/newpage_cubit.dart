import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newpage_state.dart';

class NewpageCubit extends Cubit<NewpageState> {
  NewpageCubit() : super(NewpageInitial());
}
