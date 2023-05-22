part of 'add_category_bloc.dart';

@immutable
abstract class AddCategoryState {}

class AddCategoryInitial extends AddCategoryState {}
class AddCategoryBlocLoading extends AddCategoryState{}
class AddCategoryBlocLoaded extends AddCategoryState{}
class AddCategoryBlocError extends AddCategoryState{}