
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/StoreApi/storeApi.dart';
import '../../Repository/ModelClass/StoreModel.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  late StoreModel storeModel;
  StoreApi storeApi= StoreApi();
  StoreBloc() : super(StoreInitial()) {
    on<FetchStore>((event, emit) async{
      emit(StoreBlocLoading());
      try{
      storeModel =  await storeApi.getStore(shopId: event.ShopId);
      emit(StoreBlocLoaded());
    } catch(e){
      print(e);
      emit(StoreBlocError());}
    });
  }
}
