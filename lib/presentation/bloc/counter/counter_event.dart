part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterPlusEvent implements CounterEvent {
  final int count;

  CounterPlusEvent(this.count);
}

class CounterMinusEvent implements CounterEvent {
  final int count;

  CounterMinusEvent(this.count);
}