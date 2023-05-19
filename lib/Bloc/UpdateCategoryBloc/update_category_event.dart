part of 'update_category_bloc.dart';

@immutable
abstract class UpdateCategoryEvent {}
class FetchUpdateCategory extends UpdateCategoryEvent{
  final int ShopId ;
  final int CategoryId;
  final int is_active;
  final String name;
  final String image;
  final String image_extension;
  FetchUpdateCategory({required this.ShopId,required this.image_extension,required this.is_active,required this.image,required this.name,required this.CategoryId,});
}
