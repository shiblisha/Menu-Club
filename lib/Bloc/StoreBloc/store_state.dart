part of 'store_bloc.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}
class StoreBlocLoading extends StoreState{}
class StoreBlocLoaded extends StoreState{}
class StoreBlocError extends StoreState{}

