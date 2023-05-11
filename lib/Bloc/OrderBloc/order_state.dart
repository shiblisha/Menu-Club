part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderBlocLoading extends OrderState{}
class OrderBlocLoaded extends OrderState{}
class OrderBlocError extends OrderState{}
