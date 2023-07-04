part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class FetchAddProduct extends AddProductEvent {
  final int shopId;
  final String name;
  final int price;
  final String description;
  final String image;
  final String image_extension;
  final int cooking_time;
  final int category_id;
  final int is_active;
  final int is_recommended;
  final int is_veg;

  FetchAddProduct(
      {required this.shopId,
        required this.is_recommended,
        required this.is_veg,
        required this.cooking_time,
        required this.category_id,
        required this.is_active,
        required this.image_extension,
        required this.image,
        required this.description,
        required this.price,
        required this.name,
       });
}
