import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../Repository/Api/UpdateCategoryApi/updateCategory.dart';
import '../../Repository/ModelClass/CategoryModel.dart';

part 'update_category_event.dart';
part 'update_category_state.dart';

class UpdateCategoryBloc extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  late CategoryModel UpdateCategoryModel;
  UpdateCategoryApi updateCategoryApi= UpdateCategoryApi();
  UpdateCategoryBloc() : super(UpdateCategoryInitial()) {
    on<FetchUpdateCategory>((event, emit)async {
      emit(UpdateCategoryBlocLoading());
      try{

        UpdateCategoryModel = await updateCategoryApi.getUpdateCategory(shopId: event.ShopId, name: event.name, image:event.image, image_extension:event.image_extension, is_active:event.is_active, CategoryId: event.CategoryId);
        emit(UpdateCategoryBlocLoaded());
      } catch(e){
        print(e);
        emit(UpdateCategoryBlocError());}
    });
  }
}
