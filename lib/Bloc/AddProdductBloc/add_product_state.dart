part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}
class AddProductblocLoading extends AddProductState{}
class AddProductblocLoaded extends AddProductState{}
class AddProductblocError extends AddProductState{}