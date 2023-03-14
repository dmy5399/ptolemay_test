import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ptolemay_test/presentation/bloc/theme/theme_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    int counter = 0;

    on<CounterPlusEvent>((event, emit) {
      if(counter + event.count  < 10) {
        counter += event.count;
      } else {
        counter = 10;
      }

      emit(CounterInitial(counter));
    });

    on<CounterMinusEvent>((event, emit) {
      if(counter - event.count > 0) {
        counter -= event.count;
      } else {
        counter = 0;
      }

      emit(CounterInitial(counter));
    });

  }
}
