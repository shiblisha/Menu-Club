
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/UpdateStoreApi/updateStoreApi.dart';
import '../../Repository/ModelClass/UpdatStoreModel.dart';


part 'update_store_event.dart';
part 'update_store_state.dart';

class UpdateStoreBloc extends Bloc<UpdateStoreEvent, UpdateStoreState> {
  late UpdatStoreModel updatStoreModel;
UpdateStoreApi updateStoreApi= UpdateStoreApi();

  UpdateStoreBloc() : super(UpdateStoreInitial()) {
    on<FetchUpdateStore>((event, emit)async {
      emit(UpdateStoreBlocLoading());
      try{

        updatStoreModel = await updateStoreApi.getUpdateStore(password: event.password, shopId: event.ShopId, store_namestore_name: event.store_name, description: event.description, address: event.address, phone: event.phone);
        emit(UpdateStoreBlocLoaded());
      } catch(e){
        print(e);
        emit(UpdateStoreBlocError());}
    });
  }
}
