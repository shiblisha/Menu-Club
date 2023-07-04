import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/UpdateProductsApi/updateProductsApi.dart';
import '../../Repository/ModelClass/UpdateProductModel.dart';
import '../../Repository/ModelClass/productModel.dart';

part 'update_product_event.dart';

part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  late UpdateProductModel UpdateproductData;
  UpdateProductApi updateproductApi = UpdateProductApi();

  UpdateProductBloc() : super(UpdateProductInitial()) {
    on<FetchUpdateProduct>((event, emit) async {
      emit(UpdateProductblocLoading());
      try {
        UpdateproductData = await updateproductApi.getUpdateProduct(
            shopId: event.shopId,
            ItemId: event.ItemId,
            name: event.name,
            price: event.price,
            description: event.description,
            image: event.image,
            image_extension:event.image_extension,
            is_active: event.is_active,
            category_id: event.category_id, cooking_time: event.cooking_time, is_veg: event.is_veg, is_recommended: event.is_recommended);

        emit(UpdateProductblocLoaded());
      } catch (e) {
        print(e);
        emit(UpdateProductblocError());
      }
      // TODO: implement event handler
    });
  }
}
