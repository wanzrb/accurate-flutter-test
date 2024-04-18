import 'package:bloc/bloc.dart';

class ReversedCubit extends Cubit<bool> {
  ReversedCubit() : super(false);

  void isReversed() => emit(!state);
}
