part of 'update_product_bloc.dart';

@immutable
abstract class UpdateProductState {}

class UpdateProductInitial extends UpdateProductState {}
class UpdateProductblocLoading extends UpdateProductState{}
class UpdateProductblocLoaded extends UpdateProductState{

}
class UpdateProductblocError extends UpdateProductState{}