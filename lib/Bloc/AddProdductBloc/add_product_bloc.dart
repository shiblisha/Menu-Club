
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/AddProductApi/addProductApi.dart';
import '../../Repository/ModelClass/AddProductModel.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  late AddProductModel AddproductData;
  AddProductApi addproductApi = AddProductApi();

  AddProductBloc() : super(AddProductInitial()) {
    on<FetchAddProduct>((event, emit)async {
      emit(AddProductblocLoading());
      try {
        AddproductData = await addproductApi.getAddProduct(
            shopId: event.shopId,

            name: event.name,
            price: event.price,
            description: event.description,
            image: event.image,
            image_extension:event.image_extension,
            is_active: event.is_active,
            category_id: event.category_id, cooking_time: event.cooking_time, is_veg: event.is_veg, is_recommended: event.is_recommended);

        emit(AddProductblocLoaded());
      } catch (e) {
        print(e);
        emit(AddProductblocError());
      }

    });
  }
}
