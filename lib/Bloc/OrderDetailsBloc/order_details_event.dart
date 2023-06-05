part of 'order_details_bloc.dart';

@immutable
abstract class OrderDetailsEvent {}

class FetchOrdersDetails extends OrderDetailsEvent{
  final int orderId ;
  FetchOrdersDetails({required this.orderId});}