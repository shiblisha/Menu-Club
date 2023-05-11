part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class FetchOrders extends OrderEvent{
  final int ShopId ;
  FetchOrders({required this.ShopId});
}
