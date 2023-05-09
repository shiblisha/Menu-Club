part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}
class FetchCategory extends CategoryEvent{
 int shopId;
 FetchCategory({required this.shopId});
}