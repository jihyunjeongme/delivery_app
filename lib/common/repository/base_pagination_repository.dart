import 'package:login_authentication/common/model/cursor_pagination_model.dart';
import 'package:login_authentication/common/model/model_with_id.dart';
import 'package:login_authentication/common/model/pagination_params.dart';
import 'package:login_authentication/restaurant/model/restaurant_model.dart';

abstract class IBasePaginationRepository<T extends IModelWithId>{
  Future<CursorPagination<T>> paginate({
    PaginationParams? paginationParams = const PaginationParams(),
  });
}
