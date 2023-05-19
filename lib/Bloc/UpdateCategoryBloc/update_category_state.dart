part of 'update_category_bloc.dart';

@immutable
abstract class UpdateCategoryState {}

class UpdateCategoryInitial extends UpdateCategoryState {}
class UpdateCategoryBlocLoading extends UpdateCategoryState{}
class UpdateCategoryBlocLoaded extends UpdateCategoryState{}
class UpdateCategoryBlocError extends UpdateCategoryState{}