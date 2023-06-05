part of 'order_details_bloc.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}
class OrderDetailsBlocLoading extends OrderDetailsState{}
class OrderDetailsBlocLoaded extends OrderDetailsState{}
class OrderDetailsBlocError extends OrderDetailsState{}
