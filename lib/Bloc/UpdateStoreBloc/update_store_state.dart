part of 'update_store_bloc.dart';

@immutable
abstract class UpdateStoreState {}

class UpdateStoreInitial extends UpdateStoreState {}
class UpdateStoreBlocLoading extends UpdateStoreState{}
class UpdateStoreBlocLoaded extends UpdateStoreState{}
class UpdateStoreBlocError extends UpdateStoreState{}