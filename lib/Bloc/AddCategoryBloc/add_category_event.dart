part of 'add_category_bloc.dart';

@immutable
abstract class AddCategoryEvent {}
class FetchAddCategory extends AddCategoryEvent {
  final int ShopId;

  final int CategoryId;
  final int is_active;
  final String name;
  final String image;
  final String image_extension;

  FetchAddCategory({
    required this.ShopId,
    required this.image_extension,
    required this.is_active,
    required this.image,
    required this.name,
    required this.CategoryId,
  });
}