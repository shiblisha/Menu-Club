part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {}

class FetchStore extends StoreEvent{
  final int ShopId ;
  FetchStore({required this.ShopId});
}
