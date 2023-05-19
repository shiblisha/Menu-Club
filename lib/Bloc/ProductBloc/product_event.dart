part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}
class FetchProduct extends ProductEvent{
  final int shopId;
  FetchProduct({required this.shopId});
}