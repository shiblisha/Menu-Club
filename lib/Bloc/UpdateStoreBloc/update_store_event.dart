part of 'update_store_bloc.dart';

@immutable
abstract class UpdateStoreEvent {}

class FetchUpdateStore extends UpdateStoreEvent {
  final int ShopId;

  final String store_name;
  final String description;
  final String address;
  final String phone;
  final String password;

  FetchUpdateStore({
    required this.ShopId,
    required this.store_name,
    required this.description,
    required this.address,
    required this.phone,
    required this.password,
  });
}